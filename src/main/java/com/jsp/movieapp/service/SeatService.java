package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.service.exception.InvalidSeatIdException;
import com.jsp.movieapp.service.exception.SeatNotFoundException;


@Service
public interface SeatService {

	public Seat saveSeat(Seat seat);

	public Seat findSeatById(long id) throws InvalidSeatIdException;

	public Seat UpdateSeat(Seat seat);

	public void deleteSeat(Seat seat);

	public List<Seat> findAllSeat() throws SeatNotFoundException;

	public List<Seat> findAllSeatsBySeatsId(List<Long> seat_ids);

	public void bookedSeats(List<Seat> seats);

	

}
