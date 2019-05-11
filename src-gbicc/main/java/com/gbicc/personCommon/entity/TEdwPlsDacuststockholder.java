package com.gbicc.personCommon.entity;
// Generated 2016-1-19 16:54:06 by Hibernate Tools 3.2.2.GA


import java.math.BigDecimal;

/**
 * TEdwPlsDacuststockholderId generated by hbm2java
 */
public class TEdwPlsDacuststockholder  implements java.io.Serializable {

	private static final long serialVersionUID = -3146523130072219209L;
	
	/*
    * 股东情况记录编号.
    */
    private String keyno;
    /*
    * 客户编号.
    */
    private String custid;
    /*
    * 股东类型.
    */
    private String holdcusttype;
    /*
    * 股东编号.
    */
    private String holdcustid;
    /*
    * 股东名称.
    */
    private String holdcustname;
    /*
    * 证件类型.
    */
    private String paperkind;
    /*
    * 证件号码.
    */
    private String paperid;
    /*
    * 住址.
    */
    private String famiaddr;
    /*
    * 是否在单位任职.
    */
    private String isworkflag;
    /*
    * 经营范围.
    */
    private String dealscope;
    /*
    * 法人代表.
    */
    private String leadcustname;
    /*
    * 注册资金.
    */
    private BigDecimal regifund;
    /*
    * 注册地址.
    */
    private String regiaddr;
    /*
    * 投资币种.
    */
    private String currsign;
    /*
    * 投资金额.
    */
    private BigDecimal inveamt;
    /*
    * 出资方式.
    */
    private String invekind;
    /*
    * 持股比例.
    */
    private BigDecimal stockperc;

    public TEdwPlsDacuststockholder() {
    }

	/**
    * Get the 股东情况记录编号
    */	
    public String getKeyno() {
        return this.keyno;
    }
	/**
    * Set the 股东情况记录编号
    */	
    public void setKeyno(String keyno) {
        this.keyno = keyno;
    }
	/**
    * Get the 客户编号
    */	
    public String getCustid() {
        return this.custid;
    }
	/**
    * Set the 客户编号
    */	
    public void setCustid(String custid) {
        this.custid = custid;
    }
	/**
    * Get the 股东类型
    */	
    public String getHoldcusttype() {
        return this.holdcusttype;
    }
	/**
    * Set the 股东类型
    */	
    public void setHoldcusttype(String holdcusttype) {
        this.holdcusttype = holdcusttype;
    }
	/**
    * Get the 股东编号
    */	
    public String getHoldcustid() {
        return this.holdcustid;
    }
	/**
    * Set the 股东编号
    */	
    public void setHoldcustid(String holdcustid) {
        this.holdcustid = holdcustid;
    }
	/**
    * Get the 股东名称
    */	
    public String getHoldcustname() {
        return this.holdcustname;
    }
	/**
    * Set the 股东名称
    */	
    public void setHoldcustname(String holdcustname) {
        this.holdcustname = holdcustname;
    }
	/**
    * Get the 证件类型
    */	
    public String getPaperkind() {
        return this.paperkind;
    }
	/**
    * Set the 证件类型
    */	
    public void setPaperkind(String paperkind) {
        this.paperkind = paperkind;
    }
	/**
    * Get the 证件号码
    */	
    public String getPaperid() {
        return this.paperid;
    }
	/**
    * Set the 证件号码
    */	
    public void setPaperid(String paperid) {
        this.paperid = paperid;
    }
	/**
    * Get the 住址
    */	
    public String getFamiaddr() {
        return this.famiaddr;
    }
	/**
    * Set the 住址
    */	
    public void setFamiaddr(String famiaddr) {
        this.famiaddr = famiaddr;
    }
	/**
    * Get the 是否在单位任职
    */	
    public String getIsworkflag() {
        return this.isworkflag;
    }
	/**
    * Set the 是否在单位任职
    */	
    public void setIsworkflag(String isworkflag) {
        this.isworkflag = isworkflag;
    }
	/**
    * Get the 经营范围
    */	
    public String getDealscope() {
        return this.dealscope;
    }
	/**
    * Set the 经营范围
    */	
    public void setDealscope(String dealscope) {
        this.dealscope = dealscope;
    }
	/**
    * Get the 法人代表
    */	
    public String getLeadcustname() {
        return this.leadcustname;
    }
	/**
    * Set the 法人代表
    */	
    public void setLeadcustname(String leadcustname) {
        this.leadcustname = leadcustname;
    }
	/**
    * Get the 注册资金
    */	
    public BigDecimal getRegifund() {
        return this.regifund;
    }
	/**
    * Set the 注册资金
    */	
    public void setRegifund(BigDecimal regifund) {
        this.regifund = regifund;
    }
	/**
    * Get the 注册地址
    */	
    public String getRegiaddr() {
        return this.regiaddr;
    }
	/**
    * Set the 注册地址
    */	
    public void setRegiaddr(String regiaddr) {
        this.regiaddr = regiaddr;
    }
	/**
    * Get the 投资币种
    */	
    public String getCurrsign() {
        return this.currsign;
    }
	/**
    * Set the 投资币种
    */	
    public void setCurrsign(String currsign) {
        this.currsign = currsign;
    }
	/**
    * Get the 投资金额
    */	
    public BigDecimal getInveamt() {
        return this.inveamt;
    }
	/**
    * Set the 投资金额
    */	
    public void setInveamt(BigDecimal inveamt) {
        this.inveamt = inveamt;
    }
	/**
    * Get the 出资方式
    */	
    public String getInvekind() {
        return this.invekind;
    }
	/**
    * Set the 出资方式
    */	
    public void setInvekind(String invekind) {
        this.invekind = invekind;
    }
	/**
    * Get the 持股比例
    */	
    public BigDecimal getStockperc() {
        return this.stockperc;
    }
	/**
    * Set the 持股比例
    */	
    public void setStockperc(BigDecimal stockperc) {
        this.stockperc = stockperc;
    }
}