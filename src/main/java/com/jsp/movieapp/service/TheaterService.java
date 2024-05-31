package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.Theater;


@Service
public interface TheaterService {

	public Theater saveTheater(Theater theater);

	public Theater findTheaterById(long id);

	public Theater UpdateTheater(Theater theater);

	public void deleteTheater(Theater theater);

	public List<Theater> findAllTheater();

	

}
