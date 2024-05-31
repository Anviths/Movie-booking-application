package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.UserDao;
import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.util.Role;

@Repository
public class UserDaoImplementation implements UserDao{

	@Autowired
	EntityManager entityManager;
	
	@Override
	public User saveUser(User user) {
		EntityTransaction transaction = entityManager.getTransaction();
		transaction.begin();
		entityManager.persist(user);
		transaction.commit();
		return user;
	}

	@Override
	public User findUserById(long id) {
		return  entityManager.find(User.class, id);
		
	}

	@Override
	public User login(String userId, String password) {
		Query query = entityManager.createQuery("select u from User u where u.email=?1 and u.password=?2");
		query.setParameter(1, userId);
		query.setParameter(2, password);
		try {
			
			return (User) query.getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
			return  null;
		}
		
	}

	@Override
	public User login(long phone, String password) {
		Query query = entityManager.createQuery("select u from User u where u.phone=?1 and u.password=?2");
		query.setParameter(1, phone);
		query.setParameter(2, password);
		try {
			
			return (User) query.getSingleResult();
		}
		catch (Exception e) {
			return  null;
		}
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
