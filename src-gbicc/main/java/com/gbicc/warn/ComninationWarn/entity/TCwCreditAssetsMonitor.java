package com.gbicc.warn.ComninationWarn.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 
 * @author liufei
 *
 * 版本：2015年12月24日 
 * 类说明：信贷资产监测表
 */
public class TCwCreditAssetsMonitor implements Serializable {

	private static final long serialVersionUID = -2631760787710321152L;

	String DATA_DATE;//数据日期
	String INDEX_CODE;//指标编号
	String INDEX_NAME;//指标名称
	String INDEX_TYPE;//指标分类
	String MONITOR_FRE;//监控频率
	String ORG_CODE;//机构
	String ORG_NAME;//机构
	String ORG_PARENT;//上级机构编号
	String PRODUCT;//产品
	String PRODUCT_CODE;//产品编号
	String PRODUCT_NAME;//产品名称
	String PRODUCT_TYPE;//产品类型
	String INDUSTRY_CODE;//行业
	String INDUSTRY_NAME;//行业名称
	String INDUSTRY_TYPE;//行业类型
	String INDUSTRY_PARENT;//行业上级
	String THRESHOLD_TYPE;//阀值类型（1递增0递减）
	String COLO;//预警颜色
	String GATHER_TYPE;//数据类型(0总体1对公2对私,3资产迁徙与减值拨备 总行 4资产迁徙与减值拨备 上海地区 5 一般行业集中度 总行 6一般行业集中度分析 上海地区 )
	Double NOW_VAL;//当期值
	Double TOP_VAL;//上期值
	Double YC_VAL;//年初
	Double THRESHOLD1;//阀值1
	Double THRESHOLD2;//阀值2
	String BSQ;//比上期
	String BYC;//比年初
	Double BSQCOUNT;//比上期增量
	Double BYCCOUNT;//比年初增量
	Double BSQANG;//比上期增加百分比
	Double BYCANG;//比年初增加百分比
	
	
	public String getDATA_DATE() {
		return DATA_DATE;
	}
	public void setDATA_DATE(String dATA_DATE) {
		DATA_DATE = dATA_DATE;
	}
	public String getINDEX_CODE() {
		return INDEX_CODE;
	}
	public void setINDEX_CODE(String iNDEX_CODE) {
		INDEX_CODE = iNDEX_CODE;
	}
	public String getINDEX_NAME() {
		return INDEX_NAME;
	}
	public void setINDEX_NAME(String iNDEX_NAME) {
		INDEX_NAME = iNDEX_NAME;
	}
	public String getINDEX_TYPE() {
		return INDEX_TYPE;
	}
	public void setINDEX_TYPE(String iNDEX_TYPE) {
		INDEX_TYPE = iNDEX_TYPE;
	}
	public String getMONITOR_FRE() {
		return MONITOR_FRE;
	}
	public void setMONITOR_FRE(String mONITOR_FRE) {
		MONITOR_FRE = mONITOR_FRE;
	}
	
	public String getPRODUCT() {
		return PRODUCT;
	}
	public void setPRODUCT(String pRODUCT) {
		PRODUCT = pRODUCT;
	}
	
	public String getCOLO() {
		return COLO;
	}
	public void setCOLO(String cOLO) {
		COLO = cOLO;
	}
	public Double getNOW_VAL() {
		return NOW_VAL;
	}
	public void setNOW_VAL(Double nOW_VAL) {
		NOW_VAL = nOW_VAL;
	}
	public Double getTOP_VAL() {
		return TOP_VAL;
	}
	public void setTOP_VAL(Double tOP_VAL) {
		TOP_VAL = tOP_VAL;
	}
	
