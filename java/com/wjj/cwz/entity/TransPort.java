package com.wjj.cwz.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.wjj.cwz.core.collection.BpmSet;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 7, 2013
 * 
 */
@Entity
@Table(name = "c_transport", catalog = "cwz")
public class TransPort extends BaseBean{

	private FlowProcess flowProcess;
	private String name;
	private String driver;
	private String carNo;
	private Depo depo;
	private String location;
	private String remark;
	private Date startDate;		//领用日期
	private Date createDate;	//录单日期
	
	private Set<TransPortDetail> details = new BpmSet<TransPortDetail>(0, TransPortDetail.class); 

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "flow_process")
	public FlowProcess getFlowProcess() {
		return flowProcess;
	}

	public void setFlowProcess(FlowProcess flowProcess) {
		this.flowProcess = flowProcess;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "driver", length = 50)
	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	@Column(name = "car_no", length = 50)
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "depo")
	public Depo getDepo() {
		return depo;
	}

	public void setDepo(Depo depo) {
		this.depo = depo;
	}

	@Column(name = "location", length = 100)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "remark", length = 100)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_date", length = 10)
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 10)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "transPort")
	@OrderBy(value="id")
	public Set<TransPortDetail> getDetails() {
		return details;
	}

	public void setDetails(Set<TransPortDetail> details) {
		this.details = details;
	}		
}
