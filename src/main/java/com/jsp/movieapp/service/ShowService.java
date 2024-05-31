package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.Show;
import com.jsp.movieapp.service.exception.InvalidShowIdException;
import com.jsp.movieapp.service.exception.NoShowFoundException;


@Service
public interface ShowService {

	public Show saveShow(Show show,long theater_id,int number_of_seat,long movie_id);

	public Show findShowById(long id) throws InvalidShowIdException;

	public Show UpdateShow(Show show);

	public void deleteShow(Show show);

	public List<Show> findAllShow() throws NoShowFoundException;

	public Show saveShow(Show show, int numberOfSeats);

	public List<Show> findListOfShowByMovieId(long movie_id);

}
