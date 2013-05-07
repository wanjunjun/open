package com.wjj.jbpm;

public class JbpmException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2262619474396879816L;

	public JbpmException() {
		super();
	}

	public JbpmException(String message) {
		super(message);
	}

	public JbpmException(Throwable cause) {
		super(cause);
	}

	public JbpmException(String message, Throwable cause) {
		super(message, cause);
	}

}
