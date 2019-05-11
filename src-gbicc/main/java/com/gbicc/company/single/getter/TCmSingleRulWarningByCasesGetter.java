package com.gbicc.company.single.getter;

import org.apache.commons.lang3.StringUtils;

import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.entity.dao.mng.ROOTDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

@SuppressWarnings("unchecked")
public class TCmSingleRulWarningByCasesGetter extends BaseGetter {

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
		String casesId = (String) getCommQueryServletRequest().getParameterMap().get("casesId");
		String warningIds=(String) getCommQueryServletRequest().getParameterMap().get("warningIds");
		PageQueryResult pageQueryResult = new PageQueryResult();
		// 分页大小
		int pageSize = getResult().getPage().getEveryPage();
		// 页码
		int pageIndex = getResult().getPage().getCurrentPage();

		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		StringBuffer hql = new StringBuffer("from TCmSingleRulWarning t where 1=1 ");
		if(StringUtils.isNotEmpty(casesId)){
			hql.append(" and casesId='"+casesId+"' ");
		}
		if(StringUtils.isNotEmpty(warningIds)){
			if(!(warningIds.equals("0"))){
				String ids="";
				if(warningIds.indexOf(",")>-1){
					String[] str=warningIds.split(",");
					for(String s:str){
						ids=ids+"'"+s+"'"+",";
					}
					ids=ids.substring(0,ids.length()-1);
				}else{
					ids="'"+warningIds+"'";
				}
				hql.append(" and id in ("+ids+") ");
			}else{
				hql.append(" and 1=2 ");
			}
		}
		pageQueryResult = rootdao.pageQueryByHql(pageIndex, pageSize,
				hql.toString());
		return pageQueryResult;
	}
}