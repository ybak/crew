package com.gbicc.company.financial.analysis.getter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.gbicc.bpm.operation.TaskAfreshAssignOperation;
import com.gbicc.util.DateUtils;
import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.PageQueryCondition;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.entity.dao.mng.ROOTDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

@SuppressWarnings("unchecked")
public class FinCourseTendencyGetter extends BaseGetter {

	@Override
	public Result call() throws AppException {
		try {
			PageQueryResult pageResult = getData();
			ResultMng.fillResultByList(getCommonQueryBean(),getCommQueryServletRequest(), pageResult.getQueryResult(),getResult());
			result.setContent(pageResult.getQueryResult());
			result.getPage().setTotalPage(pageResult.getPageCount(getResult().getPage().getEveryPage()));
			result.init();
			return result;
		} catch (AppException appEx) {
			throw appEx;
		} catch (Exception ex) {
			throw new AppException(Module.SYSTEM_MODULE,Rescode.DEFAULT_RESCODE, ex.getMessage(), ex);
		}
	}

	public PageQueryResult getData() throws Exception {
		DateUtils dataUtils=new DateUtils();
		String sjzyear = (String) getCommQueryServletRequest().getParameterMap().get("jzyear");
		int    jzYear=0;
		if(org.apache.commons.lang3.StringUtils.isNotEmpty(sjzyear)||!"".equals(sjzyear)){
			jzYear=Integer.valueOf(sjzyear);
		}
				
		String caliber = (String) getCommQueryServletRequest().getParameterMap().get("caliber");
		String srepno = (String) getCommQueryServletRequest().getParameterMap().get("repno");
		int repno=0;
				
		if(org.apache.commons.lang3.StringUtils.isNotEmpty(srepno)||!"".equals(srepno)){
			repno=Integer.valueOf(srepno);
		}		
		String finType = (String) getCommQueryServletRequest().getParameterMap().get("finType");//财报类型（1资产负债、2损益表、3现金流量表）
		String custId = (String) getCommQueryServletRequest().getParameterMap().get("custId");
		ROOTDAO rootdao=ROOTDAOUtils.getROOTDAO();
		Date firstDeadline=new Date();
		Date secondDeadline=new Date();
		Date threeDeadline=new Date();
		firstDeadline=dataUtils.getFirstDeadline(jzYear, caliber, repno);//本期
		secondDeadline=dataUtils.getSecondDeadline(jzYear, caliber, repno);//上期
		threeDeadline=dataUtils.getThreeDeadline(jzYear, caliber, repno);//上上期
		
		SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd ");
		String  firstDeadlines=simple.format(firstDeadline);
		String  secondDeadlines=simple.format(secondDeadline);
		String  threeDeadlines=simple.format(threeDeadline);
		String sql= " SELECT T1.PROJECT_CD ,T1.PROJECT_NAME  ,T1.PROJECT_VALUE  V1,T2.PROJECT_VALUE V2,T3.PROJECT_VALUE V3   FROM  FIN_COURSE_V T1,FIN_COURSE_V T2,FIN_COURSE_V T3     "
				+ " WHERE  T1.PROJECT_CD =T2.PROJECT_CD  AND T2.PROJECT_CD =T3.PROJECT_CD                                                                                            "
				+ " AND   T1.CUSTOMER_NUM=T2.CUSTOMER_NUM AND T1.CUSTOMER_NUM=T3.CUSTOMER_NUM                                                                                        "
				+ " AND T1.REPORT_TYPE=T2.REPORT_TYPE AND T1.REPORT_TYPE=T3.REPORT_TYPE                                                                                              "
				+ " AND T1.CALIBER_CD=T2.CALIBER_CD AND T1.CALIBER_CD=T3.CALIBER_CD                                                                                                  "
				+ " AND   T1.CUSTOMER_NUM='"+custId+"' AND T1.REPORT_TYPE='"+finType+"'                                                                                                 "
				+ " AND T1.CALIBER_CD='"+caliber+"' AND T1.DEADLINE='"+firstDeadlines+"'    AND T2.DEADLINE='"+secondDeadlines+"'   AND T3.DEADLINE='"+threeDeadlines+"'                                                    ";
		                                                                                  
		int pageSize = getResult().getPage().getEveryPage();// 分页大小
		int pageIndex = getResult().getPage().getCurrentPage();// 页码
		
		PageQueryCondition queryCondition = new PageQueryCondition();
		queryCondition.setPageIndex(pageIndex);
		queryCondition.setPageSize(pageSize);
		queryCondition.setQueryString(sql.toString());
		//queryCondition.setObjArray(param.toArray());
		PageQueryResult result = (PageQueryResult) rootdao.pageQueryBySQL(queryCondition);
		List<Object[]> list=result.getQueryResult();
		List<Map<String,String>> resultList=new ArrayList<Map<String,String>>();
		for(Object[] obj:list){
			Map<String,String> map=new HashMap<String, String>();
			map.put("procInstId",obj[0]!=null?obj[0].toString():"");
			map.put("financeStatementName",obj[1]!=null?obj[1].toString():"");
			map.put("projectValue",obj[2]!=null?obj[2].toString():"");
			map.put("sProjectValue",obj[3]!=null ? obj[3].toString() : "");
			map.put("ssProjectValue",obj[4].toString());
		
			resultList.add(map);
		}
		result.setQueryResult(resultList);
		return result;
	}
}