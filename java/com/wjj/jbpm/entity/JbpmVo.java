package com.wjj.jbpm.entity;

import java.util.List;

import com.google.common.collect.Lists;


public class JbpmVo {

	private Integer sessionId;
	private Long processId;
	private Long workitemId;
	private String nodeName;
	private String actorId;
	private String groupId;
	private Long taskId;
	private String opinion;
	private String status;
	private String signedItcode;
	private String isApply;	
//	private List<FtlVo> ftlVos = Lists.newArrayList();

	public JbpmVo() {

	}

	public JbpmVo(Integer sessionId, Long processId) {
		super();
		this.sessionId = sessionId;
		this.processId = processId;
	}

	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}

	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
	}

	public Long getWorkitemId() {
		return workitemId;
	}

	public void setWorkitemId(Long workitemId) {
		this.workitemId = workitemId;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getActorId() {
		return actorId;
	}

	public void setActorId(String actorId) {
		this.actorId = actorId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSignedItcode() {
		return signedItcode;
	}

	public void setSignedItcode(String signedItcode) {
		this.signedItcode = signedItcode;
	}

	public String getIsApply() {
		return isApply;
	}

	public void setIsApply(String isApply) {
		this.isApply = isApply;
	}

}
