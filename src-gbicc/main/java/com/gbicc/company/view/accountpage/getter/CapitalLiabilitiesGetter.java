package com.gbicc.company.view.accountpage.getter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import com.gbicc.bpm.SpringContextHolder;
import com.gbicc.util.DateUtils;
import com.huateng.common.err.Module;
import com.huateng.common.err.Rescode;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.PageQueryResult;
import com.huateng.ebank.entity.dao.mng.ROOTDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.framework.web.commQuery.BaseGetter;
import com.huateng.exception.AppException;

public class CapitalLiabilitiesGetter extends BaseGetter {
	
	/**
	 * 主营业务收入财报编码
	 */
	public static final String BUSIN_INCOME="00030001";
	/**
	 * 执行重要性水平参考值基准值
	 */
	public static final double REFERENCE_VALUE=0.0075;

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
		String customerNum = (String) getCommQueryServletRequest().getParameterMap().get("customerNum");
		String jzyear = (String) getCommQueryServletRequest().getParameterMap().get("jzyear");
		String caliber = (String) getCommQueryServletRequest().getParameterMap().get("caliber");
		String repno = (String) getCommQueryServletRequest().getParameterMap().get("repno");
		String tableCd= (String) getCommQueryServletRequest().getParameterMap().get("tableCd");
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		PageQueryResult result = new PageQueryResult();
		if(StringUtils.isNotEmpty(customerNum) && StringUtils.isNotEmpty(jzyear) && StringUtils.isNotEmpty(caliber) && StringUtils.isNotEmpty(repno)){
			Integer jzyear2=Integer.parseInt(jzyear)-1;
			String type="";//报表口径，1年，2半年，3季度，4月
			String str="";
			String str2="";
			if(caliber.equals("707")){
				type="1";
				str=" TO_CHAR(TO_DATE(CUST.FINANCE_STATEMENT_DEADLINE,'YYYY-MM-DD'),'YYYY')='"+jzyear+"' ";
				str2=" TO_CHAR(TO_DATE(CUST2.FINANCE_STATEMENT_DEADLINE,'YYYY-MM-DD'),'YYYY')='"+jzyear2+"' ";
			}else if(caliber.equals("709")){
				type="3";
				String month="";
				if(repno.equals("1")){
					month="3";
				}else if(repno.equals("2")){
					month="6";
				}else if(repno.equals("3")){
					month="9";
				}else if(repno.equals("4")){
					month="12";
				}
				Date endDate=DateUtils.getLastDayOfMonth(Integer.valueOf(jzyear),Integer.valueOf(month));
				Date endDate2=DateUtils.getLastDayOfMonth(Integer.valueOf(jzyear2),Integer.valueOf(month));
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyyMMdd");
				String dateStr=dateFormat.format(endDate);
				String dateStr2=dateFormat.format(endDate2);
				str=" CUST.FINANCE_STATEMENT_DEADLINE='"+dateStr+"' ";
				str2=" CUST2.FINANCE_STATEMENT_DEADLINE='"+dateStr2+"' ";
			}
			String sql="SELECT T.*, CASE WHEN PROJECT_VALUE<W.DOWN_VALUE OR  PROJECT_VALUE>W.UP_VALUE THEN 'Y' WHEN W.UP_VALUE=0 AND W.DOWN_VALUE=0 THEN '- ' WHEN W.UP_VALUE IS NULL OR W.DOWN_VALUE IS NULL THEN '- '  WHEN W.UP_VALUE =W.DOWN_VALUE THEN '- ' ELSE 'N' END EXCEP_FLAG_2,"
					+ "CASE WHEN W.UP_VALUE=W.DOWN_VALUE THEN '-' WHEN W.UP_VALUE<>0 AND W.DOWN_VALUE=0 THEN '(0 - '||TO_CHAR(DECIMAL(W.UP_VALUE,22,2))||')' ELSE '('||TO_CHAR(DECIMAL(W.DOWN_VALUE,22,2))||' - '||TO_CHAR(DECIMAL(W.UP_VALUE,22,2))||')' END AS RANGE FROM (SELECT PROJECT_CD,PROJECT_NAME,PROJECT_VALUE,PROJECT_VALUE_2,"
			+ "CASE WHEN AMT IS NULL THEN NULL when amt=0 then 0 WHEN AMT<0 THEN AMT ELSE AMT END AS AMT,CASE WHEN AMT IS NULL THEN NULL WHEN REFERENCE_VALUE is null THEN null WHEN abs(AMT)<=REFERENCE_VALUE THEN NULL ELSE ABS(AMT)- REFERENCE_VALUE END  AS PLVALUE,"
			+ "CASE WHEN AMT IS NULL THEN NULL  WHEN AMT=0 AND PROJECT_VALUE_2<>0 THEN 0 WHEN PROJECT_VALUE_2=0 THEN NULL "
			+ "ELSE ROUND(AMT/PROJECT_VALUE_2,4)*100  END AS RATE,CASE WHEN AMT IS NULL THEN NULL "
			+ "WHEN abs(AMT)>REFERENCE_VALUE THEN 'Y' "
			+ "ELSE 'N' END AS EXCEP_FLAG,REFERENCE_VALUE,CUSTOMER_NUM,FINANCE_STATEMENT_DEADLINE  FROM (SELECT CUST.FINANCE_STATEMENT_DEADLINE,DA.CUSTOMER_FINANCE_ID,"
			+ "DA.PROJECT_CD,CODE.PROJECT_NAME,DA.PROJECT_VALUE,CUST_2.PROJECT_VALUE AS PROJECT_VALUE_2,CUST.CUSTOMER_NUM,"
			+ "CASE WHEN (DA.PROJECT_VALUE IS NULL OR CUST_2.PROJECT_VALUE IS NULL) THEN NULL "
			+ "ELSE DA.PROJECT_VALUE-CUST_2.PROJECT_VALUE END AS AMT,ROUND(TT.PROJECT_VALUE*"+REFERENCE_VALUE+",-3) AS REFERENCE_VALUE FROM T_CM_FINANCE_STATEMENT_CODE CODE "
			+ "LEFT JOIN T_CM_FINANCE_STATEMENT_DATA DA ON DA.PROJECT_CD=CODE.PROJECT_CD "
			+ "LEFT JOIN T_CM_FINANCE_STATEMENT_DATA TT ON DA.CUSTOMER_FINANCE_ID=TT.CUSTOMER_FINANCE_ID AND TT.PROJECT_CD='"+BUSIN_INCOME+"' "
			+ "LEFT JOIN (SELECT RANK() OVER(PARTITION BY CUSTOMER_NUM ORDER BY FINANCE_STATEMENT_DEADLINE DESC) "
			+ "RM,CUSTOMER_FINANCE_ID,CUSTOMER_NUM,FINANCE_STATEMENT_TYPE_CD,FINANCE_STATEMENT_DEADLINE "
			+ "FROM T_CM_CUSTOMER_FINANCE WHERE CUSTOMER_NUM='"+customerNum+"' AND "
			+ "FINANCE_STATEMENT_TYPE_CD='"+type+"') CUST ON DA.CUSTOMER_FINANCE_ID=CUST.CUSTOMER_FINANCE_ID "
			+ "LEFT JOIN(SELECT DA2.PROJECT_CD,CODE2.PROJECT_NAME,DA2.PROJECT_VALUE FROM "
			+ "T_CM_FINANCE_STATEMENT_CODE CODE2 LEFT JOIN T_CM_FINANCE_STATEMENT_DATA DA2 "
			+ "ON DA2.PROJECT_CD=CODE2.PROJECT_CD LEFT JOIN (SELECT RANK() OVER(PARTITION BY "
			+ "CUSTOMER_NUM ORDER BY FINANCE_STATEMENT_DEADLINE DESC) RM,CUSTOMER_FINANCE_ID,"
			+ "CUSTOMER_NUM,FINANCE_STATEMENT_TYPE_CD,FINANCE_STATEMENT_DEADLINE FROM "
			+ "T_CM_CUSTOMER_FINANCE WHERE CUSTOMER_NUM='"+customerNum+"' AND "
			+ "FINANCE_STATEMENT_TYPE_CD='"+type+"') CUST2 ON DA2.CUSTOMER_FINANCE_ID="
			+ "CUST2.CUSTOMER_FINANCE_ID WHERE "+str2+" "
			+ "AND CODE2.FINANCE_REPORT_SORT_CD='"+tableCd+"') "
			+ "CUST_2 ON DA.PROJECT_CD=CUST_2.PROJECT_CD WHERE "+str+" "
			+ "AND CODE.FINANCE_REPORT_SORT_CD='"+tableCd+"') T ORDER BY PROJECT_CD ASC ) T LEFT JOIN T_ODS_CMS_CORPORATION N ON T.CUSTOMER_NUM=N.CUSTOMER_NUM LEFT JOIN T_CM_FINANCE_COURSE_HY_FW W ON SUBSTR(N.PBC_INDUSTRY_CD,1,1)=W.INDUSTRY_LEVEL AND T.PROJECT_NAME=W.INDEX_NAME AND  W.FINANCE_STATEMENT_DEADLINE=T.FINANCE_STATEMENT_DEADLINE AND W.FINANCE_STATEMENT_TYPE_CD='"+type+"'";

			ROOTDAO rootdao = ROOTDAOUtils.getROOTDAO();
			// 分页大小
			int pageSize = getResult().getPage().getEveryPage();
//			// 页码
			int pageIndex = getResult().getPage().getCurrentPage();
			StringBuffer sqlp=new StringBuffer("select t0.* from ( ");
			sqlp.append("select t.*,row_number() over() as rnum from ( ");
			sqlp.append(sql);
			sqlp.append(") t ) t0 where t0.rnum>"+(pageIndex-1)*pageSize+" ");
			sqlp.append("fetch first "+pageSize+" rows only ");
			StringBuffer sqll=new StringBuffer("select count(1) from ( ");
			sqll.append(sql);
			sqll.append(" )");
			Integer totalCount=(Integer)rootdao.querySqlOne(sqll.toString());
			
			JdbcTemplate jdbcTemplate=SpringContextHolder.getBean(JdbcTemplate.class);
			list=jdbcTemplate.queryForList(sqlp.toString());
			Iterator<Map<String, Object>> it=list.iterator();
			List<String> listStr =new ArrayList<String>();
			listStr.add("00010016");
			listStr.add("00010025");
			listStr.add("00010029");
			listStr.add("00010046");
			listStr.add("00010052");
			listStr.add("00010054");
			while(it.hasNext()){
				Map<String, Object> map=it.next();
				if(map.get("project_cd")!=null){
					if(listStr.contains(map.get("project_cd"))){
						map.put("amt", "-");
						map.put("rate", "-");
						map.put("excep_flag", "-");
					}
				}
			}
			result.setQueryResult(list);
			result.setTotalCount(totalCount);
		}
		
		return result;
	}
}