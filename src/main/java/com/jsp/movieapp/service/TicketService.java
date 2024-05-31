package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.entity.Ticket;
import com.jsp.movieapp.entity.User;

@Service
public interface TicketService {

	public Ticket saveTicket(Ticket ticket);

	public Ticket findTicketById(long id);

	public Ticket UpdateTicket(Ticket ticket);

	public void deleteTicket(Ticket ticket);

	public List<Ticket> findAllTicket();



	Ticket createTicket(List<Seat> seats, double total_price, User user);

}
