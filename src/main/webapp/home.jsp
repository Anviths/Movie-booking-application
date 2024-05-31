<%@ page language="java" contentType="text/html; charset=UTF-8"%>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Movie Booking Home</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Movie Booking App</a>
<c:if test="">

</c:if>

<c:forEach var="user" items="${users }">
<h1>${user }</h1>
</c:forEach>
       <!--  <!-- User info (replace with actual user data) -->
        <div class="d-flex align-items-center">
            <span class="navbar-text">
                Hello, John Doe Replace with actual user name
            </span>
        </div>
    </div>
</nav> -->

<div class="container mt-4">
    <div class="row">
       <%--  <!-- Loop through movies and display movie blocks -->
        <c:forEach var="movie" items="${movies}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="${movie.imageUrl}" class="card-img-top" alt="${movie.title}">
                    <div class="card-body">
                        <h5 class="card-title">${movie.title}</h5>
                        <p class="card-text">${movie.description}</p>
                        <a href="#" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
        </c:forEach> --%>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
