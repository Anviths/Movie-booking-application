<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Ticket</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include your CSS if needed -->
    <style>
        body {
            background-color: #f8f9fa; /* Bootstrap default background color */
        }
    </style>
</head>
<body class="container mt-5">
<jsp:include page="navbar.jsp"></jsp:include>
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">Movie Ticket</h2>

            <div class="row">
                <div class="col-md-6">
                    <p><strong>Movie Name:</strong> ${tickets.showTime.movie.moviename }</p>
                    <!-- Add more movie details as needed -->
                </div>
                <div class="col-md-6">
                    <p class="text-right"><strong>Name:</strong> ${tickets.user.name }</p>
                    <!-- Add more movie details as needed -->
                </div>
                <div class="col-md-6">
                    <p class="text-right"><strong>Show Time:${tickets.showTime.time }</strong> </p>
                    <!-- Add more show details as needed -->
                </div>
            </div>

            <table class="table table-bordered mt-4">
                <thead>
                <c:set var="ticket" value="${tickets}"></c:set>
                    <tr>
                        <th>${tickets.showTime.time}</th>
                        <th>${tickets.totalePrice}</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="seats" items="${tickets.seats}">
                        <tr>
                            <td>${seats.seatNumber}</td>
                            <td>${seats.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="mt-4">
                <p><strong>Total Amount:</strong> ${totalAmount}</p>
                <!-- Add more payment details as needed -->
            </div>

            <!-- Include your additional information or buttons as needed -->

        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
