package com.jsp.movieapp.service.exception;

public class InvalidShowIdException extends RuntimeException {
	String message;

	public InvalidShowIdException(String message) {
		super();
		this.message = message;
	}
	
	@Override
	public String getMessage() {
		
		return message;
	}
}
