package com.gbicc.company.single.outputentity;
// Generated 2016-3-20 18:31:15 by Hibernate Tools 3.2.2.GA


import java.math.BigDecimal;
import java.util.Date;

/**
 * TRewC09DraftInfoId generated by hbm2java
 */
public class C09  implements java.io.Serializable {

	private static final long serialVersionUID = -3682259711816729378L;
	
	/*
    * ID序号.
    */
    private Integer id;
    /*
    * 票号                  							.
    */
    private String draftNumber;
    /*
    * 凭证号                                                                    .
    */
    private String voucherNo;
    /*
    * 票级别                                                                    .
    */
    private String draftClass;
    /*
    * 理财期次                                                                  .
    */
    private String draftTerm;
    /*
    * 票据级控制标志                                                            .
    */
    private String dfclsCtl;
    /*
    * 角色来源                                                                  .
    */
    private String srcType;
    /*
    * 买入协议ID                                                                .
    */
    private Integer buyContractId;
    /*
    * 人行可转让标志                                                            .
    */
    private String endOrSementMk;
    /*
    * 据属性                                                                    .
    */
    private String draftAttr;
    /*
    * 票据类型                                                                  .
    */
    private String draftType;
    /*
    * 出票日                                                                    .
    */
    private String remitDate;
    /*
    * 票面到期日                                                                .
    */
    private String maturityDate;
    /*
    * 客户ID                                                                    .
    */
    private Integer remitterId;
    /*
    * 出票人类别                                                                .
    */
    private String remitterRole;
    /*
    * 出票人组织机构代码                                                        .
    */
    private String remitterCmonid;
    /*
    * 出票人名称                                                                .
    */
    private String remitterName;
    /*
    * 出票人账号                                                                .
    */
    private String remitterAccount;
    /*
    * 出票人开户行ID                                                            .
    */
    private Integer remitterBankId;
    /*
    * 出票人开户行名称                                                          .
    */
    private String remitterBankName;
    /*
    * 出票人-信用等级                                                           .
    */
    private String dfDrwrCdtratgs;
    /*
    * 出票人-评级机构                                                           .
    */
    private String dfDrwrCdtratgsagcy;
    /*
    * 出票人-评级到期日                                                         .
    */
    private String dfDrwrCdtratgduedt;
    /*
    * 承兑人类别                                                                .
    */
    private String acceptorRole;
    /*
    * 承兑人                                                                    .
    */
    private String acceptor;
    /*
    * 承兑人开户行                                                              .
    */
    private Integer acceptorBankId;
    /*
    * 承兑人账号                                                                .
    */
    private String acceptorActno;
    /*
    * 承兑人开户行名称                                                          .
    */
    private String acceptorBankName;
    /*
    * 票面收款人名称                                                            .
    */
    private String payeeName;
    /*
    * 票面收款人账号                                                            .
    */
    private String payeeAccount;
    /*
    * 票面收款人开户行ID                                                        .
    */
    private Integer payeeBankId;
    /*
    * 票面收款人开户行                                                          .
    */
    private String payeeBankName;
    /*
    * 收款人客户ID                                                              .
    */
    private Integer payeeId;
    /*
    * 票面收款人组织机构代码                                                    .
    */
    private String payeeOrganCode;
    /*
    * 票面金额                                                                  .
    */
    private BigDecimal faceAmount;
    /*
    * 票面备注                                                                  .
    */
    private String drftRemark;
    /*
    * 是否系统内承兑                                                            .
    */
    private String drawerBankFlag;
    /*
    * 票据所属机构号                                                            .
    */
    private Integer belongBranchId;
    /*
    * 实物库存状态                                                              .
    */
    private String storeStatus;
    /*
    * 票据状态                                                                  .
    */
    private String status;
    /*
    * 处理中状态                                                                .
    */
    private String tmpStatus;
    /*
    * 质押状态                                                                  .
    */
    private String collztnStatus;
    /*
    * 质押登记簿ID                                                              .
    */
    private Integer collztnId;
    /*
    * 挂失状态                                                                  .
    */
    private String lossStatus;
    /*
    * 挂失登记簿ID                                                              .
    */
    private Integer rplossId;
    /*
    * 扣款顺序                                                                  .
    */
    private String debitOrder;
    /*
    * 信息域                                                                    .
    */
    private String misc;
    /*
    * 最后修改操作员号                                                          .
    */
    private Integer lastUpdOperId;
    /*
    * 最后修改时间                                                              .
    */
    private String lastUpdTime;
    /*
    * 预警表ID.
    */
    private String warnId;
    /*
    * 数据日期.
    */
    private Date dataDt;

