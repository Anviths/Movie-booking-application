package com.jsp.movieapp.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@ComponentScan(value = "com.jsp")
@EnableWebMvc
public class ServletConfig implements WebMvcConfigurer{
	@Bean
	public StandardServletMultipartResolver multipartResolver() 
	{
	    return new StandardServletMultipartResolver(); 
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("resources/**")
		.addResourceLocations("WEB-INF/resources/");
	}
	
	@Bean
	public EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("java").createEntityManager();
	}
}
