package com.wjj.cwz.entity;

// default package
// Generated 2011-9-24 13:59:21 by Hibernate Tools 3.3.0.GA

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

/**
 * Employee generated by hbm2java
 */
@Entity
@Table(name = "c_flow_process", catalog = "cwz")
public class FlowProcess extends BaseBean {

	private String title;
	private Date createTime;
	private Date completeTime;
	private String processStatus;
	private User user;			//申请人
	private Flow flow;			//流程类型
	private String flowForm;	//流程表单
	private String uuid;		//唯一标识
	private String formState;	//表单状态，draft表示草稿
	
	public FlowProcess() {
	}	
		
	@Column(name = "title", length = 50)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 10)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "complete_time", length = 10)
	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}
	
	@Column(name = "process_status", length = 30)
	public String getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "flow_id")
	public Flow getFlow() {
		return flow;
	}

	public void setFlow(Flow flow) {
		this.flow = flow;
	}

	@Column(name = "flow_form", length = 30)
	public String getFlowForm() {
		return flowForm;
	}

	public void setFlowForm(String flowForm) {
		this.flowForm = flowForm;
	}

	@Column(name = "uuid", length = 30)
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Column(name = "form_state", length = 30)
	public String getFormState() {
		return formState;
	}

	public void setFormState(String formState) {
		this.formState = formState;
	}
}
