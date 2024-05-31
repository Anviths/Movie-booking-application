package com.jsp.movieapp.dao.imp;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.movieapp.dao.ShowDao;
import com.jsp.movieapp.entity.Show;
@Repository
public class ShowDaoImplementation implements ShowDao {

	@Autowired
	EntityManager entityManager;
	
	@Override
	public Show saveShow(Show show) {
	 entityManager.getTransaction().begin();
	 entityManager.persist(show);
	 entityManager.getTransaction().commit();
		return show;
	}

	@Override
	public Show findShowById(long id) {
		return	entityManager.find(Show.class, id);
		 
	}

	@Override
	public Show UpdateShow(Show show) {
		 entityManager.getTransaction().begin();
		 entityManager.merge(show);
		 entityManager.getTransaction().commit();
		 return show;
	}

	@Override
	public void deleteShow(Show show) {
		entityManager.getTransaction().begin();
		entityManager.remove(show);
		entityManager.getTransaction().commit();
		
	}

	@Override
	public List<Show> findAllShow() {
		
		return entityManager.createQuery("select s from Show s ").getResultList();
	}


}
