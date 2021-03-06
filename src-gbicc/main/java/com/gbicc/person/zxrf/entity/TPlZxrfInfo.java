package com.gbicc.person.zxrf.entity;
// Generated 2015-11-12 20:22:17 by Hibernate Tools 3.2.2.GA


import java.util.Date;

import com.gbicc.person.monitor.entity.TPlTask;

/**
 * 刘飞
 *	中小融辅信息表
 */
public class TPlZxrfInfo implements java.io.Serializable {

	private static final long serialVersionUID = -2631760787710321152L;
    /*
    * 编号.
    */
    private String id;
    /*
    * 客户类型.
    */
    private String custtype;
    /*
    * 客户名称.
    */
    private String custname;
    /*
    * 客户编号.
    */
    private String custcode;
    /*
    * 贷款账户.
    */
    private String loanAccount;
    /*
    * 产品编号.
    */
    private String productCode;
    /*
    * 贷款余额.
    */
    private Double loanBalance;
    /*
    * 行业.
    */
    private String industry;
    /*
    * 贷款金额.
    */
    private Double loanAmount;
    /*
    * 发放日期.
    */
    private Date grantDate;
    /*
    * 结束日期.
    */
    private Date overDate;
    /*
    * 查访方式.
    */
    private String visitway;
    /*
    * 查访地点.
    */
    private String visitadd;
    /*
    * 主调查人.
    */
    private String leadInvestigator;
    /*
    * 辅助调查人.
    */
    private String assInvestigator;
    /*
    * 调查日期.
    */
    private Date surveydate;
    /*
    * 调查周期.
    */
    private String surveyLength;
    /*
    * 下次调查日期.
    */
    private Date nextSurveydate;
    /*
    * 调查方式.
    */
    private String surveyType;
    /*
    * 调查方式说明.
    */
    private String surveyTypeinfo;
    /*
    * 调查地点.
    */
    private String surveyAdd;
    /*
    * 调查地点说明.
    */
    private String surveyAddinfo;
    /*
    * 有无行内同仁一起随行.
    */
    private String havePer;
    /*
    * 随行人姓名.
    */
    private String havePerSname;
    /*
    * 与借款人联系是否困难.
    */
    private String contactDiff;
    /*
    * 是否与借款人/单位负责人见面.
    */
    private String loanperMeet;
    /*
    * 借款人对检查是否配合.
    */
    private String loanperCooperate;
    /*
    * 借款人是否有涉讼或财产遭假扣押或禁止处份或强制执行.
    */
    private String loanperEnforce;
    /*
    * 借款人是否有涉讼或财产遭假扣押或禁止处份或强制执行，说明.
    */
    private String loanperEnforceinfo;
    /*
    * 目前贷款户工作状态.
    */
    private String perWorkstatus;
    /*
    * 目前贷款户工作状态说明.
    */
    private String perWorkinfo;
    /*
    * 贷款户的工作岗位是否有变动.
    */
    private String perPostchange;
    /*
    * 最新职务为.
    */
    private String perPostinfo;
    /*
    * 贷款户是否更换新的工作单位.
    */
    private String perNewjob;
    /*
    * 当年更换次数.
    */
    private Integer perNewjobcount;
    /*
    * 新单位名称.
    */
    private String perNewjobSname;
    /*
    * 贷款户目前是否已经下岗, 且在待业中.
    */
    private String perHavework;
    /*
    * 下岗月数.
    */
    private Integer perNoworklength;
    /*
    * 贷款户任职之企业是否有拖欠薪资状况.
    */
    private String perOverwages;
    /*
    * 拖欠月数.
    */
    private Integer perOverlength;
    /*
    * 贷款户任职之企业是否已有倒闭; 关厂的迹象.
    */
    private String perComover;
    /*
    * 贷款户家人是否在我行有其他借款或资金需求.
    */
    private String perOthfamloan;
    /*
    * 借款人数.
    */
    private Integer perFamloancou;
    /*
    * 如果有; 资金需求多少.
    */
    private Double perFamamount;
    /*
    * 已向他行借款金额多少.
    */
    private Double perFamhasamount;
    /*
    * 他行银行名称.
    */
    private String perFamhasbank;
    /*
    * 是否已经改变住家(或公司)地址.
    */
    private String perChangeadd;
    /*
    * 改变地址次数.
    */
    private Integer perChangeaddcount;
    /*
    * 改变住家(或公司)地址详细.
    */
    private String perChangeaddinfo;
    /*
    * 最近是否为其他人担保? 做保证人.
    */
    private String perHaveguarantor;
    /*
    * 保证户户数.
    */
    private Integer perGuarantorcount;
    /*
    * 保证总金额.
    */
    private Double perGuarantoramt;
    /*
    * 贷款户身体状况如何? 是否会影响还款能力.
    */
    private String perHralthstatus;
    /*
    * 贷款户身体状况如何? 是否会影响还款能力?说明：.
    */
    private String perHralthinfo;
    /*
    * 贷款户家庭状况说明? 如身体? 经济? 夫妻感情.
    */
    private String perFamily;
    /*
    * 贷款户家庭状况说明? 如身体? 经济? 夫妻感情，说明.
    */
    private String perFamilyinfo;
    /*
    * 贷款户在生活上; 经济上; 精神上是否有较大的改变.
    */
    private String perLiveinfo;
    /*
    * 贷款户或配偶是否有其他投资项目?.
    */
    private String perSpouseinvite;
    /*
    * 贷款户或配偶是否有其他投资项目?说明.
    */
    private String perSpouseinfo;
    /*
    * 最近是否有个人私人借款行为?.
    */
    private String perIllegal;
    /*
    * 私人借款金额.
    */
    private Double perIllegalamt;
    /*
    * 其他说明.
    */
    private String othinfo;
    /*
    * 保证人征信报告日期.
    */
    private Date guaRepdate;
    /*
    * 保证人联系是否更改.
    */
    private String guaContactch;
    /*
    * 工作单位.
    */
    private String gua1Comname;
    /*
    * 手机号码.
    */
    private String gua1Tel;
    /*
    * 联络地址.
    */
    private String gua1Address;
    /*
    * 工作单位.
    */
    private String gua2Comname;
    /*
    * 手机号码.
    */
    private String gua2Tel;
    /*
    * 联络地址.
    */
    private String gua2Address;
    /*
    * 保证人姓名.
    */
    private String guaName;
    /*
    * 保证人身份证号.
    */
    private String guaIdcard;
    /*
    * 保证人联系电话.
    */
    private String guaTel;
    /*
    * 保证人联系地址.
    */
    private String guaAddress;
    /*
    * 呆帐产生.
    */
    private String guaBadaccount;
    /*
    * 缴款逾期次数.
    */
    private String guaOvercount;
    /*
    * 增加贷款金额.
    */
    private String guaAddfinace;
    /*
    * 新增贷款银行.
    */
    private String guaAddloanbank;
    /*
    * 最近是否有变更贷款户企业负责人.
    */
    private String opsChangeper;
    /*
    * 变更次数.
    */
    private Integer opsChangecount;
    /*
    * 最近是否有增加股东? 新增股东原因为何.
    */
    private String opsAddboss;
    /*
    * 增加位数.
    */
    private Integer opsAddstockcount;
    /*
    * 增加说明.
    */
    private String opsAddstockinfo;
    /*
    * 最近业务发展的状况如何? 是否有增加或减少通路厂商?.
    */
    private String opsLatelyifo;
    /*
    * 最近是否有新招募员工.
    */
    private String opsAddstaff;
    /*
    * 新招募员工数量.
    */
    private Integer opsAddstaffcount;
    /*
    * 现行员工数.
    */
    private Integer opsStaffcount;
    /*
    * 预计减少位数.
    */
    private Integer opsStafflesscount;
    /*
    * 与保证人的联络关系状况说明.
    */
    private String opsGuacontactinfo;
    /*
    * 最近产业状况如何? 市场经济状况如何.
    */
    private String opsMarkinfo;
    /*
    * 主要供应商是否有增加或减少.
    */
    private String opsAddsupp;
    /*
    * 主要供应商增加数量.
    */
    private Integer opsAddsuppcount;
    /*
    * 主要经销商是否有增加或减少.
    */
    private String opsAdddeal;
    /*
    * 主要经销商是否有增加数量.
    */
    private Integer opsAdddealcount;
    /*
    * 主要关联企业/股东与本行借款人的关联交易所产生的营业额是多少金额.
    */
    private Double opsOpsamount;
    /*
    * 企业是否已经为歇业状态.
    */
    private String opsComstop;
    /*
    * 最近是否有资金需求? 目的为何.
    */
    private String finNeedmoney;
    /*
    * 资金需求说明.
    */
    private String finNeedmoneyinfo;
    /*
    * 需要资金.
    */
    private Double finNeedmoneycount;
    /*
    * 之前的担保品是否有改变质押银行.
    */
    private String finChangebank;
    /*
    * 改变质押银行原因.
    */
    private String finChangebankinfo;
    /*
    * 私人借款行为说明.
    */
    private String perIllegalinfo;
    /*
    * 公司股东或配偶是否在我方商行有借款行为.
    */
    private String finOthloan;
    /*
    * 公司股东或配偶是否在我方商行有借款数量.
    */
    private Integer finOthloancount;
    /*
    * 公司股东或配偶是否在共他商行或私营单位有借款行为.
    */
    private String finOthbankloan;
    /*
    * 公司股东或配偶是否在共他商行或私营单位有借款行为说明.
    */
    private String finOthbankloaninfo;
    /*
    * 借款人或配偶是否有投资股票的操作.
    */
    private String finStock;
    /*
    * 投资股票金额.
    */
    private Double finStockamt;
    /*
    * 是否已取得贷款户每月财报.
    */
    private String finMobthreport;
    /*
    * 目前为止总应收帐款总金额多少.
    */
    private Double finChargeamt;
    /*
    * 主要应收帐的买方公司名称.
    */
    private String finChargeacomname;
    /*
    * 主要应收帐的买方公司联络姓名.
    */
    private String finChargeapername;
    /*
    * 主要应收帐的买方公司联络电话.
    */
    private String finChargeapertel;
    /*
    * 关联任务ID.
    */
    private String taskid;
    /*
    * 创建日期.
    */
    private Date credited;
    /*
    * 修改日期.
    */
    private Date updated;
    /*
    * 操作人.
    */
    private String operator;
    /*
    * 操作行.
    */
    private String operBank;
    /*
    * 状态.
    */
    private String status;
    /*
     * 产品类型.
     */
     private String productType;
     /*
      * 红灯数量.
     */
     private Integer redCount;
     /*
     * 黄灯数量.
     */
     private Integer yellowCount;
     
