package com.jsp.movieapp.service.imp;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.UserDao;
import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.service.UserService;
import com.jsp.movieapp.service.exception.InvalidUserException;
import com.jsp.movieapp.util.Role;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserDao userDao;

	@Autowired
	EntityManager entityManager;

	@Override
	public User saveUser(User user) {

		return userDao.saveUser(user);
	}

	@Override
	public User findUserById(long id) {

		return userDao.findUserById(id);
	}

	@Override
	public User login(String userId, String password) throws InvalidUserException {
		User user = userDao.login(userId, password);
		if (user != null) {
			return user;
		}

		throw new InvalidUserException("wrong credentials");
	}

	@Override
	public User login(long phone, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User UpdateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findByPhone(long phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findUserByRole(Role role) {
		// TODO Auto-generated method stub
		return null;
	}

}
