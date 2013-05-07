package com.wjj.cwz.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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

	private FlowProcess FlowProcess;
	private String name;

	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "flow_process")
	public FlowProcess getFlowProcess() {
		return FlowProcess;
	}

	public void setFlowProcess(FlowProcess flowProcess) {
		FlowProcess = flowProcess;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
	
}