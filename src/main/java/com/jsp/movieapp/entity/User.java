package com.jsp.movieapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.jsp.movieapp.util.Role;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Component
@Getter
@Setter
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private long id;
	@Column(name = "user_name")
	private String name;
	@Column(name = "user_email")
	private String email;
	@Column(name = "user_phone")
	private long phone;
	
	@Column(name="user_password")
	private String password;
	@Column(name="image_name")
	private String imageName;
	@Enumerated(EnumType.STRING)
	@Column(name = "user_role")
	private Role role;
}
