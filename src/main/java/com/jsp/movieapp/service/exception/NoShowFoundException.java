package com.jsp.movieapp.service.exception;

public class NoShowFoundException extends Exception {
	String message;

	public NoShowFoundException(String message) {
		super();
		this.message = message;
	}
	
	@Override
	public String getMessage() {
		
		return message;
	}
}
