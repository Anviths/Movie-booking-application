package com.jsp.movieapp.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "shows")
@Component
@Getter
@Setter
public class Show {

	 @Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "show_id")
		private long id;
		@Column(name = "ShowTimming")
		private LocalTime time;
		@Column(name = "DateOfShow")
		private LocalDate date;
		@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
		private List<Seat> seat;
		@ManyToOne(cascade = CascadeType.ALL)
		private Theater theater;
		@OneToOne(cascade = CascadeType.ALL)
		private Movie movie;
	
}
