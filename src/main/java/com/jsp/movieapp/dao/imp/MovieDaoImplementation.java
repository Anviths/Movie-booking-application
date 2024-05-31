package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.MovieDao;
import com.jsp.movieapp.entity.Movie;

@Repository
public class MovieDaoImplementation implements MovieDao {

	@Autowired
	EntityManager entityManager;

	@Override
	public Movie saveMovie(Movie movie) {
		// TODO Auto-generated method stub
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(movie);
		transaction.commit();
		return movie;
	}

	@Override
	public Movie findMovieById(long id) {
		// TODO Auto-generated method stub
		return entityManager.find(Movie.class, id);
	}

	@Override
	public Movie UpdateMovie(Movie movie) {
		// TODO Auto-generated method stub
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.merge(movie);
		transaction.commit();
		return movie;
	}

	@Override
	public void deleteMovie(Movie movie) {
		// TODO Auto-generated method stub
		EntityTransaction tr = null;
		try {
			tr = entityManager.getTransaction();
			tr.begin();
			entityManager.remove(movie);
			tr.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Movie> findAllMovie() {
		// TODO Auto-generated method stub
		String jpql = "SELECT m FROM Movie m";
		Query query = entityManager.createQuery(jpql);
		List<Movie> movies = query.getResultList();
		return movies;
	}
}
