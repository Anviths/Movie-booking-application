package com.jsp.movieapp.service.exception;

public class SeatNotFoundException extends Exception {

   private String message;
	
	public SeatNotFoundException(String message) {
		super();
		this.message = message;
	}
	

	@Override
	public String getMessage() {
		
		return message;
	}

}
