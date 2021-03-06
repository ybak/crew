package com.gbicc.bpm.operation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.activiti.engine.task.Task;
import org.apache.commons.lang.StringUtils;

import com.gbicc.bpm.entity.TLoanAccountDutyDistribute;
import com.gbicc.bpm.entity.TPlAccountDistRecord;
import com.gbicc.bpm.service.ProcessManagerService;
import com.gbicc.bpm.service.TLoanAccountDutyDistributeService;
import com.gbicc.common.CommonService;
import com.gbicc.common.FileUpDownProperties;
import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.service.BctlService;
import com.huateng.ebank.business.management.service.TlrInfoService;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.operation.BaseOperation;
import com.huateng.ebank.framework.operation.OperationContext;

public class TLoanAccountDutyDistributeAllOperation extends BaseOperation {

	public static final String ID = TLoanAccountDutyDistributeAllOperation.class.getSimpleName();
	public static final String CMD = "CMD";
	public static final String CMD_QUERY = "CMD_QUERY";
	public static final String CMD_INSERT = "CMD_INSERT";
	public static final String CMD_UPDATE = "CMD_UPDATE";
	public static final String CMD_DELETE = "CMD_DELETE";
	public static final String IN_PARAM = "IN_PARAM";
	
	@Override
	public void afterProc(OperationContext context) throws CommonException {
	}

	@Override
	public void beforeProc(OperationContext context) throws CommonException {
	}