	public Double getTHRESHOLD1() {
		return THRESHOLD1;
	}
	public void setTHRESHOLD1(Double tHRESHOLD1) {
		THRESHOLD1 = tHRESHOLD1;
	}
	public Double getTHRESHOLD2() {
		return THRESHOLD2;
	}
	public void setTHRESHOLD2(Double tHRESHOLD2) {
		THRESHOLD2 = tHRESHOLD2;
	}
	public String getBSQ() {
		try{
			if(this.getNOW_VAL()>this.getTOP_VAL()){//比上期大
				return "1";
			}else if(this.getNOW_VAL()<this.getTOP_VAL()){//比上期小
				return "2";
			}else{
				return "0";
			}
		}catch(Exception e){
			return "0";
		}
	}
	public void setBSQ(String bSQ) {
		BSQ = bSQ;
	}
	public String getBYC() {
		try{
			if(this.getNOW_VAL()>this.getYC_VAL()){//比年初大
				return "1";
			}else if(this.getNOW_VAL()<this.getYC_VAL()){//比年初小
				return "2";
			}else{
				return "0";
			}
		}catch(Exception e){
			return "0";
		}
	}
	public void setBYC(String bYC) {
		BYC = bYC;
	}
	public String getPRODUCT_TYPE() {
		return PRODUCT_TYPE;
	}
	public void setPRODUCT_TYPE(String pRODUCT_TYPE) {
		PRODUCT_TYPE = pRODUCT_TYPE;
	}
	public String getGATHER_TYPE() {
		return GATHER_TYPE;
	}
	public void setGATHER_TYPE(String gATHER_TYPE) {
		GATHER_TYPE = gATHER_TYPE;
	}
	public String getORG_CODE() {
		return ORG_CODE;
	}
	public void setORG_CODE(String oRG_CODE) {
		ORG_CODE = oRG_CODE;
	}
	public String getORG_PARENT() {
		return ORG_PARENT;
	}
	public void setORG_PARENT(String oRG_PARENT) {
		ORG_PARENT = oRG_PARENT;
	}
	public String getPRODUCT_CODE() {
		return PRODUCT_CODE;
	}
	public void setPRODUCT_CODE(String pRODUCT_CODE) {
		PRODUCT_CODE = pRODUCT_CODE;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public String getINDUSTRY_CODE() {
		return INDUSTRY_CODE;
	}
	public void setINDUSTRY_CODE(String iNDUSTRY_CODE) {
		INDUSTRY_CODE = iNDUSTRY_CODE;
	}
	public String getINDUSTRY_NAME() {
		return INDUSTRY_NAME;
	}
	public void setINDUSTRY_NAME(String iNDUSTRY_NAME) {
		INDUSTRY_NAME = iNDUSTRY_NAME;
	}
	public String getINDUSTRY_TYPE() {
		return INDUSTRY_TYPE;
	}
	public void setINDUSTRY_TYPE(String iNDUSTRY_TYPE) {
		INDUSTRY_TYPE = iNDUSTRY_TYPE;
	}
	public String getINDUSTRY_PARENT() {
		return INDUSTRY_PARENT;
	}
	public void setINDUSTRY_PARENT(String iNDUSTRY_PARENT) {
		INDUSTRY_PARENT = iNDUSTRY_PARENT;
	}
	public String getTHRESHOLD_TYPE() {
		return THRESHOLD_TYPE;
	}
	public void setTHRESHOLD_TYPE(String tHRESHOLD_TYPE) {
		THRESHOLD_TYPE = tHRESHOLD_TYPE;
	}
	public Double getYC_VAL() {
		return YC_VAL;
	}
	public void setYC_VAL(Double yC_VAL) {
		YC_VAL = yC_VAL;
	}
	
	public Double getBSQCOUNT() {
		try{
			return this.getNOW_VAL()-this.getTOP_VAL();
		}catch(Exception e){
			return null;
		}
		
	}
	public Double getBYCCOUNT() {
		try{
			return this.getNOW_VAL()-this.getYC_VAL();
		}catch(Exception e){
			return null;
		}
	}
	public Double getBSQANG() {
		try{
			BigDecimal b=new BigDecimal(this.getBSQCOUNT()*100/this.getTOP_VAL());
			return b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception e){
			return null;
		}
	}
	public Double getBYCANG() {
		try{
			BigDecimal b=new BigDecimal(this.getBYCCOUNT()*100/this.getYC_VAL());
			return b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception e){
			return null;
		}
	}
	public String getORG_NAME() {
		return ORG_NAME;
	}
	public void setORG_NAME(String oRG_NAME) {
		ORG_NAME = oRG_NAME;
	}
	
	
	
}