     //非事务字段
     private String operatorNam;
     private String operBankNam;

    public TPlZxrfInfo() {
    }

	
    public TPlZxrfInfo(String id) {
        this.id = id;
    }
    public TPlZxrfInfo(String id, String custtype, String custname, String custcode, String loanAccount, String productCode, Double loanBalance, String industry, Double loanAmount, Date grantDate, Date overDate, String visitway, String visitadd, String leadInvestigator, String assInvestigator, Date surveydate, String surveyLength, Date nextSurveydate, String surveyType, String surveyTypeinfo, String surveyAdd, String surveyAddinfo, String havePer, String havePerSname, String contactDiff, String loanperMeet, String loanperCooperate, String loanperEnforce, String loanperEnforceinfo, String perWorkstatus, String perWorkinfo, String perPostchange, String perPostinfo, String perNewjob, Integer perNewjobcount, String perNewjobSname, String perHavework, Integer perNoworklength, String perOverwages, Integer perOverlength, String perComover, String perOthfamloan, Integer perFamloancou, Double perFamamount, Double perFamhasamount, String perFamhasbank, String perChangeadd, Integer perChangeaddcount, String perChangeaddinfo, String perHaveguarantor, Integer perGuarantorcount, Double perGuarantoramt, String perHralthstatus, String perHralthinfo, String perFamily, String perFamilyinfo, String perLiveinfo, String perSpouseinvite, String perSpouseinfo, String perIllegal, Double perIllegalamt, String othinfo, Date guaRepdate, String guaContactch, String gua1Comname, String gua1Tel, String gua1Address, String gua2Comname, String gua2Tel, String gua2Address, String guaName, String guaIdcard, String guaTel, String guaAddress, String guaBadaccount, String guaOvercount, String guaAddfinace, String guaAddloanbank, String opsChangeper, Integer opsChangecount, String opsAddboss, Integer opsAddstockcount, String opsAddstockinfo, String opsLatelyifo, String opsAddstaff, Integer opsAddstaffcount, Integer opsStaffcount, Integer opsStafflesscount, String opsGuacontactinfo, String opsMarkinfo, String opsAddsupp, Integer opsAddsuppcount, String opsAdddeal, Integer opsAdddealcount, Double opsOpsamount, String opsComstop, String finNeedmoney, String finNeedmoneyinfo, Double finNeedmoneycount, String finChangebank, String finChangebankinfo, String perIllegalinfo, String finOthloan, Integer finOthloancount, String finOthbankloan, String finOthbankloaninfo, String finStock, Double finStockamt, String finMobthreport, Double finChargeamt, String finChargeacomname, String finChargeapername, String finChargeapertel, String taskid, Date credited, Date updated, String operator, String operBank, String status, String productType,Integer redCount,Integer yellowCount) {
       this.id = id;
       this.custtype = custtype;
       this.custname = custname;
       this.custcode = custcode;
       this.loanAccount = loanAccount;
       this.productCode = productCode;
       this.loanBalance = loanBalance;
       this.industry = industry;
       this.loanAmount = loanAmount;
       this.grantDate = grantDate;
       this.overDate = overDate;
       this.visitway = visitway;
       this.visitadd = visitadd;
       this.leadInvestigator = leadInvestigator;
       this.assInvestigator = assInvestigator;
       this.surveydate = surveydate;
       this.surveyLength = surveyLength;
       this.nextSurveydate = nextSurveydate;
       this.surveyType = surveyType;
       this.surveyTypeinfo = surveyTypeinfo;
       this.surveyAdd = surveyAdd;
       this.surveyAddinfo = surveyAddinfo;
       this.havePer = havePer;
       this.havePerSname = havePerSname;
       this.contactDiff = contactDiff;
       this.loanperMeet = loanperMeet;
       this.loanperCooperate = loanperCooperate;
       this.loanperEnforce = loanperEnforce;
       this.loanperEnforceinfo = loanperEnforceinfo;
       this.perWorkstatus = perWorkstatus;
       this.perWorkinfo = perWorkinfo;
       this.perPostchange = perPostchange;
       this.perPostinfo = perPostinfo;
       this.perNewjob = perNewjob;
       this.perNewjobcount = perNewjobcount;
       this.perNewjobSname = perNewjobSname;
       this.perHavework = perHavework;
       this.perNoworklength = perNoworklength;
       this.perOverwages = perOverwages;
       this.perOverlength = perOverlength;
       this.perComover = perComover;
       this.perOthfamloan = perOthfamloan;
       this.perFamloancou = perFamloancou;
       this.perFamamount = perFamamount;
       this.perFamhasamount = perFamhasamount;
       this.perFamhasbank = perFamhasbank;
       this.perChangeadd = perChangeadd;
       this.perChangeaddcount = perChangeaddcount;
       this.perChangeaddinfo = perChangeaddinfo;
       this.perHaveguarantor = perHaveguarantor;
       this.perGuarantorcount = perGuarantorcount;
       this.perGuarantoramt = perGuarantoramt;
       this.perHralthstatus = perHralthstatus;
       this.perHralthinfo = perHralthinfo;
       this.perFamily = perFamily;
       this.perFamilyinfo = perFamilyinfo;
       this.perLiveinfo = perLiveinfo;
       this.perSpouseinvite = perSpouseinvite;
       this.perSpouseinfo = perSpouseinfo;
       this.perIllegal = perIllegal;
       this.perIllegalamt = perIllegalamt;
       this.othinfo = othinfo;
       this.guaRepdate = guaRepdate;
       this.guaContactch = guaContactch;
       this.gua1Comname = gua1Comname;
       this.gua1Tel = gua1Tel;
       this.gua1Address = gua1Address;
       this.gua2Comname = gua2Comname;
       this.gua2Tel = gua2Tel;
       this.gua2Address = gua2Address;
       this.guaName = guaName;
       this.guaIdcard = guaIdcard;
       this.guaTel = guaTel;
       this.guaAddress = guaAddress;
       this.guaBadaccount = guaBadaccount;
       this.guaOvercount = guaOvercount;
       this.guaAddfinace = guaAddfinace;
       this.guaAddloanbank = guaAddloanbank;
       this.opsChangeper = opsChangeper;
       this.opsChangecount = opsChangecount;
       this.opsAddboss = opsAddboss;
       this.opsAddstockcount = opsAddstockcount;
       this.opsAddstockinfo = opsAddstockinfo;
       this.opsLatelyifo = opsLatelyifo;
       this.opsAddstaff = opsAddstaff;
       this.opsAddstaffcount = opsAddstaffcount;
       this.opsStaffcount = opsStaffcount;
       this.opsStafflesscount = opsStafflesscount;
       this.opsGuacontactinfo = opsGuacontactinfo;
       this.opsMarkinfo = opsMarkinfo;
       this.opsAddsupp = opsAddsupp;
       this.opsAddsuppcount = opsAddsuppcount;
       this.opsAdddeal = opsAdddeal;
       this.opsAdddealcount = opsAdddealcount;
       this.opsOpsamount = opsOpsamount;
       this.opsComstop = opsComstop;
       this.finNeedmoney = finNeedmoney;
       this.finNeedmoneyinfo = finNeedmoneyinfo;
       this.finNeedmoneycount = finNeedmoneycount;
       this.finChangebank = finChangebank;
       this.finChangebankinfo = finChangebankinfo;
       this.perIllegalinfo = perIllegalinfo;
       this.finOthloan = finOthloan;
       this.finOthloancount = finOthloancount;
       this.finOthbankloan = finOthbankloan;
       this.finOthbankloaninfo = finOthbankloaninfo;
       this.finStock = finStock;
       this.finStockamt = finStockamt;
       this.finMobthreport = finMobthreport;
       this.finChargeamt = finChargeamt;
       this.finChargeacomname = finChargeacomname;
       this.finChargeapername = finChargeapername;
       this.finChargeapertel = finChargeapertel;
       this.taskid = taskid;
       this.credited = credited;
       this.updated = updated;
       this.operator = operator;
       this.operBank = operBank;
       this.status = status;
       this.productType = productType;
       this.redCount = redCount;
       this.yellowCount = yellowCount;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getCusttype() {
        return this.custtype;
    }
    
    public void setCusttype(String custtype) {
        this.custtype = custtype;
    }
    public String getCustname() {
        return this.custname;
    }
    
    public void setCustname(String custname) {
        this.custname = custname;
    }
    public String getCustcode() {
        return this.custcode;
    }
    
    public void setCustcode(String custcode) {
        this.custcode = custcode;
    }
    public String getLoanAccount() {
        return this.loanAccount;
    }
    
    public void setLoanAccount(String loanAccount) {
        this.loanAccount = loanAccount;
    }
    public String getProductCode() {
        return this.productCode;
    }
    
    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }
    public Double getLoanBalance() {
        return this.loanBalance;
    }
    
