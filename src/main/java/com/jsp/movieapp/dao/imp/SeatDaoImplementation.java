package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.SeatDao;
import com.jsp.movieapp.entity.Seat;
@Repository
public class SeatDaoImplementation implements SeatDao{

	@Autowired
	EntityManager entityManager;
	@Override
	public Seat saveSeat(Seat seat) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(seat);
		entityTransaction.commit();
		
		return seat;
	}

	@Override
	public Seat findSeatById(long id) {
		// TODO Auto-generated method stub
		return entityManager.find(Seat.class, id);
	}

	@Override
	public Seat UpdateSeat(Seat seat) {
		entityManager.getTransaction().begin();
		entityManager.merge(seat);
		entityManager.getTransaction().commit();
		return seat;
	}

	@Override
	public void deleteSeat(Seat seat) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.remove(seat);
		entityTransaction.commit();
				
	}

	@Override
	public List<Seat> findAllSeat() {
		Query query=entityManager.createQuery("select * from User u");
		
		
			return query.getResultList();
		
	}
}
