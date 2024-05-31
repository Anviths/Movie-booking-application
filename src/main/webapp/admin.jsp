<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INOX Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/inox.css'/>">

<style type="text/css">
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

	<jsp:include page="navbar.jsp"></jsp:include>


	<section id="admin-section"
		style="text-align: center; margin-top: 50px;">
		<h2>Welcome to INOX Admin Page</h2>

		<a href="addmovie.jsp" class="btn btn-primary">Add Movie</a>
		<a href="addtheater.jsp" class="btn btn-primary">Add Theater</a>
		<a href="createShow" class="btn btn-primary">Add Show</a>
		<!-- Add other admin functionalities as needed -->
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/58a810656e.js"
		crossorigin="anonymous"></script>
	<script src='<c:url value="/resources/js/inox.js"/>'></script>
</body>
</html>
