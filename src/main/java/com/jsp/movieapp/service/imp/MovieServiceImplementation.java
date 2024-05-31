package com.jsp.movieapp.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.MovieDao;
import com.jsp.movieapp.entity.Movie;
import com.jsp.movieapp.service.MovieService;

@Service
public class MovieServiceImplementation implements MovieService {

	@Autowired
	MovieDao movieDao;
	
	
	
	@Override
	public Movie saveMovie(Movie movie) {
		return movieDao.saveMovie(movie);
	}

	@Override
	public Movie findMovieById(long id) {
		return movieDao.findMovieById(id);
	}

	@Override
	public Movie UpdateMovie(Movie movie) {
		return movieDao.UpdateMovie(movie);
	}

	@Override
	public void deleteMovie(Movie movie) {
		movieDao.deleteMovie(movie);
	}

	@Override
	public List<Movie> findAllMovie() {
		
		return movieDao.findAllMovie();
	}
}
