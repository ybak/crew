package com.gbicc.company.financial.analysis.entity;

import java.math.BigDecimal;
// Generated 2015-12-7 14:12:42 by Hibernate Tools 3.2.2.GA



/**
 * TCmFinanceIndexData generated by hbm2java
 */
public class TCmFinanceIndexData  implements java.io.Serializable {


	  /*
	    */
	    private String indexDataId;
	    /*
	    */
	    private String customerFinanceId;
	    /*
	    */
	    private BigDecimal indexValueDataType;
	    /*
	    */
	    private String stringType;
	    /*
	    */
	    private String indexDisp;
	    /*
	    */
	    private String indexCd;

    public TCmFinanceIndexData() {
    }

    public TCmFinanceIndexData(String indexDataId, String customerFinanceId, BigDecimal indexValueDataType, String stringType, String indexDisp, String indexCd) {
        this.indexDataId = indexDataId;
        this.customerFinanceId = customerFinanceId;
        this.indexValueDataType = indexValueDataType;
        this.stringType = stringType;
        this.indexDisp = indexDisp;
        this.indexCd = indexCd;
     }
   
  
    
    public String getIndexDataId() {
        return this.indexDataId;
    }
    
    public void setIndexDataId(String indexDataId) {
        this.indexDataId = indexDataId;
    }
    public String getCustomerFinanceId() {
        return this.customerFinanceId;
    }
    
    public void setCustomerFinanceId(String customerFinanceId) {
        this.customerFinanceId = customerFinanceId;
    }
    public BigDecimal getIndexValueDataType() {
        return this.indexValueDataType;
    }
    
    public void setIndexValueDataType(BigDecimal indexValueDataType) {
        this.indexValueDataType = indexValueDataType;
    }
    public String getStringType() {
        return this.stringType;
    }
    
    public void setStringType(String stringType) {
        this.stringType = stringType;
    }
    public String getIndexDisp() {
        return this.indexDisp;
    }
    
    public void setIndexDisp(String indexDisp) {
        this.indexDisp = indexDisp;
    }
    public String getIndexCd() {
        return this.indexCd;
    }
    
    public void setIndexCd(String indexCd) {
        this.indexCd = indexCd;
    }




}

