package com.gbicc.company.view.entity;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * The persistent class for the T_ODS_CMS_CORP_INDEX database table.
 * 
 */
public class TOdsCmsCorpIndex implements Serializable {
	private static final long serialVersionUID = 1L;
	private BigDecimal advanceAmount;
	private BigDecimal advanceBalance;
	private String coreCustomerNum;
	private BigDecimal creditAmount;
	private BigDecimal usedBalance;
	private BigDecimal creditBalance;
	private String custManagerId;
	private String customerNum;
	private BigDecimal doutfulAdvanceBal;
	private String groupCustomerNum;
	private BigDecimal lastMPubAmount;
	private BigDecimal lastMSalAmount;
	private BigDecimal last2MPubAmount;
	private BigDecimal last2MSalAmount;
	private BigDecimal last3MPubAmount;
	private BigDecimal last3MSalAmount;
	private BigDecimal lossAdvanceBal;
	private BigDecimal mentionAdvanceBal;
	private BigDecimal normalAdvanceBal;
	private BigDecimal outsideGuaranteeAmount;
	private Integer outstandingAdvanceCount;
	private BigDecimal overdueAdvanceBal;
	private BigDecimal substdAdvanceBalance;

	public TOdsCmsCorpIndex() {
	}


	public BigDecimal getAdvanceAmount() {
		return this.advanceAmount;
	}

	public void setAdvanceAmount(BigDecimal advanceAmount) {
		this.advanceAmount = advanceAmount;
	}


	public BigDecimal getAdvanceBalance() {
		return this.advanceBalance;
	}

	public void setAdvanceBalance(BigDecimal advanceBalance) {
		this.advanceBalance = advanceBalance;
	}


	public String getCoreCustomerNum() {
		return this.coreCustomerNum;
	}

	public void setCoreCustomerNum(String coreCustomerNum) {
		this.coreCustomerNum = coreCustomerNum;
	}


	public BigDecimal getCreditAmount() {
		return this.creditAmount;
	}

	public void setCreditAmount(BigDecimal creditAmount) {
		this.creditAmount = creditAmount;
	}


	public BigDecimal getCreditBalance() {
		return this.creditBalance;
	}

	public void setCreditBalance(BigDecimal creditBalance) {
		this.creditBalance = creditBalance;
	}


	public String getCustManagerId() {
		return this.custManagerId;
	}

	public void setCustManagerId(String custManagerId) {
		this.custManagerId = custManagerId;
	}


	public String getCustomerNum() {
		return this.customerNum;
	}

	public void setCustomerNum(String customerNum) {
		this.customerNum = customerNum;
	}


	public BigDecimal getDoutfulAdvanceBal() {
		return this.doutfulAdvanceBal;
	}

	public void setDoutfulAdvanceBal(BigDecimal doutfulAdvanceBal) {
		this.doutfulAdvanceBal = doutfulAdvanceBal;
	}


	public String getGroupCustomerNum() {
		return this.groupCustomerNum;
	}

	public void setGroupCustomerNum(String groupCustomerNum) {
		this.groupCustomerNum = groupCustomerNum;
	}


	public BigDecimal getLastMPubAmount() {
		return this.lastMPubAmount;
	}

	public void setLastMPubAmount(BigDecimal lastMPubAmount) {
		this.lastMPubAmount = lastMPubAmount;
	}


	public BigDecimal getLastMSalAmount() {
		return this.lastMSalAmount;
	}

	public void setLastMSalAmount(BigDecimal lastMSalAmount) {
		this.lastMSalAmount = lastMSalAmount;
	}


	public BigDecimal getLast2MPubAmount() {
		return this.last2MPubAmount;
	}

	public void setLast2MPubAmount(BigDecimal last2MPubAmount) {
		this.last2MPubAmount = last2MPubAmount;
	}


	public BigDecimal getLast2MSalAmount() {
		return this.last2MSalAmount;
	}

	public void setLast2MSalAmount(BigDecimal last2MSalAmount) {
		this.last2MSalAmount = last2MSalAmount;
	}


	public BigDecimal getLast3MPubAmount() {
		return this.last3MPubAmount;
	}

	public void setLast3MPubAmount(BigDecimal last3MPubAmount) {
		this.last3MPubAmount = last3MPubAmount;
	}


	public BigDecimal getLast3MSalAmount() {
		return this.last3MSalAmount;
	}

	public void setLast3MSalAmount(BigDecimal last3MSalAmount) {
		this.last3MSalAmount = last3MSalAmount;
	}


	public BigDecimal getLossAdvanceBal() {
		return this.lossAdvanceBal;
	}

	public void setLossAdvanceBal(BigDecimal lossAdvanceBal) {
		this.lossAdvanceBal = lossAdvanceBal;
	}


	public BigDecimal getMentionAdvanceBal() {
		return this.mentionAdvanceBal;
	}

	public void setMentionAdvanceBal(BigDecimal mentionAdvanceBal) {
		this.mentionAdvanceBal = mentionAdvanceBal;
	}


	public BigDecimal getNormalAdvanceBal() {
		return this.normalAdvanceBal;
	}

	public void setNormalAdvanceBal(BigDecimal normalAdvanceBal) {
		this.normalAdvanceBal = normalAdvanceBal;
	}


	public BigDecimal getOutsideGuaranteeAmount() {
		return this.outsideGuaranteeAmount;
	}

	public void setOutsideGuaranteeAmount(BigDecimal outsideGuaranteeAmount) {
		this.outsideGuaranteeAmount = outsideGuaranteeAmount;
	}


	public Integer getOutstandingAdvanceCount() {
		return this.outstandingAdvanceCount;
	}

	public void setOutstandingAdvanceCount(Integer outstandingAdvanceCount) {
		this.outstandingAdvanceCount = outstandingAdvanceCount;
	}


	public BigDecimal getOverdueAdvanceBal() {
		return this.overdueAdvanceBal;
	}

	public void setOverdueAdvanceBal(BigDecimal overdueAdvanceBal) {
		this.overdueAdvanceBal = overdueAdvanceBal;
	}


	public BigDecimal getSubstdAdvanceBalance() {
		return this.substdAdvanceBalance;
	}

	public void setSubstdAdvanceBalance(BigDecimal substdAdvanceBalance) {
		this.substdAdvanceBalance = substdAdvanceBalance;
	}


	public BigDecimal getUsedBalance() {
		if(this.creditAmount!=null&&this.creditBalance!=null){
			this.usedBalance=creditAmount.subtract(creditBalance);
		}
		return usedBalance;
	}


	public void setUsedBalance(BigDecimal usedBalance) {
		this.usedBalance = usedBalance;
	}

}