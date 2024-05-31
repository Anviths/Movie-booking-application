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
import com.jsp.movieapp.service.MovieService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class MovieController {
	@Autowired
	MovieService movieService;
	
	@PostMapping("/addmovie")
	public ModelAndView signup(@ModelAttribute Movie movie,BindingResult result,@RequestParam("img") MultipartFile file,HttpSession session ) {
		if(result.hasErrors()) {
			if (result.hasErrors()) {
	            ModelAndView errorView = new ModelAndView("addmovie.jsp");
	            errorView.addObject("movie", movie);
	            errorView.addObject("errorMessage", "Validation errors occurred.");
	            return errorView;
	        }
		}
		ModelAndView view =new ModelAndView("admin.jsp");
		if(!file.isEmpty()) {
			try {
				movie.setMovieImageName(movie.getMoviename()+".jpeg");
				movieService.saveMovie(movie);
				String path=session.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"resources"+File.separator+"image"+File.separator+"movie"+File.separator+movie.getMoviename()+".jpeg";
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
	
	@GetMapping("/home")
	public ModelAndView findAllMovie() {
		ModelAndView view=new ModelAndView("usehome.jsp");
	List<Movie>	movies= movieService.findAllMovie();
	view.addObject("movies", movies);
		return view;
	}
	
	@ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
        ModelAndView errorView = new ModelAndView("error.jsp");
        errorView.addObject("errorMessage", "An unexpected error occurred.");
        return errorView;
    }
}
