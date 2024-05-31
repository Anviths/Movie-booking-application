package com.jsp.movieapp.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "tickets")
@Component
@Getter
@Setter
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ticket_id")
	private long id;
	@Column(name = "ticket_totalprice")
	private double totalePrice;
    @OneToOne
	private Show showTime;
	@ManyToOne
	private User user;
    @OneToMany(cascade = CascadeType.ALL)
	private List<Seat> seats;

}
