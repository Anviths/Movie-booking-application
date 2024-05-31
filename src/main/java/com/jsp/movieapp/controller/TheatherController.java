package com.jsp.movieapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.movieapp.entity.Theater;
import com.jsp.movieapp.service.TheaterService;

@Controller
@RequestMapping
public class TheatherController {
	
	@Autowired
	Theater therate;
	@Autowired
	TheaterService theaterService;
	 @PostMapping("/theater")
	    public ModelAndView theaterForm() {
	        ModelAndView view = new ModelAndView("theater.jsp");
	        view.addObject("theater", therate);
	        return view;
	    }
//	@ExceptionHandler(Exception.class)
//    public ModelAndView handleException(Exception ex) {
//        ModelAndView errorView = new ModelAndView("error.jsp");
//        errorView.addObject("errorMessage", "An unexpected error occurred.");
//        return errorView;
//    }
}
