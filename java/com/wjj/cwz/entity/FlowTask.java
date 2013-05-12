package com.wjj.cwz.entity;

// default package
// Generated 2011-9-24 13:59:21 by Hibernate Tools 3.3.0.GA

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

/**
 * Employee generated by hbm2java
 */
@Entity
@Table(name = "c_flow_task", catalog = "cwz")
public class FlowTask extends BaseBean {

	private Long taskId;
	private Integer sessionId;
	private Long processId;
	private Date createTime;
	private Date completeTime;
	private String nodeName;
	private String taskStatus;
	private Long workitemId;
	private String opinion;
	private String signedItcode;
	private String isApply; //申请人, yes , no
	private String role;
	private String actor;   //当前处理人
	private Long flowProcessId;
	
	private Integer  version;//乐观锁
	private Date operTime;//操作时间

	public FlowTask() {
	}	

	@Column(name = "task_id")
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	
	@Column(name = "session_id")
	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}
	
	@Column(name = "process_id")
	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
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

	@Column(name = "node_name", length = 50)
	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
	
	@Column(name = "task_status", length = 10)
	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	@Column(name = "workitem_id")
	public Long getWorkitemId() {
		return workitemId;
	}

	public void setWorkitemId(Long workitemId) {
		this.workitemId = workitemId;
	}

	@Column(name = "opinion", length = 100)
	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	@Column(name = "signed_itcode", length = 10)
	public String getSignedItcode() {
		return signedItcode;
	}

	public void setSignedItcode(String signedItcode) {
		this.signedItcode = signedItcode;
	}

	@Column(name = "is_apply", length = 5)
	public String getIsApply() {
		return isApply;
	}

	public void setIsApply(String isApply) {
		this.isApply = isApply;
	}

	@Column(name = "role", length = 50)
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	@Version
    @Column(name = "version",length = 11)
	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "oper_time", length = 10)
	public Date getOperTime() {
		return operTime;
	}	

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
	}

	@Column(name = "actor", length = 30)
	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	@Column(name = "flow_process_id")
	public Long getFlowProcessId() {
		return flowProcessId;
	}

	public void setFlowProcessId(Long flowProcessId) {
		this.flowProcessId = flowProcessId;
	}
}