    public C09() {
    }

	/**
    * Get the ID序号
    */	
    public Integer getId() {
        return this.id;
    }
	/**
    * Set the ID序号
    */	
    public void setId(Integer id) {
        this.id = id;
    }
	/**
    * Get the 票号                  							
    */	
    public String getDraftNumber() {
        return this.draftNumber;
    }
	/**
    * Set the 票号                  							
    */	
    public void setDraftNumber(String draftNumber) {
        this.draftNumber = draftNumber;
    }
	/**
    * Get the 凭证号                                                                    
    */	
    public String getVoucherNo() {
        return this.voucherNo;
    }
	/**
    * Set the 凭证号                                                                    
    */	
    public void setVoucherNo(String voucherNo) {
        this.voucherNo = voucherNo;
    }
	/**
    * Get the 票级别                                                                    
    */	
    public String getDraftClass() {
        return this.draftClass;
    }
	/**
    * Set the 票级别                                                                    
    */	
    public void setDraftClass(String draftClass) {
        this.draftClass = draftClass;
    }
	/**
    * Get the 理财期次                                                                  
    */	
    public String getDraftTerm() {
        return this.draftTerm;
    }
	/**
    * Set the 理财期次                                                                  
    */	
    public void setDraftTerm(String draftTerm) {
        this.draftTerm = draftTerm;
    }
	/**
    * Get the 票据级控制标志                                                            
    */	
    public String getDfclsCtl() {
        return this.dfclsCtl;
    }
	/**
    * Set the 票据级控制标志                                                            
    */	
    public void setDfclsCtl(String dfclsCtl) {
        this.dfclsCtl = dfclsCtl;
    }
	/**
    * Get the 角色来源                                                                  
    */	
    public String getSrcType() {
        return this.srcType;
    }
	/**
    * Set the 角色来源                                                                  
    */	
    public void setSrcType(String srcType) {
        this.srcType = srcType;
    }
	/**
    * Get the 买入协议ID                                                                
    */	
    public Integer getBuyContractId() {
        return this.buyContractId;
    }
	/**
    * Set the 买入协议ID                                                                
    */	
    public void setBuyContractId(Integer buyContractId) {
        this.buyContractId = buyContractId;
    }
	/**
    * Get the 人行可转让标志                                                            
    */	
    public String getEndOrSementMk() {
        return this.endOrSementMk;
    }
	/**
    * Set the 人行可转让标志                                                            
    */	
    public void setEndOrSementMk(String endOrSementMk) {
        this.endOrSementMk = endOrSementMk;
    }
	/**
    * Get the 据属性                                                                    
    */	
    public String getDraftAttr() {
        return this.draftAttr;
    }
	/**
    * Set the 据属性                                                                    
    */	
    public void setDraftAttr(String draftAttr) {
        this.draftAttr = draftAttr;
    }
	/**
    * Get the 票据类型                                                                  
    */	
    public String getDraftType() {
        return this.draftType;
    }
	/**
    * Set the 票据类型                                                                  
    */	
    public void setDraftType(String draftType) {
        this.draftType = draftType;
    }
	/**
    * Get the 出票日                                                                    
    */	
    public String getRemitDate() {
        return this.remitDate;
    }
	/**
    * Set the 出票日                                                                    
    */	
    public void setRemitDate(String remitDate) {
        this.remitDate = remitDate;
    }
	/**
    * Get the 票面到期日                                                                
    */	
    public String getMaturityDate() {
        return this.maturityDate;
    }
	/**
    * Set the 票面到期日                                                                
    */	
    public void setMaturityDate(String maturityDate) {
        this.maturityDate = maturityDate;
    }
	/**
    * Get the 客户ID                                                                    
    */	
    public Integer getRemitterId() {
        return this.remitterId;
    }
	/**
    * Set the 客户ID                                                                    
    */	
    public void setRemitterId(Integer remitterId) {
        this.remitterId = remitterId;
    }
	/**
    * Get the 出票人类别                                                                
    */	
    public String getRemitterRole() {
        return this.remitterRole;
    }
	/**
    * Set the 出票人类别                                                                
    */	
    public void setRemitterRole(String remitterRole) {
        this.remitterRole = remitterRole;
    }
	/**
    * Get the 出票人组织机构代码                                                        
    */	
    public String getRemitterCmonid() {
        return this.remitterCmonid;
    }
	/**
    * Set the 出票人组织机构代码                                                        
    */	
    public void setRemitterCmonid(String remitterCmonid) {
        this.remitterCmonid = remitterCmonid;
    }
	/**
    * Get the 出票人名称                                                                
    */	
    public String getRemitterName() {
        return this.remitterName;
    }
	/**
    * Set the 出票人名称                                                                
    */	
    public void setRemitterName(String remitterName) {
        this.remitterName = remitterName;
    }
	/**
    * Get the 出票人账号                                                                
    */	
    public String getRemitterAccount() {
        return this.remitterAccount;
    }
	/**
    * Set the 出票人账号                                                                
    */	
    public void setRemitterAccount(String remitterAccount) {
        this.remitterAccount = remitterAccount;
    }
	/**
    * Get the 出票人开户行ID                                                            
    */	
    public Integer getRemitterBankId() {
        return this.remitterBankId;
    }
	/**
    * Set the 出票人开户行ID                                                            
    */	
    public void setRemitterBankId(Integer remitterBankId) {
        this.remitterBankId = remitterBankId;
    }
	/**
    * Get the 出票人开户行名称                                                          
    */	
    public String getRemitterBankName() {
        return this.remitterBankName;
    }
	/**
    * Set the 出票人开户行名称                                                          
    */	
    public void setRemitterBankName(String remitterBankName) {
        this.remitterBankName = remitterBankName;
    }
	/**
    * Get the 出票人-信用等级                                                           
    */	
    public String getDfDrwrCdtratgs() {
        return this.dfDrwrCdtratgs;
    }
	/**
    * Set the 出票人-信用等级                                                           
    */	
    public void setDfDrwrCdtratgs(String dfDrwrCdtratgs) {
        this.dfDrwrCdtratgs = dfDrwrCdtratgs;
    }
	/**
    * Get the 出票人-评级机构                                                           
    */	
    public String getDfDrwrCdtratgsagcy() {
        return this.dfDrwrCdtratgsagcy;
    }
	/**
    * Set the 出票人-评级机构                                                           
    */	
    public void setDfDrwrCdtratgsagcy(String dfDrwrCdtratgsagcy) {
        this.dfDrwrCdtratgsagcy = dfDrwrCdtratgsagcy;
    }
	/**
    * Get the 出票人-评级到期日                                                         
    */	
    public String getDfDrwrCdtratgduedt() {
        return this.dfDrwrCdtratgduedt;
    }
	/**
    * Set the 出票人-评级到期日                                                         
    */	
    public void setDfDrwrCdtratgduedt(String dfDrwrCdtratgduedt) {
        this.dfDrwrCdtratgduedt = dfDrwrCdtratgduedt;
    }
	/**
    * Get the 承兑人类别                                                                
    */	
    public String getAcceptorRole() {
        return this.acceptorRole;
    }
	/**
    * Set the 承兑人类别                                                                
    */	
    public void setAcceptorRole(String acceptorRole) {
        this.acceptorRole = acceptorRole;
    }
	/**
    * Get the 承兑人                                                                    
    */	
    public String getAcceptor() {
        return this.acceptor;
    }
	/**
    * Set the 承兑人                                                                    
    */	
    public void setAcceptor(String acceptor) {
        this.acceptor = acceptor;
    }
	/**
    * Get the 承兑人开户行                                                              
    */	
    public Integer getAcceptorBankId() {
        return this.acceptorBankId;
    }
	/**
    * Set the 承兑人开户行                                                              
    */	
    public void setAcceptorBankId(Integer acceptorBankId) {
        this.acceptorBankId = acceptorBankId;
    }
	/**
    * Get the 承兑人账号                                                                
    */	
    public String getAcceptorActno() {
        return this.acceptorActno;
    }
	/**
    * Set the 承兑人账号                                                                
    */	
    public void setAcceptorActno(String acceptorActno) {
        this.acceptorActno = acceptorActno;
    }
	/**
    * Get the 承兑人开户行名称                                                          
    */	
    public String getAcceptorBankName() {
        return this.acceptorBankName;
    }
	/**
    * Set the 承兑人开户行名称                                                          
    */	
    public void setAcceptorBankName(String acceptorBankName) {
        this.acceptorBankName = acceptorBankName;
    }
	/**
    * Get the 票面收款人名称                                                            
    */	
    public String getPayeeName() {
        return this.payeeName;
    }
	/**
    * Set the 票面收款人名称                                                            
    */	
    public void setPayeeName(String payeeName) {
        this.payeeName = payeeName;
    }
	/**
    * Get the 票面收款人账号                                                            
    */	
    public String getPayeeAccount() {
        return this.payeeAccount;
    }
	/**
    * Set the 票面收款人账号                                                            
    */	
    public void setPayeeAccount(String payeeAccount) {
        this.payeeAccount = payeeAccount;
    }
	/**
    * Get the 票面收款人开户行ID                                                        
    */	
    public Integer getPayeeBankId() {
        return this.payeeBankId;
    }
	/**
    * Set the 票面收款人开户行ID                                                        
    */	
    public void setPayeeBankId(Integer payeeBankId) {
        this.payeeBankId = payeeBankId;
    }
	/**
    * Get the 票面收款人开户行                                                          
    */	
    public String getPayeeBankName() {
        return this.payeeBankName;
    }
	/**
    * Set the 票面收款人开户行                                                          
    */	
    public void setPayeeBankName(String payeeBankName) {
        this.payeeBankName = payeeBankName;
    }
	/**
    * Get the 收款人客户ID                                                              
    */	
    public Integer getPayeeId() {
        return this.payeeId;
    }
	/**
    * Set the 收款人客户ID                                                              
    */	
    public void setPayeeId(Integer payeeId) {
        this.payeeId = payeeId;
    }
	/**
    * Get the 票面收款人组织机构代码                                                    
    */	
    public String getPayeeOrganCode() {
        return this.payeeOrganCode;
    }
	/**
    * Set the 票面收款人组织机构代码                                                    
    */	
    public void setPayeeOrganCode(String payeeOrganCode) {
        this.payeeOrganCode = payeeOrganCode;
    }
	/**
    * Get the 票面金额                                                                  
    */	
    public BigDecimal getFaceAmount() {
        return this.faceAmount;
    }
	/**
    * Set the 票面金额                                                                  
    */	
    public void setFaceAmount(BigDecimal faceAmount) {
        this.faceAmount = faceAmount;
    }
	/**
    * Get the 票面备注                                                                  
    */	
    public String getDrftRemark() {
        return this.drftRemark;
    }
	/**
    * Set the 票面备注                                                                  
    */	
    public void setDrftRemark(String drftRemark) {
        this.drftRemark = drftRemark;
    }
	/**
    * Get the 是否系统内承兑                                                            
    */	
    public String getDrawerBankFlag() {
        return this.drawerBankFlag;
    }
	/**
    * Set the 是否系统内承兑                                                            
    */	
    public void setDrawerBankFlag(String drawerBankFlag) {
        this.drawerBankFlag = drawerBankFlag;
    }
	/**
    * Get the 票据所属机构号                                                            
    */	
    public Integer getBelongBranchId() {
        return this.belongBranchId;
    }
	/**
    * Set the 票据所属机构号                                                            
    */	
    public void setBelongBranchId(Integer belongBranchId) {
        this.belongBranchId = belongBranchId;
    }
	/**
    * Get the 实物库存状态                                                              
    */	
    public String getStoreStatus() {
        return this.storeStatus;
    }
	/**
    * Set the 实物库存状态                                                              
    */	
    public void setStoreStatus(String storeStatus) {
        this.storeStatus = storeStatus;
    }
	/**
    * Get the 票据状态                                                                  
    */	
    public String getStatus() {
        return this.status;
    }
	/**
    * Set the 票据状态                                                                  
    */	
    public void setStatus(String status) {
        this.status = status;
    }
	/**
    * Get the 处理中状态                                                                
    */	
    public String getTmpStatus() {
        return this.tmpStatus;
    }
	/**
    * Set the 处理中状态                                                                
    */	
    public void setTmpStatus(String tmpStatus) {
        this.tmpStatus = tmpStatus;
    }
	/**
    * Get the 质押状态                                                                  
    */	
    public String getCollztnStatus() {
        return this.collztnStatus;
    }
	/**
    * Set the 质押状态                                                                  
    */	
    public void setCollztnStatus(String collztnStatus) {
        this.collztnStatus = collztnStatus;
    }
	/**
    * Get the 质押登记簿ID                                                              
    */	
    public Integer getCollztnId() {
        return this.collztnId;
    }
	/**
    * Set the 质押登记簿ID                                                              
    */	
    public void setCollztnId(Integer collztnId) {
        this.collztnId = collztnId;
    }
	/**
    * Get the 挂失状态                                                                  
    */	
    public String getLossStatus() {
        return this.lossStatus;
    }
	/**
    * Set the 挂失状态                                                                  
    */	
    public void setLossStatus(String lossStatus) {
        this.lossStatus = lossStatus;
    }
	/**
    * Get the 挂失登记簿ID                                                              
    */	
    public Integer getRplossId() {
        return this.rplossId;
    }
	/**
    * Set the 挂失登记簿ID                                                              
    */	
    public void setRplossId(Integer rplossId) {
        this.rplossId = rplossId;
    }
	/**
    * Get the 扣款顺序                                                                  
    */	
    public String getDebitOrder() {
        return this.debitOrder;
    }
	/**
    * Set the 扣款顺序                                                                  
    */	
    public void setDebitOrder(String debitOrder) {
        this.debitOrder = debitOrder;
    }
	/**
    * Get the 信息域                                                                    
    */	
    public String getMisc() {
        return this.misc;
    }
	/**
    * Set the 信息域                                                                    
    */	
    public void setMisc(String misc) {
        this.misc = misc;
    }
	/**
    * Get the 最后修改操作员号                                                          
    */	
    public Integer getLastUpdOperId() {
        return this.lastUpdOperId;
    }
	/**
    * Set the 最后修改操作员号                                                          
    */	
    public void setLastUpdOperId(Integer lastUpdOperId) {
        this.lastUpdOperId = lastUpdOperId;
    }
	/**
    * Get the 最后修改时间                                                              
    */	
    public String getLastUpdTime() {
        return this.lastUpdTime;
    }
	/**
    * Set the 最后修改时间                                                              
    */	
    public void setLastUpdTime(String lastUpdTime) {
        this.lastUpdTime = lastUpdTime;
    }
	/**
    * Get the 预警表ID
    */	
    public String getWarnId() {
        return this.warnId;
    }
	/**
    * Set the 预警表ID
    */	
    public void setWarnId(String warnId) {
        this.warnId = warnId;
    }
	/**
    * Get the 数据日期
    */	
    public Date getDataDt() {
        return this.dataDt;
    }
	/**
    * Set the 数据日期
    */	
    public void setDataDt(Date dataDt) {
        this.dataDt = dataDt;
    }
}