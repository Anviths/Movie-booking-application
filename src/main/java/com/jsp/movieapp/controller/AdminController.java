package com.jsp.movieapp.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.movieapp.entity.Movie;
import com.jsp.movieapp.entity.Seat;
import com.jsp.movieapp.entity.Show;
import com.jsp.movieapp.entity.Theater;
import com.jsp.movieapp.entity.Ticket;
import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.service.MovieService;
import com.jsp.movieapp.service.SeatService;
import com.jsp.movieapp.service.ShowService;
import com.jsp.movieapp.service.TheaterService;
import com.jsp.movieapp.service.TicketService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class AdminController {

	@Autowired
	 TheaterService service;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	SeatService seatService;
	
	@Autowired
	TicketService ticketService;
	@PostMapping("/savetheater")
	public ModelAndView saveTheather(@ModelAttribute Theater theater) {
		
		service.saveTheater(theater);
		return new  ModelAndView("admin.jsp");
	}
	
	@GetMapping("/createShow")
	public ModelAndView createShow() {
		ModelAndView view =new ModelAndView("addshow.jsp");
		view.addObject("theaters",service.findAllTheater());
		view.addObject("movies",movieService.findAllMovie() );
		return view;
	}
	 
	@PostMapping("/saveshows")
   public ModelAndView saveShow(@ModelAttribute Show show ,@RequestParam("theater_id") long theater_id,@RequestParam("numberOfSeats") int numberOfSeats,@RequestParam("movie_id") long movie_id, @RequestParam("showTime") String showTime) {
		System.out.println(showTime);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a").withLocale(Locale.US);
		LocalTime time=LocalTime.parse(showTime, formatter);
		show.setTime(time);
		showService.saveShow(show,theater_id,numberOfSeats,movie_id);
		return new  ModelAndView("admin.jsp");
	}
	
//	https://codeshare.io/N38BZr
	
	@GetMapping("/show_theater")
	   public ModelAndView showTheater( @RequestParam("movie_id") long movie_id
			   ,HttpSession session) {
			
			Movie findMovieById = movieService.findMovieById(movie_id);
			List<Show> shows=showService.findListOfShowByMovieId(movie_id);
			HashMap<Long, Theater> theaters=new HashMap<Long, Theater>();
			for(Show show:shows) {
				
			theaters.put(show.getTheater().getId(), show.getTheater());
			}
			ModelAndView view = new  ModelAndView("moviescreen.jsp");
			session.setAttribute("movie_selected", findMovieById);
			view.addObject("shows", shows);
			view.addObject("theaters", theaters);
			
			return view;
		}
		
	@GetMapping("/seat")
	public ModelAndView getAllSeatForShow(@RequestParam("show_id") long show_id ) {
		ModelAndView view =new ModelAndView("seat.jsp");
		view.addObject("seats",showService.findShowById(show_id).getSeat());
		return view;
	}
	
	@PostMapping("/payment")
	public ModelAndView payment(@RequestParam("seatIds") List<Long> seatIds,HttpSession session) {
		List<Seat> seats = seatService.findAllSeatsBySeatsId(seatIds);
		ModelAndView view =new ModelAndView("payment.jsp");
		double totalAmount = calculateTotalAmount(seats);
		view.addObject("totalAmount", totalAmount);
		view.addObject("seats",seats);
		session.setAttribute("seats",seats);
		return view;
	}

	private double calculateTotalAmount(List<Seat> seats) {
		int sum=0;
        for(Seat seat:seats) {
        	sum+=seat.getPrice();
        }
        return sum;
    }
	
	 @PostMapping("confirmPayment")
	    public ModelAndView confirmPayment(HttpSession session,@RequestParam("total_price") double total_price) {
	       List<Seat> seats = (List<Seat>) session.getAttribute("seats");
	       ModelAndView view=new ModelAndView("test.jsp");
	       User user=(User) session.getAttribute("userLogin");
	       seatService.bookedSeats(seats);
	       Ticket ticket = ticketService.createTicket(seats,total_price,user);
	       view.addObject("tickets",ticket);
	        return view;
	    }
	}
		
