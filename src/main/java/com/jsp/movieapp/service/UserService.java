package com.jsp.movieapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.service.exception.InvalidUserException;
import com.jsp.movieapp.util.Role;
@Service
public interface UserService {

	public User saveUser(User user);

	public User findUserById(long id);

	User login(String userId, String password) throws InvalidUserException;

	User login(long phone, String password);

	public User UpdateUser(User user);

	public void deleteUser(User user);

	public List<User> findAllUser();

	User findUserByEmail(String email);

	User findByPhone(long phone);

	List<User> findUserByRole(Role role);
	
}
