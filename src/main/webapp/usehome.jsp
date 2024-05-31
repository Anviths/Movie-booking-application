<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.jsp.movieapp.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.movieapp.service.imp.MovieServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INOX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href=" <c:url value="/resources/css/inox.css"/> ">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

nav {
	display: flex;
	justify-content: center;
	align-items: center;
	justify-content: space-between;
	background-color: antiquewhite;
	padding: 0.5em;
	font-size: larger;
	opacity: 1;
}

nav a {
	color: #333;
	font-weight: 500;
	text-decoration: none;
	/* padding: 0.5em 1em; */
	margin: 0 1em;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.login {
	border: 1px solid white;
	padding: 8px 14px;
	background-color: red;
	border-radius: 5px;
}

.login:hover {
	background-color: yellowgreen;
}

/* nav a:hover {
  background-color: whitesmoke;
} */
.droplist {
	position: absolute;
	top: 10%;
	/* padding-top: 1em; */
	left: 22%;
	z-index: 1;
	display: none;
}

.drop {
	list-style-type: none;
	padding: 20px;
	border: 1px solid;
	border-radius: 5px;
	width: 140px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: black;
}

.drop a {
	color: white;
	text-decoration: none;
	font-size: 15px;
	letter-spacing: 0.5px;
	font-weight: 500;
}

.location:hover+.droplist {
	display: block;
}

.droplist2 {
	position: absolute;
	top: 10%;
	left: 31%;
	z-index: 1;
	display: none;
}

.drop2 {
	list-style-type: none;
	padding: 20px;
	border: 1px solid;
	border-radius: 5px;
	width: 140px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: black;
}

.drop2 a {
	color: white;
	text-decoration: none;
	font-size: 15px;
	letter-spacing: 0.5px;
	font-weight: 500;
}

.snacks:hover+.droplist2 {
	display: block;
}

#slider {
	position: relative;
}

#cardss {
	display: flex;
	margin-top: 1em;
	justify-content: space-around;
	flex-wrap: wrap;
}
/* Styles for circular profile icon */
.profile-icon {
	width: 40px; /* Adjust the size as needed */
	height: 40px; /* Adjust the size as needed */
	border-radius: 50%;
	overflow: hidden;
	border: 2px solid #fff; /* You can change the border color */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	/* Optional: Add a subtle shadow */
}

.profile-icon img {
	width: 100%;
	height: auto;
	display: block;
}

    #cardss {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .card {
        margin: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card-img-top {
        max-height: 200px;
        object-fit: cover; /* Ensure the image covers the entire container */
    }
</style>

</head>
<body>
	 <jsp:include page="navbar.jsp"></jsp:include>


	<section id="slider">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="<c:url value="/resources/erbp/c1.webp"></c:url>"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="<c:url value="/resources/erbp/c2.webp"></c:url>"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value="/resources/erbp/c4.webp"></c:url>"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>
 
	

 
    <section id="cardss">
    <c:forEach var="movie" items="${movies}">
        
        
        <div class="card" style="width: 18rem; height: 400px;">
  <img class="card-img-top" style="object-fit: cover;" src="<c:url value='/resources/image/movie/${movie.movieImageName}'/>" alt="Card image cap">
  <div class="card-body">
    <h4 class="card-title">${movie.moviename}</h4>
    <p class="card-text">${movie.genre}</p>
    <p class="card-text">${movie.duration}</p>
    <a href="show_theater?movie_id=${movie.id }" class="btn btn-primary">Book Now</a>
  </div>
</div>
    </c:forEach>
</section>
	<footer> </footer>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/58a810656e.js"
		crossorigin="anonymous"></script>
	<script src='<c:url value="resources/js/inox.js"></c:url>'></script>
</body>

</html>