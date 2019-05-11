package com.gbicc.bpm.operation;

import org.springframework.jdbc.core.JdbcTemplate;

import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.operation.BaseOperation;
import com.huateng.ebank.framework.operation.OperationContext;
import com.huateng.ebank.framework.util.ApplicationContextUtils;

public class TaskDivertPOperation extends BaseOperation{
	public static final String ID = "TaskDivertPOperation";
	public static final String DKH = "DKH";
	public static final String DGZ = "DGZ";
	public static final String UPDATE = "UPDATE";
	public static final String INSERT = "INSERT";
	public static final String DELETE = "DELETE";
	
	@Override
	public void afterProc(OperationContext context) throws CommonException {
		
	}

	@Override
	public void beforeProc(OperationContext context) throws CommonException {
		
	}

	@Override
	public void execute(OperationContext context) throws CommonException {
		//operation info
		GlobalInfo info=GlobalInfo.getCurrentInstance();
		String userId=info.getTlrno();
		//services
		
		//logic
		if (UPDATE.equals(context.getAttribute("type"))) {
			//comm
			JdbcTemplate jdbcTemplate = (JdbcTemplate) ApplicationContextUtils
					.getBean("JdbcTemplate");
			//update data
			String id = (String) context.getAttribute("id");
			String selectTlrNo = (String) context.getAttribute("selectTlrNo");
			String selectBrCode = (String) context.getAttribute("selectBrCode");
			//operation
			if(DKH.equals(context.getAttribute("taskType"))){
				//更新机构
				StringBuffer updateBrCode=new StringBuffer();
				updateBrCode.append(
						" UPDATE T_CM_WARN_TASK T "
						+ " SET "
						+ " T.FD_TASK_ORG = '"
						+ selectBrCode
						+ "' "
						+ " WHERE T.FD_ID = '"
						+ id
						+ "'"
						);
				jdbcTemplate.execute(updateBrCode.toString());
				//更新处理人
				StringBuffer updateTlrNo=new StringBuffer();
				updateTlrNo.append(
						" UPDATE ACT_RU_TASK T "
						+ " SET T.ASSIGNEE_ = '"
						+ selectTlrNo
						+ "' "
						+ " WHERE "
						+ " T.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"
						+ id
						+ "' ) "
						);
				jdbcTemplate.execute(updateTlrNo.toString());
				//更新历史表ACT_HI_TASKINST中处理人
				StringBuffer updateHITlrNo=new StringBuffer(
						" UPDATE ACT_HI_TASKINST HI "
						+ " SET HI.ASSIGNEE_ = '"+selectTlrNo+"' "
						+ " WHERE HI.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"+id+"' "
						+ " ) "
						+ " AND HI.TASK_DEF_KEY_ IN ('R601_1','R601_2') ");
				jdbcTemplate.execute(updateHITlrNo.toString());
				//更新历史表ACT_HI_ACTINST中处理人
				StringBuffer updateHIActinstAss=new StringBuffer(
						" UPDATE ACT_HI_ACTINST HI "
						+ " SET HI.ASSIGNEE_ = '"+selectTlrNo+"' "
						+ " WHERE HI.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"+id+"' "
						+ " ) "
						+ " AND HI.ACT_ID_ IN ('R601_1','R602') ");
				jdbcTemplate.update(updateHIActinstAss.toString());
				//更新任务列表中核查人员
				StringBuffer updateInspectors=new StringBuffer(
						" UPDATE T_CM_WARN_TASK WT "
						+ " SET WT.FD_INSPECTORS = '"+selectTlrNo+"' "
						+ " WHERE WT.FD_ID LIKE '"+id+"' ");
				jdbcTemplate.execute(updateInspectors.toString());
				//更新历史列表中提交人
//				StringBuffer updateHITlrNo2=new StringBuffer(
//						" update act_hi_actinst i " 
//						+ " set i.assignee_ = '"+selectTlrNo+"' "
//						+ " WHERE i.PROC_INST_ID_ IN ( "
//						+ " SELECT PROC_INST_ID_ " 
//						+ " FROM act_hi_actinst " 
//						+ " WHERE task_id_ IN ( "
//						+ " SELECT id_ " 
//						+ " FROM ACT_HI_TASKINST " 
//						+ " WHERE proc_inst_id_ IN ( "
//						+ " SELECT proc_inst_id_ " 
//						+ " FROM ACT_HI_PROCINST " 
//						+ " WHERE business_key_='"+id+"' "
//						+ " ) "
//						+ " ) "
//						+ " ) "
//						+ " AND i.END_TIME_ IS NOT NULL " 
//						+ " AND EXISTS ( "
//						+ " SELECT t.id_ "
//						+ " FROM ACT_HI_TASKINST t " 
//						+ " WHERE t.TASK_DEF_KEY_=i.act_id_ " 
//						+ " AND t.delete_reason_<>'deleted' "
//						+ " ) "
//						+ " AND I.ACT_ID_ IN ('R601_1','R602') ");
//				jdbcTemplate.execute(updateHITlrNo2.toString());
			}else if(DGZ.equals(context.getAttribute("taskType"))){
				//update brcode
				StringBuffer updateBrCode=new StringBuffer();
				updateBrCode.append(
						" UPDATE T_CM_SINGLE_RUL_WARNING T "
						+ " SET "
						+ " T.FD_TASK_ORG = '"
						+ selectBrCode
						+ "' "
						+ " WHERE T.FD_ID = '"
						+ id
						+ "'"
						);
				jdbcTemplate.execute(updateBrCode.toString());
				//update tlrno
				StringBuffer updateTlrNo=new StringBuffer();
				updateTlrNo.append(
						" UPDATE ACT_RU_TASK T "
						+ " SET T.ASSIGNEE_ = '"
						+ selectTlrNo
						+ "' "
						+ " WHERE "
						+ " T.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"
						+ id
						+ "' ) "
						);
				jdbcTemplate.execute(updateTlrNo.toString());
				//更新历史表ACT_HI_TASKINST中处理人
				StringBuffer updateHITlrNo=new StringBuffer(
						" UPDATE ACT_HI_TASKINST HI "
						+ " SET HI.ASSIGNEE_ = '"+selectTlrNo+"' "
						+ " WHERE HI.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"+id+"' "
						+ " ) "
						+ " AND HI.TASK_DEF_KEY_ IN ('R560_1','R603_1') ");
				jdbcTemplate.execute(updateHITlrNo.toString());
				//更新历史表ACT_HI_ACTINST中处理人
				StringBuffer updateHIActinstAss=new StringBuffer(
						" UPDATE ACT_HI_ACTINST HI "
						+ " SET HI.ASSIGNEE_ = '"+selectTlrNo+"' "
						+ " WHERE HI.PROC_INST_ID_ IN "
						+ " ( "
						+ " SELECT E.PROC_INST_ID_ "
						+ " FROM ACT_RU_EXECUTION E "
						+ " WHERE E.BUSINESS_KEY_ LIKE '"+id+"' "
						+ " ) "
						+ " AND HI.ACT_ID_ IN ('R560_1','R603_1') ");
				jdbcTemplate.update(updateHIActinstAss.toString());
				//查找总行标识
				if ("00001".equals(selectBrCode)) {
					StringBuffer updateOrgHeadFlag = new StringBuffer(
							" UPDATE T_CM_SINGLE_RUL_WARNING SW "
									+ " SET SW.FD_HANDLE_ORG_FLAG = 'head' "
									+ " WHERE SW.FD_ID LIKE '" + id + "'");
					jdbcTemplate.execute(updateOrgHeadFlag.toString());
				} else {
					StringBuffer updateOrgHeadFlag = new StringBuffer(
							" UPDATE T_CM_SINGLE_RUL_WARNING SW "
									+ " SET SW.FD_HANDLE_ORG_FLAG = 'sub' "
									+ " WHERE SW.FD_ID LIKE '" + id + "'");
					jdbcTemplate.execute(updateOrgHeadFlag.toString());
				}
				//更新任务列表中核查人员
//				StringBuffer updateInspectors=new StringBuffer(
//						" UPDATE T_CM_WARN_TASK WT "
//						+ " SET WT.FD_INSPECTORS = '"+selectTlrNo+"' "
//						+ " WHERE WT.FD_ID LIKE '"+id+"' ");
			}
		}
	}

}