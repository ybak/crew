package com.gbicc.company.view.zxinfo.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * The persistent class for the T_CM_COMPANY_CREDIT_INDEX_VIEW database table.
 * 
 */
public class TCmCompanyCreditIndexView implements Serializable {
	private static final long serialVersionUID = 1L;
    /*
    */
    private String id;
    /*
    */
    private String loancardno;
    /*
    */
    private String indexId;
    /*
    */
    private String indexName;
    /*
    */
    private BigDecimal indexValue;
    /*
    */
    private String reportid;
    /*
    */
    private Date reportdate;
    private String dataValue;
	public String getDataValue() {
		if(new BigDecimal(this.indexValue.intValue()).compareTo(this.indexValue)==0){
			return String.format("%d", indexValue.intValue());
		}else{
			return indexValue.toString();
		}
	}
	public void setDataValue(String dataValue) {
		this.dataValue = dataValue;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoancardno() {
		return loancardno;
	}
	public void setLoancardno(String loancardno) {
		this.loancardno = loancardno;
	}
	public String getIndexId() {
		return indexId;
	}
	public void setIndexId(String indexId) {
		this.indexId = indexId;
	}
	public String getIndexName() {
		return indexName;
	}
	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	public BigDecimal getIndexValue() {
		return indexValue;
	}
	public void setIndexValue(BigDecimal indexValue) {
		this.indexValue = indexValue;
	}
	public String getReportid() {
		return reportid;
	}
	public void setReportid(String reportid) {
		this.reportid = reportid;
	}
	public Date getReportdate() {
		return reportdate;
	}
	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}



}