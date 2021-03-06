package com.gbicc.person.great.getter;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.entity.dao.mng.DataDicDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.entity.data.mng.DataDic;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

/**
 * 重大事件下拉框
 * 2016年1月8日14:30:18
 *
 */
@SuppressWarnings("unchecked")
public class SubAutoGreatEventGetter extends BaseGetter {
	
	/**
	 * 自然人客户
	 */
	public static final String ZRR_DTL_DIC="1";
	/**
	 * 法人客户
	 */
	public static final String FR_DTL_DIC="2";
	/**
	 * 合作方客户
	 */
	public static final String HZF_DTL_DIC="3";
	/**
	 * 客户重大事件字典编号
	 */
	public static final Integer KF_GREAT_EVENT_DIC=118;
	/**
	 * 法人客户重大事件字典编号
	 */
	public static final Integer FR_GREAT_EVENT_DIC=126;
	/**
	 * 合作方重大事件字典编号
	 */
	public static final Integer HZF_GREAT_EVENT_DIC=119;
	
	public Result call() throws CommonException {
		List<DataDic> returnList = new ArrayList<DataDic>();		
		List<DataDic> list = new ArrayList<DataDic>();
		try {
			String val = this.getCommQueryServletRequest().getParameter("value");
			String atteMain=this.getCommQueryServletRequest().getParameter("atteMain");
			if (StringUtils.isNotBlank(val)) {
				list = this.getTlrs(val,atteMain);
			} else {
				list = this.getAllSubList(atteMain);
			}
			returnList = getList(list);
			ResultMng.fillResultByList(getCommonQueryBean(),getCommQueryServletRequest(),returnList,getResult());
		} catch (AppException e) {
			e.printStackTrace();
		}
		result.setContent(returnList);
		int pageSize = result.getPage().getEveryPage();
		int pageCount = (list.size() - 1) / pageSize + 1;
		result.getPage().setTotalPage(pageCount);
		result.init();
		return result;
	}

	@SuppressWarnings("rawtypes")
	public List getAllSubList(String atteMain) throws CommonException {
		DataDicDAO dataDicDao = ROOTDAOUtils.getDataDicDAO();
		Integer dic=null;
		if(atteMain.equals(ZRR_DTL_DIC)){
			dic=KF_GREAT_EVENT_DIC;
		}else if(atteMain.equals(FR_DTL_DIC)){
			dic=FR_GREAT_EVENT_DIC;
		}else{
			dic=HZF_GREAT_EVENT_DIC;
		}
		String whileStr=" 1=1 and dataTypeNo="+dic+" ";
		List list = dataDicDao.queryByCondition(whileStr);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List getTlrs(String val,String atteMain) throws CommonException {
		DataDicDAO dataDicDao = ROOTDAOUtils.getDataDicDAO();
		List list = new ArrayList();
		Integer dic=null;
		if(atteMain.equals(ZRR_DTL_DIC)){
			dic=KF_GREAT_EVENT_DIC;
		}else if(atteMain.equals(FR_DTL_DIC)){
			dic=FR_GREAT_EVENT_DIC;
		}else{
			dic=HZF_GREAT_EVENT_DIC;
		}
		String sql = " 1=1 and dataTypeNo="+dic;
		if(StringUtils.isNotBlank(val)){
			sql+=" and po.dataName like '%"+val+"%' ";
		}
		list = dataDicDao.queryByCondition(sql);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List getList(List list) {
		int pageSize = this.getResult().getPage().getEveryPage();
		int pageIndex = this.getResult().getPage().getCurrentPage();
		int startRow = (pageIndex - 1) * pageSize;
		int endRow = startRow + pageSize;
		List tlrs = new ArrayList();
		if (list != null && !list.isEmpty()) {
			for (; startRow < endRow; startRow++) {
				tlrs.add(list.get(startRow));
				if (startRow == list.size() - 1) {
					break;
				}
			}
		}
		return tlrs;
	}
}
