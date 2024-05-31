package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.TheaterDao;
import com.jsp.movieapp.entity.Theater;
@Repository
public class TheaterDaoImplentation implements TheaterDao {

	@Autowired
	EntityManager entityManager;

	@Override
	public Theater saveTheater(Theater theater) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(theater);
		transaction.commit();
		return theater;
	}

	@Override
	public Theater findTheaterById(long id) {

		return entityManager.find(Theater.class, id);
	}

	@Override
	public Theater UpdateTheater(Theater theater) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(theater);
		return theater;
	}

	@Override
	public void deleteTheater(Theater theater) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.remove(theater);
		entityTransaction.commit();
	}

	@Override
	public List<Theater> findAllTheater() {
		String query = "SELECT t FROM Theater t";
		Query query1 = entityManager.createQuery(query);
		List<Theater> theater = query1.getResultList();
		return theater;
	}
}
