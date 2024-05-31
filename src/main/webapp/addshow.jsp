<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Show Booking Form</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-4">
		<form action="saveshows" method="post">

			<!-- Show Time Dropdown -->
			<div class="form-group">
				<label for="showTime">Show Time:</label> <select
					class="form-control" id="showTime" name="showTime">
					<option value="07:00 AM">7:00 AM</option>
					<option value="10:00 AM">10:00 AM</option>
					<option value="01:00 PM">1:00 PM</option>
					<option value="04:00 PM">4:00 PM</option>
					<option value="07:00 PM">7:00 PM</option>
				</select>

				
				<div class="form-group">
					<label for="showDate">Show Date:</label> <input type="date"
						class="form-control" id="showDate" name="date" required>
				</div>

			
				<div class="form-group">
					<label for="numberOfSeats">Number of Seats:</label> <input
						type="number" class="form-control" id="numberOfSeats"
						name="numberOfSeats" required>
				</div>

				<div class="form-group">
					<label for="theater">Theater:</label> <select class="form-control"
						id="theater" name="theater_id">
						<c:forEach var="theater" items="${theaters}">
							<option value="${theater.id}">${theater.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="movie">Movie:</label> <select class="form-control"
						id="movie" name="movie_id">
						<c:forEach var="movie" items="${movies}">
							<option value="${movie.id}">${movie.moviename}</option>
						</c:forEach>
					</select>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
