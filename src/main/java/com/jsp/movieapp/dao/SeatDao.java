package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.Seat;


@Repository
public interface SeatDao {

	public Seat saveSeat(Seat seat);

	public Seat findSeatById(long id);

	public Seat UpdateSeat(Seat seat);

	public void deleteSeat(Seat seat);

	public List<Seat> findAllSeat();

}
