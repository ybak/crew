package com.gbicc.company.single.outputentity;

import java.util.Date;
// Generated 2016-1-12 19:22:04 by Hibernate Tools 3.2.2.GA



/**
 * TRewJ04CustomerPId generated by hbm2java
 */
public class J04  implements java.io.Serializable {

	private static final long serialVersionUID = 8858832735524607855L;
	
    private String adminClientId;
    /*
    * 客户证件名称.
    */
    private String contactName;
    /*
    * 客户类型.
    */
    private String contactCode;
    /*
    * 客户子类型.
    */
    private String clientSubTpCd;
    /*
    * 客户类别.
    */
    private String contactTypeCode;
    /*
    */
    private String createOrg;
    /*
    * 开户柜员.
    */
    private String createUser;
    /*
    * 开户时间.
    */
    private String createDt;
    /*
    * 所属机构.
    */
    private String hostOrg;
    /*
    * 客户状态.
    */
    private String clientStTpCd;
    /*
    * 客户状态2.
    */
    private String clientSt2TpCd;
    /*
    * 客户状态3.
    */
    private String clientSt3TpCd;
    /*
    * 本地客户标识.
    */
    private String localInd;
    /*
    * 本行股东标识.
    */
    private String bankStockholderInd;
    /*
    * 网银客户标识.
    */
    private String onlineBankInd;
    /*
    * 居民和非居民标识.
    */
    private String dwellerInd;
    /*
    */
    private String levelTpCd;
    /*
    */
    private String investExpTpCd;
    /*
    */
    private String riskLevelTpCd;
    /*
    */
    private String riskLevelExpiryDt;
    /*
    * 通讯语言.
    */
    private String langTpCd;
    /*
    * 客户等级(VIP等级).
    */
    private String custLevelTpCd;
    /*
    * 联网核查标识.
    */
    private String networkCheckInd;
    /*
    * 信息补全标识.
    */
    private String infoOverInd;
    /*
    * 常驻国家代码.
    */
    private String preCountryTpCd;
    /*
    * 复核标识.
    */
    private String recheckInd;
    /*
    * 信用评级.
    */
    private String creditLevelTpCd;
    /*
    * 外汇业务标识.
    */
    private String hasExBizInd;
    /*
    * 婚姻状态.
    */
    private String maritalTpCd;
    /*
    * 国籍.
    */
    private String bonCountryTpCd;
    /*
    * 籍贯.
    */
    private String nativeplace;
    /*
    * 最高学历.
    */
    private String highestEduTpCd;
    /*
    * 性别.
    */
    private String genderTpCd;
    /*
    * 出生时间.
    */
    private String birthDt;
    /*
    * 死亡日期.
    */
    private String deceasedDt;
    /*
    * 读取信息标识.
    */
    private String loadInd;
    /*
    */
    private String taxPreferentInd;
    /*
    */
    private String taxExpiryDt;
    /*
    */
    private String taxTpCd;
    /*
    */
    private String cycleTpCd;
    /*
    */
    private String cycleMonth;
    /*
    */
    private String cycleDay;
    /*
    */
    private String accSendTpCd;
    /*
    */
    private String accountTransAddrTp;
    /*
    * 是否持有保管箱.
    */
    private String holdboxInd;
    /*
    */
    private String gradSchool;
    /*
    */
    private String gradDt;
    /*
    * 最高学位.
    */
    private String degreeTpCd;
    /*
    * 单位名称.
    */
    private String orgName;
    /*
    * 单位行业类别.
    */
    private String industryTpCd;
    /*
    * 单位状况说明.
    */
    private String orgStatus;
    /*
    * 单位规模.
    */
    private String scaleTpCd;
    /*
    * 被雇用时间.
    */
    private String hiredDt;
    /*
    * 职业.
    */
    private String occupationTpCd;
    /*
    * 职务.
    */
    private String positionTpCd;
    /*
    * 职称.
    */
    private String titleTpCd;
    /*
    */
    private String prefeTransChannel;
    /*
    */
    private String prefeTransDt;
    /*
    * 是否本行职工.
    */
    private String bankStaffInd;
    /*
    * 民族.
    */
    private String nationTpCd;
    /*
    * 户籍.
    */
    private String residential;
    /*
    */
    private String maritalDt;
    /*
    * 年收入区间.
    */
    private String incomeSrcScopeTpCd;
    /*
    */
    private String faithTpCd;
    /*
    */
    private String habbit;
    /*
    */
    private String investTropism;
    /*
    */
    private String investRiskTpCd;
    /*
    */
    private String investKnowage;
    /*
    */
    private Long investYears;
    /*
    * 接收短信标识.
    */
    private String acceptMsgInd;
    /*
    */
    private String firstContactMethod;
    /*
    */
    private String firstContactDt;
    /*
    */
    private String firstContactTime;
    /*
    * 用户标识.
    */
    private String rankTpCd;
    /*
    * 最后更新机构.
    */
    private String lastUpdateOrg;
    /*
    * 最后更新柜员.
    */
    private String lastUpdateUser;
    /*
    * 最后更新时间.
    */
    private String lastUpdateDt;
    /*
    * 最后更新事务.
    */
    private long lastUpdateTxId;
    /*
    */
    private String freeTradeAreaFlag;
    /*
    */
    private String nationalEconomyDepartTpCd;
    /*
    */
    private String occupationRemark;
    /*
    */
    private String moneyGramInd;
    /*
    */
    private String batchOpenCustInd;
    /*
    * 预警编号.
    */
    private String warnId;
    /*
    * 数据日期.
    */
    private Date dataDt;