    public void setLoanBalance(Double loanBalance) {
        this.loanBalance = loanBalance;
    }
    public String getIndustry() {
        return this.industry;
    }
    
    public void setIndustry(String industry) {
        this.industry = industry;
    }
    public Double getLoanAmount() {
        return this.loanAmount;
    }
    
    public void setLoanAmount(Double loanAmount) {
        this.loanAmount = loanAmount;
    }
    public Date getGrantDate() {
        return this.grantDate;
    }
    
    public void setGrantDate(Date grantDate) {
        this.grantDate = grantDate;
    }
    public Date getOverDate() {
        return this.overDate;
    }
    
    public void setOverDate(Date overDate) {
        this.overDate = overDate;
    }
    public String getVisitway() {
        return this.visitway;
    }
    
    public void setVisitway(String visitway) {
        this.visitway = visitway;
    }
    public String getVisitadd() {
        return this.visitadd;
    }
    
    public void setVisitadd(String visitadd) {
        this.visitadd = visitadd;
    }
    public String getLeadInvestigator() {
        return this.leadInvestigator;
    }
    
    public void setLeadInvestigator(String leadInvestigator) {
        this.leadInvestigator = leadInvestigator;
    }
    public String getAssInvestigator() {
        return this.assInvestigator;
    }
    
