package com.jsp.movieapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.movieapp.entity.Movie;
import com.jsp.movieapp.entity.User;
import com.jsp.movieapp.service.MovieService;
import com.jsp.movieapp.service.UserService;
import com.jsp.movieapp.service.exception.InvalidUserException;
import com.jsp.movieapp.util.Role;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class UserController {
	
	@Autowired
	User user;
	@Autowired
	MovieService movieService;

	@Autowired
	UserService service;
	 @RequestMapping("/form")
	    public ModelAndView showForm() {
	        ModelAndView view = new ModelAndView("form.jsp");
	        view.addObject("user", new User());
	        return view;
	    }
	
	@PostMapping("/save")
	public ModelAndView signup(@ModelAttribute("user") User user,BindingResult result,@RequestParam("img") MultipartFile file,HttpSession session ) {
		if(result.hasErrors()) {
			if (result.hasErrors()) {
	            ModelAndView errorView = new ModelAndView("form.jsp");
	            errorView.addObject("user", user);
	            errorView.addObject("errorMessage", "Validation errors occurred.");
	            return errorView;
	        }
		}
		ModelAndView view =new ModelAndView("login.jsp");
		if(!file.isEmpty()) {
			try {
				user.setImageName(user.getName()+user.getEmail()+".jpeg");
				String path=session.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"resources"+File.separator+"image"+File.separator+user.getName()+user.getEmail()+".jpeg";
				service.saveUser(user);
				FileOutputStream stream=new FileOutputStream(path);
				System.out.println(path);
				stream.write(file.getBytes());
				stream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				 ModelAndView errorView = new ModelAndView("error.jsp");
	                errorView.addObject("errorMessage", "Error occurred while processing the file.");
	                return errorView;
			}
		}
		return view;
	}
	
	@PostMapping("signin")
	public ModelAndView login(@RequestParam("userid") String email,@RequestParam("password")  String password ,HttpSession session) {
		
		
		try {
			ModelAndView view = new ModelAndView("index.jsp");
			List<Movie>	movies= movieService.findAllMovie();
			view.addObject("movies", movies);
			User user = service.login(email, password);
			session.setAttribute("userLogin", user);
			view.addObject("loginUser",user);
			
			if(user.getRole().equals(Role.ADMIN)) {
				view.setViewName("admin.jsp");	
				return view;
			}
			if(user.getRole().equals(Role.CUSTOMER)) {
				view.setViewName("usehome.jsp");	
				return view;
			}
			
			
			return view;
		} catch (InvalidUserException e) {
			
			e.printStackTrace();
			ModelAndView errorView = new ModelAndView("login.jsp");
            errorView.addObject("errorMessage", e.getMessage());
            return errorView;
		}
		
	}
	
	@ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
        ModelAndView errorView = new ModelAndView("error.jsp");
        errorView.addObject("errorMessage", "An unexpected error occurred.");
        return errorView;
    }
}
