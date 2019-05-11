package com.gbicc.person.monitor.entity;

import java.util.Date;
// Generated 2015-12-18 9:58:42 by Hibernate Tools 3.2.2.GA



/**
 * TPlControlmeasure generated by hbm2java
 */
public class TPlControlmeasure  implements java.io.Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 2613188706085957209L;
	/*
    * ID.
    */
    private String id;
    /*
    * 风控措施.
    */
    private String conmeasCode;
    /*
    * 风控说明.
    */
    private String conmeasDesc;
    /*
    * 任务编号.
    */
    private String taskId;
    /*
    * 任务类型.
    */
    private String taskType;
    /*
     * 控制类型.
     */
    private String ctrlType;
    /*
     * 监控频率.
     */
    private Double monitorRate;
    /*
     * 其他措施说明.
     */
    private String otherCtrlDesc;
    /*
     * 机构 
     */
   private String orgCode;
   /*
    * 创建日期
    */
   private Date credited;

    public TPlControlmeasure() {
    }

	
    public TPlControlmeasure(String id) {
        this.id = id;
    }
    public TPlControlmeasure(String id, String conmeasCode, String conmeasDesc, String taskId, String taskType,String orgCode,Date credited) {
       this.id = id;
       this.conmeasCode = conmeasCode;
       this.conmeasDesc = conmeasDesc;
       this.taskId = taskId;
       this.taskType = taskType;
       this.orgCode = orgCode;
       this.credited = credited;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public String getConmeasCode() {
        return this.conmeasCode;
    }
    
    public void setConmeasCode(String conmeasCode) {
        this.conmeasCode = conmeasCode;
    }
    public String getConmeasDesc() {
        return this.conmeasDesc;
    }
    
    public void setConmeasDesc(String conmeasDesc) {
        this.conmeasDesc = conmeasDesc;
    }
    public String getTaskId() {
        return this.taskId;
    }
    
    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
    public String getTaskType() {
        return this.taskType;
    }
    
    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }


	public String getCtrlType() {
		return ctrlType;
	}
	public void setCtrlType(String ctrlType) {
		this.ctrlType = ctrlType;
	}

	public Double getMonitorRate() {
		return monitorRate;
	}
	public void setMonitorRate(Double monitorRate) {
		this.monitorRate = monitorRate;
	}

	public String getOtherCtrlDesc() {
		return otherCtrlDesc;
	}
	public void setOtherCtrlDesc(String otherCtrlDesc) {
		this.otherCtrlDesc = otherCtrlDesc;
	}


	public String getOrgCode() {
		return orgCode;
	}


	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}


	public Date getCredited() {
		return credited;
	}


	public void setCredited(Date credited) {
		this.credited = credited;
	}
	
}