    public void setAssInvestigator(String assInvestigator) {
        this.assInvestigator = assInvestigator;
    }
    public Date getSurveydate() {
        return this.surveydate;
    }
    
    public void setSurveydate(Date surveydate) {
        this.surveydate = surveydate;
    }
    public String getSurveyLength() {
        return this.surveyLength;
    }
    
    public void setSurveyLength(String surveyLength) {
        this.surveyLength = surveyLength;
    }
    public Date getNextSurveydate() {
        return this.nextSurveydate;
    }
    
    public void setNextSurveydate(Date nextSurveydate) {
        this.nextSurveydate = nextSurveydate;
    }
    public String getSurveyType() {
        return this.surveyType;
    }
    
    public void setSurveyType(String surveyType) {
        this.surveyType = surveyType;
    }
    public String getSurveyTypeinfo() {
        return this.surveyTypeinfo;
    }
    
    public void setSurveyTypeinfo(String surveyTypeinfo) {
        this.surveyTypeinfo = surveyTypeinfo;
    }
    public String getSurveyAdd() {
        return this.surveyAdd;
    }
    
    public void setSurveyAdd(String surveyAdd) {
        this.surveyAdd = surveyAdd;
    }
    public String getSurveyAddinfo() {
        return this.surveyAddinfo;
    }
    