	@Override
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(OperationContext context) throws CommonException {
		String op = (String) context.getAttribute("op");
		String opinion = (String) context.getAttribute("opinion");
		String taskAssignee=(String) context.getAttribute("taskAssignee");
		String condition=(String) context.getAttribute("condition");
		String bankid=(String) context.getAttribute("bankid");
		TLoanAccountDutyDistribute distribute = (TLoanAccountDutyDistribute) context.getAttribute("TLoanAccountDutyDistribute");
		List<Map> recordList = (List<Map>) context.getAttribute("recordList");
		TLoanAccountDutyDistributeService service = TLoanAccountDutyDistributeService.getInstance();
		try {
			distribute.setDistFlag(TLoanAccountDutyDistributeOperation.DIST_FLAG_MUCH);
			if(StringUtils.isNotEmpty(distribute.getId())){
				service.update(distribute);
				taskComplete(distribute,op,opinion);
				service.update(distribute);//更改状态
			}else{
				service.save(distribute);
				startProcess(distribute,taskAssignee);
				service.update(distribute);//更改状态
			}
			
			CommonService commonService=CommonService.getInstance();
			commonService.executeHQL("delete from TLoanAccountRelDistribute where distId='"+distribute.getId()+"' ");
			//插入贷款账号与分派主表关联表
			commonService.executeSQL(getInsertSql(condition,bankid,distribute.getId(),distribute.getDistType()));			
			//保存分派后检查人表
			commonService.executeHQL("delete from TPlAccountDistRecord where distId='"+distribute.getId()+"' ");
			for(Map map:recordList){
				TPlAccountDistRecord record=new TPlAccountDistRecord();
				record.setId(null);
				record.setDistId(distribute.getId());
				commonService.save(record);
				//直接设置实体属性保存会报错，查询出来的对象是持久态的对象。
				if(map.get("brcode")!=null){
					record.setBrcode(BctlService.getInstance().getBctlByBrcode(map.get("brcode").toString()));
				}
				if(map.get("tlrno")!=null){
					record.setTlrno(TlrInfoService.getInstance().getTlrInfoByTlrno(map.get("tlrno").toString()));
				}
				commonService.update(record);
			}
		} catch(CommonException e){
			e.printStackTrace();
			throw new CommonException(e.getErrCode(),e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("系统异常",e.getMessage());
		}
	}
	
	//启动流程
	public void startProcess(TLoanAccountDutyDistribute distribute,String taskAssignee) throws Exception{
		GlobalInfo info=GlobalInfo.getCurrentInstance();
		String userId=info.getTlrno();
		String processKey = FileUpDownProperties.readValue(TLoanAccountDutyDistributeOperation.ACCOUNT_DUTY_PROCESS);
		ProcessManagerService procService=ProcessManagerService.getInstace();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("assignee",userId);
		map.put("desc","业务ID:"+distribute.getId()+"");
		procService.startProcess(distribute.getId(),processKey,userId,map);
		//流程往下走一步
		Task task=procService.getTaskService().createTaskQuery().processInstanceBusinessKey(distribute.getId()).singleResult();
		//Map<String,String> variables=procService.findTaskVariable(distribute.getId());
		Map<String,Object> nextMap=new HashMap<String, Object>();
		//List<String> assigneeList=procService.findUserIdByRoleidAndCurrOrgid(variables.get("nextRole"),distribute.getOperOrg().getBrcode());
		List<String> assigneeList=new ArrayList<String>();
		if(StringUtils.isNotEmpty(taskAssignee)){
			assigneeList.add(taskAssignee);
		}
		if(assigneeList==null || assigneeList.size()==0){
			throw new CommonException("未配置审核人","根据当前机构【"+distribute.getOperOrg().getBrname()+"】查找流程下一节点未找到审核人");
		}
		nextMap.put("operation","提交");
		nextMap.put("assigneeList",assigneeList);
		nextMap.put("desc","业务ID:"+distribute.getId()+"");
		procService.taskComplete(nextMap, task.getId());
		Map<String,String> variables2=procService.findTaskVariable(distribute.getId());
		distribute.setStatus(variables2.get("status"));
		distribute.setAplUser(assigneeList.get(0));
	}
	
	/**
	 * 任务完成
	 * @param distribute
	 * @throws Exception 
	 */
	public void taskComplete(TLoanAccountDutyDistribute distribute,String op,String opinion) throws Exception{
		GlobalInfo info=GlobalInfo.getCurrentInstance();
		String userId=info.getTlrno();
		ProcessManagerService processManagerService=ProcessManagerService.getInstace();
		String taskId=processManagerService.findTaskId(distribute.getId(), userId);
		//Map<String,String> variables=processManagerService.findTaskVariable(distribute.getId());
		Map<String, Object> map=new HashMap<String, Object>();
		if(op.equals("submit")){
			map.put("operation","审核通过");
			//map.put("path", "next");
			//List<String> assigneeList=processManagerService.findUserIdByRoleidAndOrgid(variables.get("nextRole"),distribute.getOperUser().getBrcode());
			map.put("path","end");
			map.put("businStatus",TLoanAccountDutyDistributeOperation.STATUS_APL_PASS);
		}else {
			map.put("operation","审核拒绝");
			map.put("path","end");
			map.put("businStatus",TLoanAccountDutyDistributeOperation.STATUS_APL_REFUSE);
		}
		map.put("opinion",opinion);
		map.put("desc","业务ID:"+distribute.getId()+"");
		processManagerService.taskComplete(map, taskId);
		Map<String,String> newVar=processManagerService.findTaskVariable(distribute.getId());
		if(newVar!=null && newVar.get("status")!=null){
			distribute.setStatus(newVar.get("status"));
		}
	}
	
	/**
	 * 插入贷款账号与分派主表关联表
	 * @param condition
	 * @param bankid
	 * @param distId
	 * @return
	 */
	public String getInsertSql(String condition,String bankid,String distId,String distType){
		String sql="INSERT INTO T_PL_ACCOUNT_REL_DISTRIBUTE "+
		"SELECT UUID(),'"+distId+"',A.LOANACNO FROM T_EDW_PLS_ACCOUNT A "+
		"LEFT JOIN T_PL_ACCOUNT_REL_DUTY DD ON A.LOANACNO=DD.FD_LOANACNO "+
		"WHERE LOANACNO NOT IN (SELECT T.LOANACNO FROM (SELECT A.LOANACNO FROM T_PL_ACCOUNT_DUTY_DISTRIBUTE D "+
		"JOIN T_EDW_PLS_ACCOUNT A ON D.FD_LOANACNO=A.LOANACNO "+
		"LEFT JOIN T_PL_ACCOUNT_REL_DUTY RD ON A.LOANACNO=RD.FD_LOANACNO "+
		"JOIN ACT_RU_EXECUTION E ON D.FD_ID=E.BUSINESS_KEY_ "+
		"WHERE A.PAYOFFFLAG='00' AND A.PRODID NOT IN ('93010200','96010200','96010100','93010100') AND D.FD_DIST_TYPE='"+distType+"' "+
		"AND A.BANKID='"+bankid+"' AND D.FD_STATUS!='"+TLoanAccountDutyDistributeOperation.STATUS_APL_PASS+"' AND E.BUSINESS_KEY_ IS NOT NULL "+
		"UNION "+
		"SELECT A.LOANACNO FROM T_PL_ACCOUNT_REL_DISTRIBUTE R "+
		"JOIN T_PL_ACCOUNT_DUTY_DISTRIBUTE D ON R.FD_DIST_ID=D.FD_ID "+
		"JOIN T_EDW_PLS_ACCOUNT A ON R.FD_LOANACNO=A.LOANACNO "+
		"LEFT JOIN T_PL_ACCOUNT_REL_DUTY RD ON A.LOANACNO=RD.FD_LOANACNO "+
		"JOIN ACT_RU_EXECUTION E ON D.FD_ID=E.BUSINESS_KEY_ "+
		"WHERE A.PAYOFFFLAG='00' AND A.PRODID NOT IN ('93010200','96010200','96010100','93010100') AND D.FD_DIST_TYPE='"+distType+"' "+
		"AND A.BANKID='"+bankid+"' AND D.FD_STATUS!='"+TLoanAccountDutyDistributeOperation.STATUS_APL_PASS+"' AND E.BUSINESS_KEY_ IS NOT NULL) T)"+
		"AND A.PAYOFFFLAG='00' "+
		"AND A.PRODID NOT IN ('93010200','96010200','96010100','93010100') AND A.BANKID='"+bankid+"' ";
		if(StringUtils.isNotEmpty(condition)){
			JSONObject json=JSONObject.fromObject(condition);
			if(json.get("acctNo")!=null && StringUtils.isNotEmpty(json.getString("acctNo"))){
				sql+=" and a.loanacno='"+json.getString("acctNo")+"' ";
			}
			if(json.get("prodname")!=null && StringUtils.isNotEmpty(json.getString("prodname"))){
				sql+=" and a.prodname like '%"+json.getString("prodname")+"%' ";
			}
			if(json.get("custname")!=null && StringUtils.isNotEmpty(json.getString("custname"))){
				sql+=" and a.custname like '%"+json.getString("custname")+"%' ";
			}
			if(json.get("acflag")!=null && StringUtils.isNotEmpty(json.getString("acflag"))){
				sql+=" and a.acflag='"+json.getString("acflag")+"' ";
			}
			if(json.get("acflag2")!=null && StringUtils.isNotEmpty(json.getString("acflag2"))){
				sql+=" and a.acflag2='"+json.getString("acflag2")+"' ";
			}
			if(json.get("riskflag")!=null && StringUtils.isNotEmpty(json.getString("riskflag"))){
				sql+=" and a.riskflag='"+json.getString("riskflag")+"' ";
			}
			if(json.get("dutyid")!=null && StringUtils.isNotEmpty(json.getString("dutyid"))){
				if(distType.equals(TLoanAccountDutyDistributeOperation.DIST_TYPE_DUTY)){
					sql+=" and (CASE WHEN DD.FD_DUTYID IS NOT NULL THEN DD.FD_DUTYID ELSE A.DUTYID END)='"+json.getString("dutyid")+"' ";
				}else{
					sql+=" and (CASE WHEN DD.FD_COLLID IS NOT NULL THEN DD.FD_COLLID ELSE A.DUTYID2 END)='"+json.getString("dutyid")+"' ";
				}
			}
		}
		return sql;
	}
}