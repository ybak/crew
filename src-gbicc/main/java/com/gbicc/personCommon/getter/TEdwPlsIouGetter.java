package com.gbicc.personCommon.getter;

import java.util.List;

import org.springframework.util.StringUtils;

import com.gbicc.common.CommonService;
import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.GlobalInfo;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.business.common.service.BctlService;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

/**
 * 对私借据查询
 * @date    2015年12月22日
 * @author  tangdu
 * @desc
 */
public class TEdwPlsIouGetter extends BaseGetter {
	
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
		String businessId = (String) getCommQueryServletRequest().getParameterMap().get("businessId");
		String custid = (String) getCommQueryServletRequest().getParameterMap().get("custid");
		String duebillno = (String) getCommQueryServletRequest().getParameterMap().get("duebillno");
		String loanacno = (String) getCommQueryServletRequest().getParameterMap().get("loanacno");
		String custname = (String) getCommQueryServletRequest().getParameterMap().get("custname");
		String contno = (String) getCommQueryServletRequest().getParameterMap().get("contno");
		String busitype = (String) getCommQueryServletRequest().getParameterMap().get("busitype");
		String loanid = (String) getCommQueryServletRequest().getParameterMap().get("loanid");
		String prodid = (String) getCommQueryServletRequest().getParameterMap().get("prodid");
		String prodName = (String) getCommQueryServletRequest().getParameterMap().get("prodName");
		String tterm = (String) getCommQueryServletRequest().getParameterMap().get("tterm");
		String bankid = (String) getCommQueryServletRequest().getParameterMap().get("bankid");
		String operid = (String) getCommQueryServletRequest().getParameterMap().get("operid");
		String begindates = (String) getCommQueryServletRequest().getParameterMap().get("begindates");
		String begindated = (String) getCommQueryServletRequest().getParameterMap().get("begindated");
		
		int pageSize = getResult().getPage().getEveryPage();
		int pageIndex = getResult().getPage().getCurrentPage();
		//查找10天内发放的贷款
		StringBuffer sql = new StringBuffer("SELECT t.*,t5.BRNAME BANKNAME,t6.TLR_NAME operName,t4.PRODNAME prodName  FROM T_EDW_PLS_IOU t "+
		"JOIN T_EDW_PLS_ACCOUNT_V t4 ON t.LOANACNO=t4.LOANACNO "+
		"JOIN TLR_INFO t6 ON t4.DUTYID=t6.TLRNO "+
		"JOIN BCTL t5 ON t5.BRCODE=t.bankid "+
		"where t4.PAYOFFFLAG='00' ");
		sql.append(" and t4.LOANACNO not in (select distinct  t.FD_LOAN_NO from T_PL_YT_REPORT t where t.FD_LOAN_RESULT='1') ");
		sql.append(" and days(current date)-days(t.BEGINDATE) <11 ");
		String userId=GlobalInfo.getCurrentInstance().getTlrno();
		sql.append(" and t4.DUTYID='"+userId+"' ");
		String userBorno=BctlService.getInstance().findChildOrgs(GlobalInfo.getCurrentInstance().getBrno());
		sql.append(" and t4.bankid in ("+userBorno+") ");
		
		if(StringUtils.hasText(custid)){
			sql.append("and t.custid like '%"+custid+"%' ");
		}
		if(StringUtils.hasText(duebillno)){
			sql.append("and t.duebillno like '%"+duebillno+"%' ");
		}
		if(StringUtils.hasText(loanacno)){
			sql.append("and t.loanacno like '%"+loanacno+"%' ");		
		}
		if(StringUtils.hasText(custname)){
			sql.append("and t.custname like '%"+custname+"%' ");
		}
		if(StringUtils.hasText(contno)){
			sql.append("and t.contno like '%"+contno+"%' ");
		}
		if(StringUtils.hasText(busitype)){
			sql.append("and t.busitype = '"+busitype+"' ");
		}
		if(StringUtils.hasText(loanid)){
			sql.append("and t.loanid like '%"+loanid+"%' ");
		}
		if(StringUtils.hasText(prodid)){
			sql.append("and t.prodid in("+loanid+" )");
		}
		if(StringUtils.hasText(prodName)){
			sql.append("and t4.PRODNAME ='"+prodName+"' ");
		}
		if(StringUtils.hasText(tterm)){
			sql.append("and t.tterm = '"+tterm+"' ");
		}
		if(StringUtils.hasText(bankid)){
			sql.append("and t4.bankid = '"+bankid+"' ");
		}
		if(StringUtils.hasText(operid)){
			sql.append("and t4.DUTYID = '"+operid+"' ");
		}
		if(StringUtils.hasText(begindates)){
			sql.append("and to_char(t.BEGINDATE,'yyyymmdd') >= '"+begindates+"' ");
		}
		if(StringUtils.hasText(begindated)){
			sql.append("and to_char(t.BEGINDATE,'yyyymmdd') < '"+begindated+"' ");
		}
		sql.append(" and t.prodid not in ('93010200','96010200','96010100','93010100') ");
		
		
		StringBuffer sqlp=new StringBuffer("select t0.* from ( ");
		sqlp.append("select t.*,row_number() over(order by BEGINDATE  desc,LOANACNO desc) as rnum from ( ");
		sqlp.append(sql);
		sqlp.append(") t ) t0 where t0.rnum>"+(pageIndex-1)*pageSize+" ");
		sqlp.append("fetch first "+pageSize+" rows only ");
		
		StringBuilder sqlc=new StringBuilder("select count(*) from ( ");
		sqlc.append(sql).append(" )");
		Object count=CommonService.getInstance().findSqlOneBySpringJdbc(sqlc.toString(),Integer.class);
		PageQueryResult pageQueryResult = new PageQueryResult();
		List<TEdwPlsIouView> list=CommonService.getInstance()
				.findSqlListBySpringJdbc(sqlp.toString(), TEdwPlsIouView.class);
		pageQueryResult.setQueryResult(list);
		pageQueryResult.setTotalCount(Integer.valueOf(count.toString()));
		return pageQueryResult;
	}
}
