package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.Movie;


@Service
public interface MovieService {

	public Movie saveMovie(Movie movie);

	public Movie findMovieById(long id);

	public Movie UpdateMovie(Movie movie);

	public void deleteMovie(Movie movie);

	public List<Movie> findAllMovie();

}
