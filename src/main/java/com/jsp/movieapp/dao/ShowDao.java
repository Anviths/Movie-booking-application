package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.Show;


@Repository
public interface ShowDao {

	public Show saveShow(Show show);

	public Show findShowById(long id);

	public Show UpdateShow(Show show);

	public void deleteShow(Show show);

	public List<Show> findAllShow();

}