    public J04() {
    }

	public String getAdminClientId() {
		return adminClientId;
	}

	public void setAdminClientId(String adminClientId) {
		this.adminClientId = adminClientId;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactCode() {
		return contactCode;
	}

	public void setContactCode(String contactCode) {
		this.contactCode = contactCode;
	}

	public String getClientSubTpCd() {
		return clientSubTpCd;
	}

	public void setClientSubTpCd(String clientSubTpCd) {
		this.clientSubTpCd = clientSubTpCd;
	}

	public String getContactTypeCode() {
		return contactTypeCode;
	}

	public void setContactTypeCode(String contactTypeCode) {
		this.contactTypeCode = contactTypeCode;
	}

	public String getCreateOrg() {
		return createOrg;
	}

	public void setCreateOrg(String createOrg) {
		this.createOrg = createOrg;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getCreateDt() {
		return createDt;
	}

	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}

	public String getHostOrg() {
		return hostOrg;
	}

	public void setHostOrg(String hostOrg) {
		this.hostOrg = hostOrg;
	}

	public String getClientStTpCd() {
		return clientStTpCd;
	}

	public void setClientStTpCd(String clientStTpCd) {
		this.clientStTpCd = clientStTpCd;
	}

	public String getClientSt2TpCd() {
		return clientSt2TpCd;
	}

	public void setClientSt2TpCd(String clientSt2TpCd) {
		this.clientSt2TpCd = clientSt2TpCd;
	}

	public String getClientSt3TpCd() {
		return clientSt3TpCd;
	}

	public void setClientSt3TpCd(String clientSt3TpCd) {
		this.clientSt3TpCd = clientSt3TpCd;
	}

	public String getLocalInd() {
		return localInd;
	}

	public void setLocalInd(String localInd) {
		this.localInd = localInd;
	}

	public String getBankStockholderInd() {
		return bankStockholderInd;
	}

	public void setBankStockholderInd(String bankStockholderInd) {
		this.bankStockholderInd = bankStockholderInd;
	}

	public String getOnlineBankInd() {
		return onlineBankInd;
	}

	public void setOnlineBankInd(String onlineBankInd) {
		this.onlineBankInd = onlineBankInd;
	}

	public String getDwellerInd() {
		return dwellerInd;
	}

	public void setDwellerInd(String dwellerInd) {
		this.dwellerInd = dwellerInd;
	}

	public String getLevelTpCd() {
		return levelTpCd;
	}

	public void setLevelTpCd(String levelTpCd) {
		this.levelTpCd = levelTpCd;
	}

	public String getInvestExpTpCd() {
		return investExpTpCd;
	}

	public void setInvestExpTpCd(String investExpTpCd) {
		this.investExpTpCd = investExpTpCd;
	}

	public String getRiskLevelTpCd() {
		return riskLevelTpCd;
	}

	public void setRiskLevelTpCd(String riskLevelTpCd) {
		this.riskLevelTpCd = riskLevelTpCd;
	}

	public String getRiskLevelExpiryDt() {
		return riskLevelExpiryDt;
	}

	public void setRiskLevelExpiryDt(String riskLevelExpiryDt) {
		this.riskLevelExpiryDt = riskLevelExpiryDt;
	}

	public String getLangTpCd() {
		return langTpCd;
	}

	public void setLangTpCd(String langTpCd) {
		this.langTpCd = langTpCd;
	}

	public String getCustLevelTpCd() {
		return custLevelTpCd;
	}

	public void setCustLevelTpCd(String custLevelTpCd) {
		this.custLevelTpCd = custLevelTpCd;
	}

	public String getNetworkCheckInd() {
		return networkCheckInd;
	}

	public void setNetworkCheckInd(String networkCheckInd) {
		this.networkCheckInd = networkCheckInd;
	}

	public String getInfoOverInd() {
		return infoOverInd;
	}

	public void setInfoOverInd(String infoOverInd) {
		this.infoOverInd = infoOverInd;
	}

	public String getPreCountryTpCd() {
		return preCountryTpCd;
	}

	public void setPreCountryTpCd(String preCountryTpCd) {
		this.preCountryTpCd = preCountryTpCd;
	}

	public String getRecheckInd() {
		return recheckInd;
	}

	public void setRecheckInd(String recheckInd) {
		this.recheckInd = recheckInd;
	}

	public String getCreditLevelTpCd() {
		return creditLevelTpCd;
	}

	public void setCreditLevelTpCd(String creditLevelTpCd) {
		this.creditLevelTpCd = creditLevelTpCd;
	}

	public String getHasExBizInd() {
		return hasExBizInd;
	}

	public void setHasExBizInd(String hasExBizInd) {
		this.hasExBizInd = hasExBizInd;
	}

	public String getMaritalTpCd() {
		return maritalTpCd;
	}

	public void setMaritalTpCd(String maritalTpCd) {
		this.maritalTpCd = maritalTpCd;
	}

	public String getBonCountryTpCd() {
		return bonCountryTpCd;
	}

	public void setBonCountryTpCd(String bonCountryTpCd) {
		this.bonCountryTpCd = bonCountryTpCd;
	}

	public String getNativeplace() {
		return nativeplace;
	}

	public void setNativeplace(String nativeplace) {
		this.nativeplace = nativeplace;
	}

	public String getHighestEduTpCd() {
		return highestEduTpCd;
	}

	public void setHighestEduTpCd(String highestEduTpCd) {
		this.highestEduTpCd = highestEduTpCd;
	}

	public String getGenderTpCd() {
		return genderTpCd;
	}

	public void setGenderTpCd(String genderTpCd) {
		this.genderTpCd = genderTpCd;
	}

	public String getBirthDt() {
		return birthDt;
	}

	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}

