package com.gbicc.company.warnDisposal.update;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.gbicc.company.warnDisposal.entity.TCmCustomer;
import com.gbicc.company.warnDisposal.entity.TCmWarnTask;
import com.gbicc.company.warnDisposal.entity.TCmWarnTaskRel;
import com.gbicc.company.warnDisposal.operation.TCmWarnTaskOperation;
import com.gbicc.company.warnDisposal.service.TCmWarnTaskService;
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

public class TCmWarnTaskUpdate extends BaseUpdate {
	private static final String DATASET_ID ="TCmWarnTask";
	private static final String DATASET_ID2 ="TCmWarnTaskRel";
	private static final String DATASET_ID3 ="TCmCustomer";
	@Override
	public UpdateReturnBean saveOrUpdate(MultiUpdateResultBean arg0,
			HttpServletRequest arg1, HttpServletResponse arg2)
			throws AppException {
		try {
			UpdateReturnBean updateReturnBean = new UpdateReturnBean();
			UpdateResultBean updateResultBean = multiUpdateResultBean.getUpdateResultBeanByID(DATASET_ID);
			UpdateResultBean updateResultBean2 = multiUpdateResultBean.getUpdateResultBeanByID(DATASET_ID2);
			UpdateResultBean updateResultBean3 = multiUpdateResultBean.getUpdateResultBeanByID(DATASET_ID3);
			TCmWarnTask dd = new TCmWarnTask();
			OperationContext oc = new OperationContext();
			
			if(updateResultBean.getParameter("op")!=null){
				oc.setAttribute(TCmWarnTaskOperation.OP, updateResultBean.getParameter("op"));
			}
			//任务主信息
			if (updateResultBean.hasNext()) {
				@SuppressWarnings("rawtypes")
				Map map = updateResultBean.next();
				
				String id = null;
				if(map.get("id")!=null){
					id = map.get("id").toString();
				}
				if(map.get("opinion")!=null){
					oc.setAttribute(TCmWarnTaskOperation.OPINION, map.get("opinion"));
				}
				String taskAssignee = updateResultBean.getParameter("taskAssignee");
				if(taskAssignee==null){
					taskAssignee="";
				}
				oc.setAttribute("taskAssignee", taskAssignee);
				if(StringUtils.isBlank(id)) {
					dd = new TCmWarnTask();
					oc.setAttribute(TCmWarnTaskOperation.CMD,TCmWarnTaskOperation.CMD_INSERT);
				} else {
					dd = TCmWarnTaskService.getInstance().get((String) map.get("id"));
					oc.setAttribute(TCmWarnTaskOperation.CMD,TCmWarnTaskOperation.CMD_UPDATE);
				}
				mapToObject(dd, map);
			}
			oc.setAttribute(TCmWarnTaskOperation.IN_PARAM, dd);
			
			//客户信息
			TCmCustomer tCmCustomer = new TCmCustomer();
			if (updateResultBean3.hasNext()) {
				@SuppressWarnings("rawtypes")
				Map map = updateResultBean3.next();
				mapToObject(tCmCustomer, map);
			}
			oc.setAttribute("TCmCustomer", tCmCustomer);
			
			//预警信息
			List<TCmWarnTaskRel> tCmWarnTaskRelList=new ArrayList<TCmWarnTaskRel>();
			while(updateResultBean2.hasNext()){
				Map map=updateResultBean2.next();
				TCmWarnTaskRel tCmWarnTaskRel=new TCmWarnTaskRel();
				mapToObject(tCmWarnTaskRel, map);
				tCmWarnTaskRelList.add(tCmWarnTaskRel);
			}
			oc.setAttribute("TCmWarnTaskRel", tCmWarnTaskRelList);
			
			OPCaller.call(TCmWarnTaskOperation.ID, oc);
			return updateReturnBean;
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE,
					Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}

}
