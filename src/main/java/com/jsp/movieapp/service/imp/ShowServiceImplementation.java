package com.jsp.movieapp.service.imp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.ShowDao;
import com.jsp.movieapp.entity.Movie;
import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.entity.Show;
import com.jsp.movieapp.entity.Theater;
import com.jsp.movieapp.service.MovieService;
import com.jsp.movieapp.service.ShowService;
import com.jsp.movieapp.service.TheaterService;
import com.jsp.movieapp.service.exception.InvalidShowIdException;
import com.jsp.movieapp.service.exception.NoShowFoundException;
import com.jsp.movieapp.util.SeatType;
@Service
public class ShowServiceImplementation implements ShowService {

	@Autowired
	ShowDao showDao;
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	TheaterService theaterService;
	@Autowired
	MovieService movieService;
	
	@Override
	public Show saveShow(Show show,long theater_id,int number_of_seat,long movie_id) {
		//finding theater and adding to show
	  Theater theater=	theaterService.findTheaterById(theater_id);
		show.setTheater(theater);
		theater.getShowTime().add(show);
		//finding Movie and Adding to the show
		 Movie movie= movieService.findMovieById(movie_id);
		 if(movie.getShow()==null) {
			 movie.setShow(Arrays.asList(show));
		 }
		 else
		 movie.getShow().add(show);
			show.setMovie(movie);
			//creating number of seats and attributes for seat
		show.setSeat(getAllSeats(number_of_seat,show));
		return showDao.saveShow(show) ;
	}

	@Override
	public Show findShowById(long id) throws InvalidShowIdException {
		
		Show show = showDao.findShowById(id);
		if (show!= null) {
			return show;
		}
		throw new InvalidShowIdException("there is no show with this id");
	}

	@Override
	public Show UpdateShow(Show show) {
		
		return showDao.UpdateShow(show);
	}

	@Override
	public void deleteShow(Show show) {
		
		showDao.deleteShow(show);
		
	}

	@Override
	public List<Show> findAllShow() throws NoShowFoundException{
		List<Show> shows = showDao.findAllShow();
		if (shows !=null) {
			return shows ;
		}
		throw new NoShowFoundException("there is no show avilable");
	}

	private List<Seat> getAllSeats(int number_of_seats,Show show){
		List<Seat> seats=new ArrayList<Seat>();
		char c='A';
		int number=0;
		for(int i=0;i<number_of_seats;i++) {
			Seat seat=new Seat();
			
			seat.setBooked(false);
			seat.setSeatNumber(c +""+number++);
			if(c=='A' || c=='B') {
			seat.setType(SeatType.VIP);
			seat.setPrice(300);
			}
			else {
				seat.setType(SeatType.REGULAR);
				seat.setPrice(200);
			}
			seat.setShow(show);
			seats.add(seat);
			if(number>4) {
				number=0;
				c++;
			}
		}
		return seats;
	}

	@Override
	public Show saveShow(Show show, int numberOfSeats) {
		show.setSeat(getAllSeats(numberOfSeats,show));
		return showDao.saveShow(show) ;
		
	}

	@Override
	public List<Show> findListOfShowByMovieId(long movie_id) {
		Query query = entityManager.createQuery("select s from Show s where s.movie.id=?1");
		query.setParameter(1, movie_id);
		return query.getResultList();
	}
}
