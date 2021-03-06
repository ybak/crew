package com.gbicc.person.monitor.update;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.gbicc.person.monitor.entity.TPlYjReport;
import com.gbicc.person.monitor.operation.TPlYjReportOperation;
import com.gbicc.person.monitor.service.TPlYjReportService;
import com.gbicc.warn.entity.TWarnSignal;
import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.MultiUpdateResultBean;
import com.huateng.commquery.result.UpdateResultBean;
import com.huateng.commquery.result.UpdateReturnBean;
import com.huateng.ebank.framework.operation.OPCaller;
import com.huateng.ebank.framework.operation.OperationContext;
import com.huateng.ebank.framework.web.commQuery.BaseUpdate;
import com.huateng.exception.AppException;

public class TPlYjReportUpdate extends BaseUpdate{
	
	private static final String DATASET_ID = "YjMonitorReportWin";
	private static final String DATASET_ID2 = "plWarnSignal";

	@Override
	public UpdateReturnBean saveOrUpdate(MultiUpdateResultBean arg0,
			HttpServletRequest arg1, HttpServletResponse arg2)
			throws AppException {
		try {
			UpdateReturnBean updateReturnBean = new UpdateReturnBean();
			UpdateResultBean updateResultBean = multiUpdateResultBean.getUpdateResultBeanByID(DATASET_ID);
			UpdateResultBean updateResultBean2 = multiUpdateResultBean.getUpdateResultBeanByID(DATASET_ID2);
			
			String businessId = updateResultBean.getParameter("businessId");
			String taskAssignee=updateResultBean.getParameter("taskAssignee");//接收人
			String op=updateResultBean.getParameter("op");
			String opinion="";
			String fdLoanAccount=null;
			if(null==op){
				op="";
			}
			
			if(null==taskAssignee){
				taskAssignee="";
			}
			//处理报告基础信息
			TPlYjReport ajReport = new TPlYjReport();
			OperationContext oc = new OperationContext();
			oc.setAttribute(TPlYjReportOperation.BUSINESS_ID,businessId);
			oc.setAttribute("taskAssignee",taskAssignee);
			oc.setAttribute(TPlYjReportOperation.OP,op);
			if (updateResultBean.hasNext()) {
				@SuppressWarnings("rawtypes")
				Map map = updateResultBean.next();
				String  id=(String) map.get("fdId");
				fdLoanAccount=(String) map.get("fdLoanAccount");
				String recordState = map.get("recordState").toString();
				
				if(StringUtils.isNotEmpty(id)) {
					ajReport = TPlYjReportService.getInstance().get(id);
					oc.setAttribute(TPlYjReportOperation.CMD,TPlYjReportOperation.CMD_UPDATE);
					
					} else  {
						ajReport = new TPlYjReport();
						oc.setAttribute(TPlYjReportOperation.CMD, TPlYjReportOperation.CMD_INSERT);
				
				}
				mapToObject(ajReport,map);
			}
			oc.setAttribute(TPlYjReportOperation.IN_PARAM,ajReport);
			opinion=ajReport.getFdApplyOpin();//审核意见
			if(!opinion.equals("")){
				oc.setAttribute(TPlYjReportOperation.OPINION,ajReport.getFdApplyOpin());
			}
			
			

			//设置预警信号 集合
		   List<TWarnSignal> warnSignals=new ArrayList<TWarnSignal>();
		   while(updateResultBean2.hasNext()){
			   Map map=updateResultBean2.next();
			   TWarnSignal warnSignal=new TWarnSignal();
			   mapToObject(warnSignal, map);
			   warnSignal.setLoanAccount(fdLoanAccount);
			   warnSignals.add(warnSignal);
		   }
		   oc.setAttribute(TPlYjReportOperation.WARNING_SIGNALS, warnSignals);
		   
			OPCaller.call(TPlYjReportOperation.ID, oc);
			return updateReturnBean;
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE,
				Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}
}
