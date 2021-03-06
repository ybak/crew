package com.gbicc.company.warnDisposal.getter;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.gbicc.bpm.service.ProcessManagerService;
import com.gbicc.company.warnDisposal.entity.TCmCustomer;
import com.gbicc.company.warnDisposal.entity.TCmWarnTask;
import com.gbicc.company.warnDisposal.service.TCmCustomerService;
import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.business.common.service.BctlService;
import com.huateng.ebank.business.management.service.TlrInfoService;
import com.huateng.ebank.entity.dao.mng.ROOTDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.entity.data.mng.Bctl;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

@SuppressWarnings("unchecked")
public class TCmWarnTaskSelectGetter extends BaseGetter {
	
	@Override
	public Result call() throws AppException {
		try {
			PageQueryResult pageResult = getData();
			ResultMng.fillResultByList(getCommonQueryBean(),
					getCommQueryServletRequest(), pageResult.getQueryResult(),
					getResult());
			result.setContent(pageResult.getQueryResult());
			result.getPage().setTotalPage(
					pageResult.getPageCount(getResult().getPage()
							.getEveryPage()));
			result.init();
			return result;
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE,
					Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}

	protected PageQueryResult getData() throws Exception {
		String id = (String) getCommQueryServletRequest().getParameterMap().get("id");
		String taskId = (String) getCommQueryServletRequest().getParameterMap().get("taskId");
		String customerId = (String) getCommQueryServletRequest().getParameterMap().get("customerId");
		String status = (String) getCommQueryServletRequest().getParameterMap().get("status");
		String startType = (String) getCommQueryServletRequest().getParameterMap().get("startType");
		String taskCode = (String) getCommQueryServletRequest().getParameterMap().get("taskCode");
		String custcode = (String) getCommQueryServletRequest().getParameterMap().get("custcode");
		String custname = (String) getCommQueryServletRequest().getParameterMap().get("custname");
		String operator = (String) getCommQueryServletRequest().getParameterMap().get("operator");
		String operBank = (String) getCommQueryServletRequest().getParameterMap().get("operBank");
		String warnLevel = (String) getCommQueryServletRequest().getParameterMap().get("warnLevel");
		String warnCode = (String) getCommQueryServletRequest().getParameterMap().get("warnCode");
		String CreatDateStart = (String) getCommQueryServletRequest().getParameterMap().get("CreatDateStart");
		String CreatDateEnd = (String) getCommQueryServletRequest().getParameterMap().get("CreatDateEnd");
		
		String order = (String) getCommQueryServletRequest().getParameterMap().get("order");
		String sortField = (String) getCommQueryServletRequest().getParameterMap().get("sortField");

		/*start---2016年7月15日由于框架使用远程排序时，页面点击翻页按钮再次请求数据order与sortField会变成null，故存放到req的session中  */
		HttpSession session = httpReq.getSession();
		if(sortField!=null && (!sortField.equals("")) && order!=null && (!order.equals(""))){
			session.setAttribute(this.getClass().getName()+"order",order);
			session.setAttribute(this.getClass().getName()+"sortField",sortField);
		}else{
			order=(String) session.getAttribute(this.getClass().getName()+"order");
			sortField=(String) session.getAttribute(this.getClass().getName()+"sortField");
		}
		/*end---2016年7月15日由于框架使用远程排序时，页面点击翻页按钮再次请求数据order与sortField会变成null，故存放到req的session中  */
		
		PageQueryResult pageQueryResult = new PageQueryResult();
		// 分页大小
		int pageSize = getResult().getPage().getEveryPage();
		// 页码
		int pageIndex = getResult().getPage().getCurrentPage();

		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		
		GlobalInfo info=GlobalInfo.getCurrentInstance();
		String userId=info.getTlrno();
		//ProcessManagerService processManagerService=ProcessManagerService.getInstace();
		//String businessIds=processManagerService.findBusinessKeyByMySelf(userId);
		
		StringBuffer hql = new StringBuffer("from TCmWarnTask t where 1=1 ");
		Bctl bctl=BctlService.getInstance().getBctlByBrno(info.getBrcode());
		if(!"1".equals(bctl.getBrclass())){//总行层级查询所有的
			if("2".equals(bctl.getBrclass())){//分支行 查询自己的 或者子机构的
				hql.append(" and (t.tCmCustomer.operator = '"+info.getTlrno()+"' or t.tCmCustomer.operBank in (select brno from Bctl where blnUpBrcode='"+info.getBrcode()+"' ) )  ");
			}if("602".equals(info.getWorkflowRoleId())){
				hql.append(" and (t.tCmCustomer.operator = '"+info.getTlrno()+"' or t.tCmCustomer.operBank ='"+info.getBrcode()+"' )   ");
			}else{
				hql.append(" and exists (select 1 from ActiveHisTask t2 where t.id=t2.businessKey and assignee='"+info.getTlrno()+"' )  ");
			}
		}
		
		if(StringUtils.hasText(id)){
			hql.append(" and t.id = '"+id+"'");
		}else if(StringUtils.hasText(taskId)){
			hql.append(" and t.id = '"+taskId+"'");
		}
		if(StringUtils.hasText(status)){
			hql.append(" and t.status = '"+status+"'");
		}
		if(StringUtils.hasText(startType)){
			hql.append(" and t.startType = '"+startType+"'");
		}
		if(StringUtils.hasText(taskCode)){
			hql.append(" and t.taskCode like '%"+taskCode+"%'");
		}
		if(StringUtils.hasText(custcode)){
			hql.append(" and t.tCmCustomer.custcode like '%"+custcode+"%'");
		}
		if(StringUtils.hasText(custname)){
			hql.append(" and t.tCmCustomer.custname like '%"+custname+"%'");
		}
		if(StringUtils.hasText(CreatDateStart)){
			hql.append(" and to_char(t.taskCreatDate,'yyyyMMdd')>='"+CreatDateStart+"' ");
		}
		if(StringUtils.hasText(CreatDateEnd)){
			hql.append(" and to_char(t.taskCreatDate,'yyyyMMdd')<='"+CreatDateEnd+"' ");
		}
		//20160922修改，主管岗在查询客户预警任务时，输入经办人查询条件，会错误的显示该经办人转移出去的任务。将经办人查询字段有tCmCustomer.operator改为inspectors 解决
		if(StringUtils.hasText(operator)){
			hql.append(" and t.inspectors = '"+operator+"'");
		}
		if(StringUtils.hasText(warnLevel)){
			hql.append(" and t.warnLevel = '"+warnLevel+"'");
		}
		if(StringUtils.hasText(operBank)){
			hql.append(" and t.tCmCustomer.operBank = '"+operBank+"'");
		}
		if(StringUtils.hasText(warnCode)){
			hql.append(" and exists (select 1 from TCmWarnTaskRel tr"
					+ "	 where t.id=tr.taskId and tr.warnCode like '%"+warnCode+"%' ) ");
		}
		String orderby=" order by t.updateTime  desc ";
		if(sortField!=null && (!sortField.equals("")) && order!=null && (!order.equals(""))){
			if(sortField.equals("custcode")||sortField.equals("custname")){
				orderby=" order by t.tCmCustomer."+sortField+" "+order;
			}else if(sortField.equals("inspectorsNam")){
				orderby=" order by t.inspectors "+order;
			}else{
				orderby=" order by "+sortField+" "+order;
			}
		}
		hql.append(orderby);
		
		pageQueryResult = rootdao.pageQueryByHql(pageIndex, pageSize,hql.toString());
		//pageQueryResult.setQueryResult(rootdao.queryByCondition(hql.toString()));
		if(StringUtils.hasText(customerId)){
			List list=pageQueryResult.getQueryResult();
			for (int i = 0; i < list.size(); i++) {
				TCmWarnTask tCmWarnTask=(TCmWarnTask)list.get(i);
				if(!StringUtils.hasText(tCmWarnTask.getInspectors())){
					tCmWarnTask.setInspectors(userId);
				}
				if(tCmWarnTask.getInspeCitDate()==null){
					tCmWarnTask.setInspeCitDate(new Date());
				}
				if(tCmWarnTask.gettCmCustomer()!=null){
					tCmWarnTask.setWarnLevel(tCmWarnTask.gettCmCustomer().getCustWarnLevel());
				}
				if("5".equals(status)){//待填报告状态时 客户经理点击 12593
					if(tCmWarnTask.getDisposalPer()==null){
						tCmWarnTask.setDisposalPer(userId);
					}
					if(tCmWarnTask.getDispoCitDate()==null){
						tCmWarnTask.setDispoCitDate(new Date());
					}
				}
			}
			
		}
		
		return pageQueryResult;
	}
}
