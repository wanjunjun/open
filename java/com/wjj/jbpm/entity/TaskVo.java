package com.wjj.jbpm.entity;

public class TaskVo {

	private Long taskId;
	private String status;

	
	public TaskVo() {
		super();
	}

	public TaskVo(Long taskId, String status) {
		super();
		this.taskId = taskId;
		this.status = status;
	}



	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
