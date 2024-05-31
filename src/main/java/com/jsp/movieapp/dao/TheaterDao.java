package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.Theater;


@Repository
public interface TheaterDao {

	public Theater saveTheater(Theater theater);

	public Theater findTheaterById(long id);

	public Theater UpdateTheater(Theater theater);

	public void deleteTheater(Theater theater);

	public List<Theater> findAllTheater();

}
