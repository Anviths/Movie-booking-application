package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.Movie;


@Repository
public interface MovieDao {

	public Movie saveMovie(Movie movie);

	public Movie findMovieById(long id);

	public Movie UpdateMovie(Movie movie);

	public void deleteMovie(Movie movie);

	public List<Movie> findAllMovie();

}
