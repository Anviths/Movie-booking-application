package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.Ticket;

@Repository
public interface TicketDao {

	public Ticket saveTicket(Ticket ticket);

	public Ticket findTicketById(long id);

	public Ticket UpdateTicket(Ticket ticket);

	public void deleteTicket(Ticket ticket);

	public List<Ticket> findAllTicket();

}
