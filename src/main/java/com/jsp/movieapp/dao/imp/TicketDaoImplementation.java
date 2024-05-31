package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.TicketDao;
import com.jsp.movieapp.entity.Ticket;
@Repository
public class TicketDaoImplementation implements TicketDao {

	@Autowired
	EntityManager entityManager;
	@Override
	public Ticket saveTicket(Ticket ticket) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(ticket);
		transaction.commit();
		
		return ticket;
	}

	@Override
	public Ticket findTicketById(long id) {
		return  entityManager.find(Ticket.class, id);
	}

	@Override
	public Ticket UpdateTicket(Ticket ticket) {
		
		 entityManager.getTransaction().begin();
		 entityManager.merge(ticket);
		 entityManager.getTransaction().commit();
		 return ticket;
	}

	@Override
	public void deleteTicket(Ticket ticket) {
		entityManager.getTransaction().begin();
		entityManager.remove(ticket);
		entityManager.getTransaction().commit();	
	}

	@Override
	public List<Ticket> findAllTicket() {
		return entityManager.createQuery("select t from Ticket t ").getResultList();

	}

}