    public void setSurveyAddinfo(String surveyAddinfo) {
        this.surveyAddinfo = surveyAddinfo;
    }
    public String getHavePer() {
        return this.havePer;
    }
    
    public void setHavePer(String havePer) {
        this.havePer = havePer;
    }
    public String getHavePerSname() {
        return this.havePerSname;
    }
    
    public void setHavePerSname(String havePerSname) {
        this.havePerSname = havePerSname;
    }
    public String getContactDiff() {
        return this.contactDiff;
    }
    
    public void setContactDiff(String contactDiff) {
        this.contactDiff = contactDiff;
    }
    public String getLoanperMeet() {
        return this.loanperMeet;
    }
    
    public void setLoanperMeet(String loanperMeet) {
        this.loanperMeet = loanperMeet;
    }
    public String getLoanperCooperate() {
        return this.loanperCooperate;
    }
    
    public void setLoanperCooperate(String loanperCooperate) {
        this.loanperCooperate = loanperCooperate;
    }
    public String getLoanperEnforce() {
        return this.loanperEnforce;
    }
    
    public void setLoanperEnforce(String loanperEnforce) {
        this.loanperEnforce = loanperEnforce;
    }
    public String getLoanperEnforceinfo() {
        return this.loanperEnforceinfo;
    }
    
    public void setLoanperEnforceinfo(String loanperEnforceinfo) {
        this.loanperEnforceinfo = loanperEnforceinfo;
    }
    public String getPerWorkstatus() {
        return this.perWorkstatus;
    }
    
    public void setPerWorkstatus(String perWorkstatus) {
        this.perWorkstatus = perWorkstatus;
    }
    public String getPerWorkinfo() {
        return this.perWorkinfo;
    }
    
    public void setPerWorkinfo(String perWorkinfo) {
        this.perWorkinfo = perWorkinfo;
    }
    public String getPerPostchange() {
        return this.perPostchange;
    }
    
    public void setPerPostchange(String perPostchange) {
        this.perPostchange = perPostchange;
    }
    public String getPerPostinfo() {
        return this.perPostinfo;
    }
    
    public void setPerPostinfo(String perPostinfo) {
        this.perPostinfo = perPostinfo;
    }
    public String getPerNewjob() {
        return this.perNewjob;
    }
    
    public void setPerNewjob(String perNewjob) {
        this.perNewjob = perNewjob;
    }
    public Integer getPerNewjobcount() {
        return this.perNewjobcount;
    }
    
    public void setPerNewjobcount(Integer perNewjobcount) {
        this.perNewjobcount = perNewjobcount;
    }
    public String getPerNewjobSname() {
        return this.perNewjobSname;
    }
    
    public void setPerNewjobSname(String perNewjobSname) {
        this.perNewjobSname = perNewjobSname;
    }
    public String getPerHavework() {
        return this.perHavework;
    }
    
    public void setPerHavework(String perHavework) {
        this.perHavework = perHavework;
    }
    public Integer getPerNoworklength() {
        return this.perNoworklength;
    }
    
    public void setPerNoworklength(Integer perNoworklength) {
        this.perNoworklength = perNoworklength;
    }
    public String getPerOverwages() {
        return this.perOverwages;
    }
    
    public void setPerOverwages(String perOverwages) {
        this.perOverwages = perOverwages;
    }
    public Integer getPerOverlength() {
        return this.perOverlength;
    }
    
    public void setPerOverlength(Integer perOverlength) {
        this.perOverlength = perOverlength;
    }
    public String getPerComover() {
        return this.perComover;
    }
    
    public void setPerComover(String perComover) {
        this.perComover = perComover;
    }
    public String getPerOthfamloan() {
        return this.perOthfamloan;
    }
    
