package com.jsp.movieapp.service.imp;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.TicketDao;
import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.entity.Ticket;
import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.service.TicketService;
@Service
public class TicketServiceImplementation implements TicketService {

	@Autowired
	TicketDao ticketDao;

	@Autowired
	Ticket ticket;
	
	@Autowired
	EntityManager entityManager;
	@Override
	public Ticket saveTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		return ticketDao.saveTicket(ticket);
	}

	@Override
	public Ticket findTicketById(long id) {
		return ticketDao.findTicketById(id);
	}

	@Override
	public Ticket UpdateTicket(Ticket ticket) {
		return ticketDao.UpdateTicket(ticket);
	}

	@Override
	public void deleteTicket(Ticket ticket) {
		ticketDao.deleteTicket(ticket);
	}

	@Override
	public List<Ticket> findAllTicket() {
       
		return ticketDao.findAllTicket();
	}

	@Override
	public Ticket createTicket(List<Seat> seats, double total_price,User user) {
		
		ticket.setTotalePrice(total_price);
		ticket.setUser(user);
		ticket.setSeats(seats);
		ticket.setShowTime(seats.get(0).getShow());
		
		return saveTicket(ticket);
	}

	
}
