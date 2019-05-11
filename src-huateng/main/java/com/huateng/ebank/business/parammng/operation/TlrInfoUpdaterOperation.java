/*
 * Created on 2005-5-11
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.huateng.ebank.business.parammng.operation;

import java.util.Iterator;
import java.util.List;

import com.huateng.common.DataObjectUtils;
import com.huateng.ebank.business.common.DAOUtils;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.entity.dao.mng.TlrRoleRelDAO;
import com.huateng.ebank.entity.data.mng.TlrInfo;
import com.huateng.ebank.entity.data.mng.TlrRoleRel;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.operation.BaseOperation;
import com.huateng.ebank.framework.operation.OperationContext;

/**
 * @author wuguangjie
 * 
 *         TODO To change the template for this generated type comment go to
 *         Window - Preferences - Java - Code Style - Code Templates
 */
public class TlrInfoUpdaterOperation extends BaseOperation {

	public static final String CMD = "CMD";
	public static final String TLRNO = "TLRNO";
	public static final String ROLEID = "ROLEID";
	public static final String ORGID = "ORGID";
	public static final String CHANGESEFAULT = "CHANGESEFAULT";

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.huateng.ebank.framework.operation.IOperation#beforeProc(com.huateng
	 * .ebank.framework.operation.OperationContext)
	 */
	public void beforeProc(OperationContext context) throws CommonException {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.huateng.ebank.framework.operation.IOperation#execute(com.huateng.
	 * ebank.framework.operation.OperationContext)
	 */
	public void execute(OperationContext context) throws CommonException {
		String cmd = (String) context.getAttribute(CMD);
		String tlrno = (String) context.getAttribute(TLRNO);
		TlrInfo tlrinfo = DAOUtils.getTlrInfoDAO().queryById(tlrno);
		if ("del".equals(cmd)) {
			List tlrref = DAOUtils.getTlrRoleRelDAO().queryByCondition("tlrno="+tlrno);
			for (Iterator it = tlrref.iterator(); it.hasNext();) {
				TlrRoleRel ref = (TlrRoleRel) it.next();
				DAOUtils.getTlrRoleRelDAO().delete(ref);
			}
			DAOUtils.getTlrInfoDAO().delete(tlrno);
			
		} else if ("CHANGESEFAULT".equals(cmd)) {
			Integer roleId =Integer.valueOf((String)context.getAttribute(ROLEID));
			String orgId =((String)context.getAttribute(ORGID));
			DAOUtils.getTlrRoleRelDAO().changeDefault(tlrno,roleId);
			DAOUtils.getTlrRoleRelDAO().changeDefaultOrg(tlrno, orgId);
		} else if ("unlock".equals(cmd)) {
			tlrinfo.setIsLock("0");
			DAOUtils.getTlrInfoDAO().update(tlrinfo);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.huateng.ebank.framework.operation.IOperation#afterProc(com.huateng
	 * .ebank.framework.operation.OperationContext)
	 */
	public void afterProc(OperationContext context) throws CommonException {
		// TODO Auto-generated method stub

	}
}