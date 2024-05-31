package com.jsp.movieapp.service.imp;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.SeatDao;
import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.service.SeatService;
import com.jsp.movieapp.service.exception.InvalidSeatIdException;
import com.jsp.movieapp.service.exception.SeatNotFoundException;
@Service
public class SeatServiceImplementation implements SeatService {

	@Autowired
	SeatDao seatDao;
	@Autowired
	EntityManager entityManager;

	@Override
	public Seat saveSeat(Seat seat) {

		return seatDao.saveSeat(seat);
	}

	@Override
	public Seat findSeatById(long id) throws InvalidSeatIdException {

		Seat seat = seatDao.findSeatById(id);
		if (seat != null) {
			return seat;
		}
		throw new InvalidSeatIdException("Sorry their is no seat with this id !!!");
	}

	@Override
	public Seat UpdateSeat(Seat seat) {

		return seatDao.UpdateSeat(seat);
	}

	@Override
	public void deleteSeat(Seat seat) {
		seatDao.deleteSeat(seat);

	}

	@Override
	public List<Seat> findAllSeat() throws SeatNotFoundException {

		List<Seat> seats = seatDao.findAllSeat();
		if (seats != null) {
			return seats;
		}
		throw new SeatNotFoundException("No seat Available!!!");

	}

	@Override
	public List<Seat> findAllSeatsBySeatsId(List<Long> seat_ids) {
		return entityManager.createQuery("select s from Seat s where s.id IN :seat_Id")
				.setParameter("seat_Id", seat_ids).getResultList();

	}

	@Override
	public void bookedSeats(List<Seat> seats) {
		for (Seat seat : seats) {
			seat.setBooked(true);
			UpdateSeat(seat);
		}

		
	}
}
