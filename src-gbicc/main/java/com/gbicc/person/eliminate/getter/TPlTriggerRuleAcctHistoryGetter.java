package com.gbicc.person.eliminate.getter;

import java.util.List;

import org.springframework.util.StringUtils;

import com.gbicc.bpm.entity.TLoanAccountRelDuty;
import com.gbicc.bpm.service.TLoanAccountRelDutyService;
import com.gbicc.person.eliminate.entity.TPlRuleEliminate;
import com.gbicc.personCommon.entity.TEdwPlsAccount;
import com.gbicc.personCommon.entity.TEdwPlsCust;
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
import com.huateng.ebank.entity.data.mng.TlrInfo;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

public class TPlTriggerRuleAcctHistoryGetter extends BaseGetter {

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

	@SuppressWarnings("rawtypes")
	protected PageQueryResult getData() throws Exception {
		
		String loanacno = (String) getCommQueryServletRequest().getParameterMap().get("loanacno");
		String custname = (String) getCommQueryServletRequest().getParameterMap().get("custname");
		String opername = (String) getCommQueryServletRequest().getParameterMap().get("opername");
		String bankname = (String) getCommQueryServletRequest().getParameterMap().get("bankname");
		String launchPer = (String) getCommQueryServletRequest().getParameterMap().get("launchPer");
		String createTimeStart = (String) getCommQueryServletRequest().getParameterMap().get("createTimeStart");
		String createTimeEnd = (String) getCommQueryServletRequest().getParameterMap().get("createTimeEnd");
		PageQueryResult pageQueryResult = new PageQueryResult();
		// 分页大小
		int pageSize = getResult().getPage().getEveryPage();
		// 页码
		int pageIndex = getResult().getPage().getCurrentPage();

		ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
		StringBuffer hql = new StringBuffer("from TPlRuleEliminate t where 1=1 ");
		
		if(StringUtils.hasText(loanacno )){
			hql.append(" and t.triggerRuleAcct.loanacno like '%"+loanacno+"%'");
		}
		if(StringUtils.hasText(custname)){
			hql.append(" and t.triggerRuleAcct.custname like '%"+custname+"%'");
		}
		if(StringUtils.hasText(opername)){
			hql.append(" and t.triggerRuleAcct.opername like '%"+opername+"%'");
		}
		if(StringUtils.hasText(bankname)){
			hql.append(" and t.triggerRuleAcct.bankname like '%"+bankname+"%'");
		}
		if(StringUtils.hasText(launchPer)){
			hql.append(" and t.launchPer like '%"+launchPer+"%'");
		}
		if(StringUtils.hasText(createTimeStart)){
			hql.append(" and to_char(date,'yyyyMMdd') >= '"+createTimeStart+"'");
		}
		if(StringUtils.hasText(createTimeEnd)){
			hql.append(" and to_char(date,'yyyyMMdd') <='"+createTimeEnd+"'");
		}
		pageQueryResult = rootdao.pageQueryByHql(pageIndex, pageSize,hql.toString());

		return pageQueryResult;
	}
}
