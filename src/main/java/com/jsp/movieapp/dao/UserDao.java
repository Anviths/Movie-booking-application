package com.jsp.movieapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.util.Role;

@Repository
public interface UserDao {

	public User saveUser(User user);

	public User findUserById(long id);

	User login(String userId, String password);

	User login(long phone, String password);

	public User UpdateUser(User user);

	public void deleteUser(User user);

	public List<User> findAllUser();

	User findUserByEmail(String email);

	User findByPhone(long phone);

	List<User> findUserByRole(Role role);

}