	public String getDeceasedDt() {
		return deceasedDt;
	}

	public void setDeceasedDt(String deceasedDt) {
		this.deceasedDt = deceasedDt;
	}

	public String getLoadInd() {
		return loadInd;
	}

	public void setLoadInd(String loadInd) {
		this.loadInd = loadInd;
	}

	public String getTaxPreferentInd() {
		return taxPreferentInd;
	}

	public void setTaxPreferentInd(String taxPreferentInd) {
		this.taxPreferentInd = taxPreferentInd;
	}

	public String getTaxExpiryDt() {
		return taxExpiryDt;
	}

	public void setTaxExpiryDt(String taxExpiryDt) {
		this.taxExpiryDt = taxExpiryDt;
	}

	public String getTaxTpCd() {
		return taxTpCd;
	}

	public void setTaxTpCd(String taxTpCd) {
		this.taxTpCd = taxTpCd;
	}

	public String getCycleTpCd() {
		return cycleTpCd;
	}

	public void setCycleTpCd(String cycleTpCd) {
		this.cycleTpCd = cycleTpCd;
	}

	public String getCycleMonth() {
		return cycleMonth;
	}

	public void setCycleMonth(String cycleMonth) {
		this.cycleMonth = cycleMonth;
	}

	public String getCycleDay() {
		return cycleDay;
	}

