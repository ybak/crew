package com.gbicc.company.single.outputentity;
// Generated 2016-1-15 16:51:03 by Hibernate Tools 3.2.2.GA



/**
 * TRewL13PersonImportpublicTableId generated by hbm2java
 */
public class L13  implements java.io.Serializable {

	private static final long serialVersionUID = 7163930519354756514L;
	
	/*
    */
    private String fdId;
    /*
    * 本行业务分支行机构代码.
    */
    private String fdBankcode;
    /*
    * 中征码.
    */
    private String fdMiddleSigncode;
    /*
    * 组织机构代码.
    */
    private String fdOrganizationCode;
    /*
    * 信息代码.
    */
    private String fdInformationCode;
    /*
    * 提示信息生成时间.
    */
    private String fdCreattime;
    /*
    * 信息导入时间.
    */
    private String fdImporttime;
    /*
    * 预警表ID.
    */
    private String fdWarnId;
    /*
    * 数据日期.
    */
    private String fdDataDt;

    public L13() {
    }

	public String getFdId() {
		return fdId;
	}

	public void setFdId(String fdId) {
		this.fdId = fdId;
	}

	public String getFdBankcode() {
		return fdBankcode;
	}

	public void setFdBankcode(String fdBankcode) {
		this.fdBankcode = fdBankcode;
	}

	public String getFdMiddleSigncode() {
		return fdMiddleSigncode;
	}

	public void setFdMiddleSigncode(String fdMiddleSigncode) {
		this.fdMiddleSigncode = fdMiddleSigncode;
	}

	public String getFdOrganizationCode() {
		return fdOrganizationCode;
	}

	public void setFdOrganizationCode(String fdOrganizationCode) {
		this.fdOrganizationCode = fdOrganizationCode;
	}

	public String getFdInformationCode() {
		return fdInformationCode;
	}

	public void setFdInformationCode(String fdInformationCode) {
		this.fdInformationCode = fdInformationCode;
	}

	public String getFdCreattime() {
		return fdCreattime;
	}

	public void setFdCreattime(String fdCreattime) {
		this.fdCreattime = fdCreattime;
	}

	public String getFdImporttime() {
		return fdImporttime;
	}

	public void setFdImporttime(String fdImporttime) {
		this.fdImporttime = fdImporttime;
	}

	public String getFdWarnId() {
		return fdWarnId;
	}

	public void setFdWarnId(String fdWarnId) {
		this.fdWarnId = fdWarnId;
	}

	public String getFdDataDt() {
		return fdDataDt;
	}

	public void setFdDataDt(String fdDataDt) {
		this.fdDataDt = fdDataDt;
	}
}