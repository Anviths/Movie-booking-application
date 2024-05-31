package com.jsp.movieapp.service.exception;

public class InvalidTheater extends Exception {

	String message;

	public InvalidTheater(String message) {
		super();
		this.message = message;
	}

	@Override
	public String getMessage() {

		return message;
	}
}
