package com.jsp.movieapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.jsp.movieapp.util.SeatType;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "seats")
@Component
@Getter
@Setter
public class Seat {

    @Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seat_gen")
	@SequenceGenerator(name = "seat_gen",initialValue = 1000,allocationSize = 1)
	@Column(name = "seat_id")
	private long id;

	@Column(name = "seat_no")
	private String seatNumber;
	@Column(name = "seat_price")
	private int price;
	private boolean booked;
	@Enumerated(EnumType.STRING)
	private SeatType type;
	@ManyToOne
	private Show show;
	
}
