package com.jsp.movieapp.service.exception;

public class InvalidSeatIdException extends Exception {

	private String message;
	public InvalidSeatIdException(String message) {
		super();
		this.message = message;
	}

	
	
	@Override
	public String getMessage() {
		
		return message;
	}

}
