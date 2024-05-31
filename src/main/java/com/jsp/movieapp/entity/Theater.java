package com.jsp.movieapp.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "theaters")
@Component
@Getter
@Setter
public class Theater {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "theater_id")
	private long id;
	@Column(name = "theater_name")
	private String name;
	@Column(name = "theater_address")
	private String address;
	@OneToMany
	private List<Show> showTime;

}
