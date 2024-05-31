<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/inox.css'/>">

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
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="<c:url value="/resources/image/INOXLogo.png"></c:url>"
				alt="Logo" width="70" height="54"
				class="d-inline-block align-text-top">
			</a>
			<!-- Other navigation links -->
			<a href="home" class="nav-link">Home</a>
			<!-- ... other links ... -->
			<a href="#" class="nav-link">Advertise</a> <a href="#"
				class="nav-link">Inox Rewards</a>
			<!-- Login and search bar for users not logged in -->
			<c:if test="${userLogin==null }">
				<a href="#" class="nav-link">
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</a>

				<a href="form" class="nav-link"><button type="button"
						class="btn btn-primary">SignUp</button></a>
				<a href="login.jsp" class="nav-link"><button type="button"
						class="btn btn-primary">Log-In</button></a>

			</c:if>
			<!-- Profile icon for logged-in users -->
			<c:if test="${userLogin != null}">
				<a href="#" class="nav-link">
					<div>
						<input type="text" placeholder="Search for Movies"><i
							class="fa-solid fa-magnifying-glass"></i>
					</div>
				</a>
				<c:set var="img" value="${userLogin.name}${userLogin.email}.jpeg"></c:set>
				<div class="profile-icon" data-toggle="popover"
					data-placement="bottom" title="Profile Update">
					<img
						src='<c:url value="/resources/image/${userLogin.imageName }"></c:url>'
						alt="Profile Picture">

				</div>
				<a href="login.jsp" class="nav-link"><button type="button"
						class="btn btn-primary">Log-Out</button></a>
		</div>
		</c:if>
		</div>

	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/58a810656e.js"
		crossorigin="anonymous"></script>
	<script src='<c:url value="/resources/js/inox.js"/>'></script>

</body>
</html>