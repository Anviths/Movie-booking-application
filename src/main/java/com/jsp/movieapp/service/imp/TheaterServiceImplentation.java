package com.jsp.movieapp.service.imp;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.movieapp.dao.TheaterDao;
import com.jsp.movieapp.entity.Show;
import com.jsp.movieapp.entity.Theater;
import com.jsp.movieapp.service.TheaterService;
@Service
public class TheaterServiceImplentation implements TheaterService {

	 @Autowired
	    TheaterDao theaterDao;
	    @Autowired
	    EntityManager entityManager;
		@Override
		public Theater saveTheater(Theater theater) {
			try {
				List<Show> shows=new ArrayList<Show>();
				theater.setShowTime(shows);
				return theaterDao.saveTheater(theater);
			}catch(Exception e){
				throw new RuntimeException("DataBase not found");
			}

		}

		@Override
		public Theater findTheaterById(long id) {
			try {
				return theaterDao.findTheaterById(id);
			}catch(Exception e) {
				throw new RuntimeException("Invalid Id");
			}

		}

		@Override
		public Theater UpdateTheater(Theater theater) {
			try {
				return theaterDao.UpdateTheater(theater);
			}catch(Exception e) {
				throw new RuntimeException("Theater not found");
			}

		}

		@Override
		public void deleteTheater(Theater theater) {
			try {
				EntityTransaction entityTransaction=entityManager.getTransaction();
				entityTransaction.begin();
				entityManager.remove(theater);
				entityTransaction.commit();

			}catch(Exception e) {
				throw new RuntimeException("Theater not found");
			}

		}

		@Override
		public List<Theater> findAllTheater() {
			try {
				return theaterDao.findAllTheater();
			}catch(Exception e) {
				throw new RuntimeException("database not exist");
			}

		}
}
