package com.gbicc.company.financial.analysis.entity;

import java.sql.Timestamp;

public class TWbdataTest {
	 private String id;
	    /*
	    */
	    private String type;
	    /*
	    */
	    private String desc;
	    /*
	    */
	    private Timestamp data;
	    /*
	    */
	    private String typeid;
	    
	    private String customerNum;
	    
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}
		public String getTypeid() {
			return typeid;
		}
		public void setTypeid(String typeid) {
			this.typeid = typeid;
		}
		public String getCustomerNum() {
			return customerNum;
		}
		public void setCustomerNum(String customerNum) {
			this.customerNum = customerNum;
		}
		public Timestamp getData() {
			return data;
		}
		public void setData(Timestamp data) {
			this.data = data;
		}
}
