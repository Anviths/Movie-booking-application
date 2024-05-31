package com.jsp.movieapp.entity;

import java.time.LocalTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "movies")
@Component
@Getter
@Setter
public class Movie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "movie_id")
	private long id;
	private String moviename;
	private String movieLanguage;
	private LocalTime duration;
	private String genre;
	private String movieImageName;
	@Column(name="movie_image")
	private String movieImage;
	@OneToMany
	private List<Show> show;
	
}
