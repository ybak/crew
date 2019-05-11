package com.gbicc.bpm.entity;
// Generated 2015-12-10 16:02:13 by Hibernate Tools 3.2.2.GA


import java.util.Date;

import com.gbicc.personCommon.entity.TEdwPlsAccount;
import com.huateng.ebank.entity.data.mng.Bctl;
import com.huateng.ebank.entity.data.mng.TlrInfo;

/**
 * TLoanAccountDutyDistribute generated by hbm2java
 */
public class TLoanAccountDutyDistribute  implements java.io.Serializable {

	private static final long serialVersionUID = 7318776139340515044L;
	
	private String oldCheckUserTemp;
	private String  checkUserTemp;
	
	public String getOldCheckUserTemp() {
		if(this.oldCheckUser!=null){
			return this.oldCheckUser.replaceAll(";", "<br>");
		}
		return this.oldCheckUser;
	}
	public String getCheckUserTemp() {
		if(this.checkUserDesc!=null){
			return this.checkUserDesc.replaceAll(";", "<br>");
		}
		return this.checkUserDesc;
	}
	/*
    * 批量分派的帐户id(临时字段).
    */
    private String loanacnos;
    /*
     * 经办行(临时字段).
     */
    private String orgId;
	
	/*
    * ID主键.
    */
    private String id;
    /*
     * 货款帐号.
     */
    private TEdwPlsAccount loanacno;
    /*
    * 分派标识：1，单个；2，批量.
    */
    private String distFlag;
    /*
     * 分派类型(1,责任人;2,催收人)
     */
    private String distType;
    /*
    * 状态.
    */
    private String status;
    /*
    * 分派前检查人.
    */
    private String oldCheckUser;
    /*
    * 分派后检查人.
    */
    private String checkUser;
    /*
     * 分派后检查人描述(临时字段).
     */
    private String checkUserDesc;
    /*
    * 分派日期.
    */
    private Date distDt;
    /*
    * 备注.
    */
    private String remark;
    /*
    * 操作行.
    */
    private Bctl operOrg;
    /*
    * 操作人.
    */
    private TlrInfo operUser;
    /*
    * 分派原则.
    */
    private String distPrinciple;
    /*
     * 分派笔数.
     */
    private Integer distQuantity;
    /*
     * 审核人.
     */
    private String aplUser;

    public String getId() {
        return this.id;
    }
    public void setId(String id) {
        this.id = id;
    }
    
    public TEdwPlsAccount getLoanacno() {
		return loanacno;
	}
	public void setLoanacno(TEdwPlsAccount loanacno) {
		this.loanacno = loanacno;
	}
	
	public String getDistFlag() {
        return this.distFlag;
    }
    
    public void setDistFlag(String distFlag) {
        this.distFlag = distFlag;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public String getOldCheckUser() {
        return this.oldCheckUser;
    }
    
    public void setOldCheckUser(String oldCheckUser) {
        this.oldCheckUser = oldCheckUser;
    }
    public String getCheckUser() {
        return this.checkUser;
    }
    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }
    public String getCheckUserDesc() {
        return this.checkUserDesc;
    }
    public void setCheckUserDesc(String checkUserDesc) {
        this.checkUserDesc = checkUserDesc;
    }
	public Date getDistDt() {
        return this.distDt;
    }
    
    public void setDistDt(Date distDt) {
        this.distDt = distDt;
    }
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public Bctl getOperOrg() {
        return this.operOrg;
    }
    
    public void setOperOrg(Bctl operOrg) {
        this.operOrg = operOrg;
    }
    public TlrInfo getOperUser() {
        return this.operUser;
    }
    
    public void setOperUser(TlrInfo operUser) {
        this.operUser = operUser;
    }
    public String getDistPrinciple() {
        return this.distPrinciple;
    }
    
    public void setDistPrinciple(String distPrinciple) {
        this.distPrinciple = distPrinciple;
    }
	public Integer getDistQuantity() {
		return distQuantity;
	}
	public void setDistQuantity(Integer distQuantity) {
		this.distQuantity = distQuantity;
	}
	public String getLoanacnos() {
		return loanacnos;
	}
	public void setLoanacnos(String loanacnos) {
		this.loanacnos = loanacnos;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getDistType() {
		return distType;
	}
	public void setDistType(String distType) {
		this.distType = distType;
	}
	public String getAplUser() {
		return aplUser;
	}
	public void setAplUser(String aplUser) {
		this.aplUser = aplUser;
	}
}