    public void setPerOthfamloan(String perOthfamloan) {
        this.perOthfamloan = perOthfamloan;
    }
    public Integer getPerFamloancou() {
        return this.perFamloancou;
    }
    
    public void setPerFamloancou(Integer perFamloancou) {
        this.perFamloancou = perFamloancou;
    }
    public Double getPerFamamount() {
        return this.perFamamount;
    }
    
    public void setPerFamamount(Double perFamamount) {
        this.perFamamount = perFamamount;
    }
    public Double getPerFamhasamount() {
        return this.perFamhasamount;
    }
    
    public void setPerFamhasamount(Double perFamhasamount) {
        this.perFamhasamount = perFamhasamount;
    }
    public String getPerFamhasbank() {
        return this.perFamhasbank;
    }
    
    public void setPerFamhasbank(String perFamhasbank) {
        this.perFamhasbank = perFamhasbank;
    }
    public String getPerChangeadd() {
        return this.perChangeadd;
    }
    
    public void setPerChangeadd(String perChangeadd) {
        this.perChangeadd = perChangeadd;
    }
    public Integer getPerChangeaddcount() {
        return this.perChangeaddcount;
    }
    
    public void setPerChangeaddcount(Integer perChangeaddcount) {
        this.perChangeaddcount = perChangeaddcount;
    }
    public String getPerChangeaddinfo() {
        return this.perChangeaddinfo;
    }
    
    public void setPerChangeaddinfo(String perChangeaddinfo) {
        this.perChangeaddinfo = perChangeaddinfo;
    }
    public String getPerHaveguarantor() {
        return this.perHaveguarantor;
    }
    
    public void setPerHaveguarantor(String perHaveguarantor) {
        this.perHaveguarantor = perHaveguarantor;
    }
    public Integer getPerGuarantorcount() {
        return this.perGuarantorcount;
    }
    
    public void setPerGuarantorcount(Integer perGuarantorcount) {
        this.perGuarantorcount = perGuarantorcount;
    }
    public Double getPerGuarantoramt() {
        return this.perGuarantoramt;
    }
    
    public void setPerGuarantoramt(Double perGuarantoramt) {
        this.perGuarantoramt = perGuarantoramt;
    }
    public String getPerHralthstatus() {
        return this.perHralthstatus;
    }
    
    public void setPerHralthstatus(String perHralthstatus) {
        this.perHralthstatus = perHralthstatus;
    }
    public String getPerHralthinfo() {
        return this.perHralthinfo;
    }
    
    public void setPerHralthinfo(String perHralthinfo) {
        this.perHralthinfo = perHralthinfo;
    }
    public String getPerFamily() {
        return this.perFamily;
    }
    
    public void setPerFamily(String perFamily) {
        this.perFamily = perFamily;
    }
    public String getPerFamilyinfo() {
        return this.perFamilyinfo;
    }
    
    public void setPerFamilyinfo(String perFamilyinfo) {
        this.perFamilyinfo = perFamilyinfo;
    }
    public String getPerLiveinfo() {
        return this.perLiveinfo;
    }
    
    public void setPerLiveinfo(String perLiveinfo) {
        this.perLiveinfo = perLiveinfo;
    }
    public String getPerSpouseinvite() {
        return this.perSpouseinvite;
    }
    
    public void setPerSpouseinvite(String perSpouseinvite) {
        this.perSpouseinvite = perSpouseinvite;
    }
    public String getPerSpouseinfo() {
        return this.perSpouseinfo;
    }
    
    public void setPerSpouseinfo(String perSpouseinfo) {
        this.perSpouseinfo = perSpouseinfo;
    }
    public String getPerIllegal() {
        return this.perIllegal;
    }
    
    public void setPerIllegal(String perIllegal) {
        this.perIllegal = perIllegal;
    }
    public Double getPerIllegalamt() {
        return this.perIllegalamt;
    }
    
    public void setPerIllegalamt(Double perIllegalamt) {
        this.perIllegalamt = perIllegalamt;
    }
    public String getOthinfo() {
        return this.othinfo;
    }
    
    public void setOthinfo(String othinfo) {
        this.othinfo = othinfo;
    }
    public Date getGuaRepdate() {
        return this.guaRepdate;
    }
    
    public void setGuaRepdate(Date guaRepdate) {
        this.guaRepdate = guaRepdate;
    }
    public String getGuaContactch() {
        return this.guaContactch;
    }
    
    public void setGuaContactch(String guaContactch) {
        this.guaContactch = guaContactch;
    }
    public String getGua1Comname() {
        return this.gua1Comname;
    }
    
    public void setGua1Comname(String gua1Comname) {
        this.gua1Comname = gua1Comname;
    }
    public String getGua1Tel() {
        return this.gua1Tel;
    }
    
    public void setGua1Tel(String gua1Tel) {
        this.gua1Tel = gua1Tel;
    }
    public String getGua1Address() {
        return this.gua1Address;
    }
    
    public void setGua1Address(String gua1Address) {
        this.gua1Address = gua1Address;
    }
    public String getGua2Comname() {
        return this.gua2Comname;
    }
    
