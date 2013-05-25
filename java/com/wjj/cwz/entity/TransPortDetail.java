package com.wjj.cwz.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Entity
@Table(name = "c_transport_detail", catalog = "cwz")
public class TransPortDetail extends BaseBean{
	
	private TransPort transPort;
	private String boxId;
	private String boxType;
	private String isArrived;
	private String state;
	private String remark;
	
	@ManyToOne(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "trans_port")
	public TransPort getTransPort() {
		return transPort;
	}
	public void setTransPort(TransPort transPort) {
		this.transPort = transPort;
	}
	
	@Column(name = "box_id", length = 30)
	public String getBoxId() {
		return boxId;
	}
	public void setBoxId(String boxId) {
		this.boxId = boxId;
	}
	
	@Column(name = "box_type", length = 30)
	public String getBoxType() {
		return boxType;
	}
	public void setBoxType(String boxType) {
		this.boxType = boxType;
	}
	
	@Column(name = "is_arrived", length = 10)
	public String getIsArrived() {
		return isArrived;
	}
	public void setIsArrived(String isArrived) {
		this.isArrived = isArrived;
	}
	
	@Column(name = "state", length = 10)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "remark", length = 50)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
//	public boolean equals(Object o){
//		if(o instanceof TransPortDetail){
//			return this.getId().equals(((TransPortDetail)o).getId());
//		}
//		return false;
//	}
}