	public void setCycleDay(String cycleDay) {
		this.cycleDay = cycleDay;
	}

	public String getAccSendTpCd() {
		return accSendTpCd;
	}

	public void setAccSendTpCd(String accSendTpCd) {
		this.accSendTpCd = accSendTpCd;
	}

	public String getAccountTransAddrTp() {
		return accountTransAddrTp;
	}

	public void setAccountTransAddrTp(String accountTransAddrTp) {
		this.accountTransAddrTp = accountTransAddrTp;
	}

	public String getHoldboxInd() {
		return holdboxInd;
	}

	public void setHoldboxInd(String holdboxInd) {
		this.holdboxInd = holdboxInd;
	}

	public String getGradSchool() {
		return gradSchool;
	}

	public void setGradSchool(String gradSchool) {
		this.gradSchool = gradSchool;
	}

	public String getGradDt() {
		return gradDt;
	}

	public void setGradDt(String gradDt) {
		this.gradDt = gradDt;
	}

	public String getDegreeTpCd() {
		return degreeTpCd;
	}

	public void setDegreeTpCd(String degreeTpCd) {
		this.degreeTpCd = degreeTpCd;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getIndustryTpCd() {
		return industryTpCd;
	}

	public void setIndustryTpCd(String industryTpCd) {
		this.industryTpCd = industryTpCd;
	}

	public String getOrgStatus() {
		return orgStatus;
	}

	public void setOrgStatus(String orgStatus) {
		this.orgStatus = orgStatus;
	}

	public String getScaleTpCd() {
		return scaleTpCd;
	}

	public void setScaleTpCd(String scaleTpCd) {
		this.scaleTpCd = scaleTpCd;
	}

	public String getHiredDt() {
		return hiredDt;
	}

	public void setHiredDt(String hiredDt) {
		this.hiredDt = hiredDt;
	}

	public String getOccupationTpCd() {
		return occupationTpCd;
	}

	public void setOccupationTpCd(String occupationTpCd) {
		this.occupationTpCd = occupationTpCd;
	}

	public String getPositionTpCd() {
		return positionTpCd;
	}

	public void setPositionTpCd(String positionTpCd) {
		this.positionTpCd = positionTpCd;
	}

	public String getTitleTpCd() {
		return titleTpCd;
	}

	public void setTitleTpCd(String titleTpCd) {
		this.titleTpCd = titleTpCd;
	}

	public String getPrefeTransChannel() {
		return prefeTransChannel;
	}

	public void setPrefeTransChannel(String prefeTransChannel) {
		this.prefeTransChannel = prefeTransChannel;
	}

	public String getPrefeTransDt() {
		return prefeTransDt;
	}

	public void setPrefeTransDt(String prefeTransDt) {
		this.prefeTransDt = prefeTransDt;
	}

	public String getBankStaffInd() {
		return bankStaffInd;
	}

	public void setBankStaffInd(String bankStaffInd) {
		this.bankStaffInd = bankStaffInd;
	}

	public String getNationTpCd() {
		return nationTpCd;
	}

	public void setNationTpCd(String nationTpCd) {
		this.nationTpCd = nationTpCd;
	}

	public String getResidential() {
		return residential;
	}

	public void setResidential(String residential) {
		this.residential = residential;
	}

	public String getMaritalDt() {
		return maritalDt;
	}

	public void setMaritalDt(String maritalDt) {
		this.maritalDt = maritalDt;
	}

	public String getIncomeSrcScopeTpCd() {
		return incomeSrcScopeTpCd;
	}

	public void setIncomeSrcScopeTpCd(String incomeSrcScopeTpCd) {
		this.incomeSrcScopeTpCd = incomeSrcScopeTpCd;
	}

	public String getFaithTpCd() {
		return faithTpCd;
	}

	public void setFaithTpCd(String faithTpCd) {
		this.faithTpCd = faithTpCd;
	}

	public String getHabbit() {
		return habbit;
	}

	public void setHabbit(String habbit) {
		this.habbit = habbit;
	}

	public String getInvestTropism() {
		return investTropism;
	}

	public void setInvestTropism(String investTropism) {
		this.investTropism = investTropism;
	}

	public String getInvestRiskTpCd() {
		return investRiskTpCd;
	}

	public void setInvestRiskTpCd(String investRiskTpCd) {
		this.investRiskTpCd = investRiskTpCd;
	}

	public String getInvestKnowage() {
		return investKnowage;
	}

	public void setInvestKnowage(String investKnowage) {
		this.investKnowage = investKnowage;
	}

	public Long getInvestYears() {
		return investYears;
	}

	public void setInvestYears(Long investYears) {
		this.investYears = investYears;
	}

	public String getAcceptMsgInd() {
		return acceptMsgInd;
	}

	public void setAcceptMsgInd(String acceptMsgInd) {
		this.acceptMsgInd = acceptMsgInd;
	}

	public String getFirstContactMethod() {
		return firstContactMethod;
	}

	public void setFirstContactMethod(String firstContactMethod) {
		this.firstContactMethod = firstContactMethod;
	}

	public String getFirstContactDt() {
		return firstContactDt;
	}

	public void setFirstContactDt(String firstContactDt) {
		this.firstContactDt = firstContactDt;
	}

	public String getFirstContactTime() {
		return firstContactTime;
	}

	public void setFirstContactTime(String firstContactTime) {
		this.firstContactTime = firstContactTime;
	}

	public String getRankTpCd() {
		return rankTpCd;
	}

	public void setRankTpCd(String rankTpCd) {
		this.rankTpCd = rankTpCd;
	}

	public String getLastUpdateOrg() {
		return lastUpdateOrg;
	}

	public void setLastUpdateOrg(String lastUpdateOrg) {
		this.lastUpdateOrg = lastUpdateOrg;
	}

	public String getLastUpdateUser() {
		return lastUpdateUser;
	}

	public void setLastUpdateUser(String lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public String getLastUpdateDt() {
		return lastUpdateDt;
	}

	public void setLastUpdateDt(String lastUpdateDt) {
		this.lastUpdateDt = lastUpdateDt;
	}

	public long getLastUpdateTxId() {
		return lastUpdateTxId;
	}

	public void setLastUpdateTxId(long lastUpdateTxId) {
		this.lastUpdateTxId = lastUpdateTxId;
	}

	public String getFreeTradeAreaFlag() {
		return freeTradeAreaFlag;
	}

	public void setFreeTradeAreaFlag(String freeTradeAreaFlag) {
		this.freeTradeAreaFlag = freeTradeAreaFlag;
	}

	public String getNationalEconomyDepartTpCd() {
		return nationalEconomyDepartTpCd;
	}

	public void setNationalEconomyDepartTpCd(String nationalEconomyDepartTpCd) {
		this.nationalEconomyDepartTpCd = nationalEconomyDepartTpCd;
	}

	public String getOccupationRemark() {
		return occupationRemark;
	}

	public void setOccupationRemark(String occupationRemark) {
		this.occupationRemark = occupationRemark;
	}

	public String getMoneyGramInd() {
		return moneyGramInd;
	}

	public void setMoneyGramInd(String moneyGramInd) {
		this.moneyGramInd = moneyGramInd;
	}

	public String getBatchOpenCustInd() {
		return batchOpenCustInd;
	}

	public void setBatchOpenCustInd(String batchOpenCustInd) {
		this.batchOpenCustInd = batchOpenCustInd;
	}

	public String getWarnId() {
		return warnId;
	}

	public void setWarnId(String warnId) {
		this.warnId = warnId;
	}

	public Date getDataDt() {
		return dataDt;
	}

	public void setDataDt(Date dataDt) {
		this.dataDt = dataDt;
	}



}