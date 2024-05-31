package com.jsp.movieapp.service.exception;

public class InvalidUserException extends Exception {

	String message;

	public InvalidUserException(String message) {
		super();
		this.message = message;
	}
	
	@Override
	public String getMessage() {
		
		return message;
	}
}