    public void setGua2Comname(String gua2Comname) {
        this.gua2Comname = gua2Comname;
    }
    public String getGua2Tel() {
        return this.gua2Tel;
    }
    
    public void setGua2Tel(String gua2Tel) {
        this.gua2Tel = gua2Tel;
    }
    public String getGua2Address() {
        return this.gua2Address;
    }
    
    public void setGua2Address(String gua2Address) {
        this.gua2Address = gua2Address;
    }
    public String getGuaName() {
        return this.guaName;
    }
    
    public void setGuaName(String guaName) {
        this.guaName = guaName;
    }
    public String getGuaIdcard() {
        return this.guaIdcard;
    }
    
    public void setGuaIdcard(String guaIdcard) {
        this.guaIdcard = guaIdcard;
    }
    public String getGuaTel() {
        return this.guaTel;
    }
    
    public void setGuaTel(String guaTel) {
        this.guaTel = guaTel;
    }
    public String getGuaAddress() {
        return this.guaAddress;
    }
    
    public void setGuaAddress(String guaAddress) {
        this.guaAddress = guaAddress;
    }
    public String getGuaBadaccount() {
        return this.guaBadaccount;
    }
    
    public void setGuaBadaccount(String guaBadaccount) {
        this.guaBadaccount = guaBadaccount;
    }
    public String getGuaOvercount() {
        return this.guaOvercount;
    }
    
    public void setGuaOvercount(String guaOvercount) {
        this.guaOvercount = guaOvercount;
    }
    public String getGuaAddfinace() {
        return this.guaAddfinace;
    }
    
    public void setGuaAddfinace(String guaAddfinace) {
        this.guaAddfinace = guaAddfinace;
    }
    public String getGuaAddloanbank() {
        return this.guaAddloanbank;
    }
    
    public void setGuaAddloanbank(String guaAddloanbank) {
        this.guaAddloanbank = guaAddloanbank;
    }
    public String getOpsChangeper() {
        return this.opsChangeper;
    }
    
    public void setOpsChangeper(String opsChangeper) {
        this.opsChangeper = opsChangeper;
    }
    public Integer getOpsChangecount() {
        return this.opsChangecount;
    }
    
    public void setOpsChangecount(Integer opsChangecount) {
        this.opsChangecount = opsChangecount;
    }
    public String getOpsAddboss() {
        return this.opsAddboss;
    }
    
    public void setOpsAddboss(String opsAddboss) {
        this.opsAddboss = opsAddboss;
    }
    public Integer getOpsAddstockcount() {
        return this.opsAddstockcount;
    }
    
    public void setOpsAddstockcount(Integer opsAddstockcount) {
        this.opsAddstockcount = opsAddstockcount;
    }
    public String getOpsAddstockinfo() {
        return this.opsAddstockinfo;
    }
    
    public void setOpsAddstockinfo(String opsAddstockinfo) {
        this.opsAddstockinfo = opsAddstockinfo;
    }
    public String getOpsLatelyifo() {
        return this.opsLatelyifo;
    }
    
    public void setOpsLatelyifo(String opsLatelyifo) {
        this.opsLatelyifo = opsLatelyifo;
    }
    public String getOpsAddstaff() {
        return this.opsAddstaff;
    }
    
    public void setOpsAddstaff(String opsAddstaff) {
        this.opsAddstaff = opsAddstaff;
    }
    public Integer getOpsAddstaffcount() {
        return this.opsAddstaffcount;
    }
    
    public void setOpsAddstaffcount(Integer opsAddstaffcount) {
        this.opsAddstaffcount = opsAddstaffcount;
    }
    public Integer getOpsStaffcount() {
        return this.opsStaffcount;
    }
    
    public void setOpsStaffcount(Integer opsStaffcount) {
        this.opsStaffcount = opsStaffcount;
    }
    public Integer getOpsStafflesscount() {
        return this.opsStafflesscount;
    }
    
    public void setOpsStafflesscount(Integer opsStafflesscount) {
        this.opsStafflesscount = opsStafflesscount;
    }
    public String getOpsGuacontactinfo() {
        return this.opsGuacontactinfo;
    }
    
    public void setOpsGuacontactinfo(String opsGuacontactinfo) {
        this.opsGuacontactinfo = opsGuacontactinfo;
    }
    public String getOpsMarkinfo() {
        return this.opsMarkinfo;
    }
    
    public void setOpsMarkinfo(String opsMarkinfo) {
        this.opsMarkinfo = opsMarkinfo;
    }
    public String getOpsAddsupp() {
        return this.opsAddsupp;
    }
    
    public void setOpsAddsupp(String opsAddsupp) {
        this.opsAddsupp = opsAddsupp;
    }
    public Integer getOpsAddsuppcount() {
        return this.opsAddsuppcount;
    }
    
    public void setOpsAddsuppcount(Integer opsAddsuppcount) {
        this.opsAddsuppcount = opsAddsuppcount;
    }
    public String getOpsAdddeal() {
        return this.opsAdddeal;
    }
    
    public void setOpsAdddeal(String opsAdddeal) {
        this.opsAdddeal = opsAdddeal;
    }
    public Integer getOpsAdddealcount() {
        return this.opsAdddealcount;
    }
    
    public void setOpsAdddealcount(Integer opsAdddealcount) {
        this.opsAdddealcount = opsAdddealcount;
    }
    public Double getOpsOpsamount() {
        return this.opsOpsamount;
    }
    
    public void setOpsOpsamount(Double opsOpsamount) {
        this.opsOpsamount = opsOpsamount;
    }
    public String getOpsComstop() {
        return this.opsComstop;
    }
    
    public void setOpsComstop(String opsComstop) {
        this.opsComstop = opsComstop;
    }
    public String getFinNeedmoney() {
        return this.finNeedmoney;
    }
    
    public void setFinNeedmoney(String finNeedmoney) {
        this.finNeedmoney = finNeedmoney;
    }
    public String getFinNeedmoneyinfo() {
        return this.finNeedmoneyinfo;
    }
    
    public void setFinNeedmoneyinfo(String finNeedmoneyinfo) {
        this.finNeedmoneyinfo = finNeedmoneyinfo;
    }
    public Double getFinNeedmoneycount() {
        return this.finNeedmoneycount;
    }
    
    public void setFinNeedmoneycount(Double finNeedmoneycount) {
        this.finNeedmoneycount = finNeedmoneycount;
    }
    public String getFinChangebank() {
        return this.finChangebank;
    }
    
    public void setFinChangebank(String finChangebank) {
        this.finChangebank = finChangebank;
    }
    public String getFinChangebankinfo() {
        return this.finChangebankinfo;
    }
    
    public void setFinChangebankinfo(String finChangebankinfo) {
        this.finChangebankinfo = finChangebankinfo;
    }
    public String getPerIllegalinfo() {
        return this.perIllegalinfo;
    }
    
    public void setPerIllegalinfo(String perIllegalinfo) {
        this.perIllegalinfo = perIllegalinfo;
    }
    public String getFinOthloan() {
        return this.finOthloan;
    }
    
    public void setFinOthloan(String finOthloan) {
        this.finOthloan = finOthloan;
    }
    public Integer getFinOthloancount() {
        return this.finOthloancount;
    }
    
    public void setFinOthloancount(Integer finOthloancount) {
        this.finOthloancount = finOthloancount;
    }
    public String getFinOthbankloan() {
        return this.finOthbankloan;
    }
    
    public void setFinOthbankloan(String finOthbankloan) {
        this.finOthbankloan = finOthbankloan;
    }
    public String getFinOthbankloaninfo() {
        return this.finOthbankloaninfo;
    }
    
    public void setFinOthbankloaninfo(String finOthbankloaninfo) {
        this.finOthbankloaninfo = finOthbankloaninfo;
    }
    public String getFinStock() {
        return this.finStock;
    }
    
    public void setFinStock(String finStock) {
        this.finStock = finStock;
    }
    public Double getFinStockamt() {
        return this.finStockamt;
    }
    
    public void setFinStockamt(Double finStockamt) {
        this.finStockamt = finStockamt;
    }
    public String getFinMobthreport() {
        return this.finMobthreport;
    }
    
    public void setFinMobthreport(String finMobthreport) {
        this.finMobthreport = finMobthreport;
    }
    public Double getFinChargeamt() {
        return this.finChargeamt;
    }
    
    public void setFinChargeamt(Double finChargeamt) {
        this.finChargeamt = finChargeamt;
    }
    public String getFinChargeacomname() {
        return this.finChargeacomname;
    }
    
    public void setFinChargeacomname(String finChargeacomname) {
        this.finChargeacomname = finChargeacomname;
    }
    public String getFinChargeapername() {
        return this.finChargeapername;
    }
    
    public void setFinChargeapername(String finChargeapername) {
        this.finChargeapername = finChargeapername;
    }
    public String getFinChargeapertel() {
        return this.finChargeapertel;
    }
    
    public void setFinChargeapertel(String finChargeapertel) {
        this.finChargeapertel = finChargeapertel;
    }
    public String getTaskid() {
        return this.taskid;
    }
    
    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }
    public Date getCredited() {
        return this.credited;
    }
    
    public void setCredited(Date credited) {
        this.credited = credited;
    }
    public Date getUpdated() {
        return this.updated;
    }
    
    public void setUpdated(Date updated) {
        this.updated = updated;
    }
    public String getOperator() {
        return this.operator;
    }
    
    public void setOperator(String operator) {
        this.operator = operator;
    }
    public String getOperBank() {
        return this.operBank;
    }
    
    public void setOperBank(String operBank) {
        this.operBank = operBank;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }


	public String getProductType() {
		return productType;
	}


	public void setProductType(String productType) {
		this.productType = productType;
	}


	public Integer getRedCount() {
		return redCount;
	}


	public void setRedCount(Integer redCount) {
		this.redCount = redCount;
	}


	public Integer getYellowCount() {
		return yellowCount;
	}


	public void setYellowCount(Integer yellowCount) {
		this.yellowCount = yellowCount;
	}


	public String getOperatorNam() {
		return operatorNam;
	}


	public void setOperatorNam(String operatorNam) {
		this.operatorNam = operatorNam;
	}


	public String getOperBankNam() {
		return operBankNam;
	}


	public void setOperBankNam(String operBankNam) {
		this.operBankNam = operBankNam;
	}




}


