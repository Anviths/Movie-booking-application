<!-- bookingPage.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Movie Booking</title>
</head>
<body>

<c:set var="selected_movie"  value="${sessionScope.movie_selected }" />
<c:set var="list_shows"  value="${movie_selected.show }" />
<div class="container mt-5">
    <div class="row">
        <!-- List of Theaters -->
        <div class="col-md-4">
            <h3>Theaters</h3>
            <ul class="list-group">
                <c:forEach var="show" items="${shows}">
                    <li class="list-group-item">${show.theater.name}</li>
                    <li class="list-group-item">${show.theater.address}</li>
                </c:forEach>
            </ul>
        </div>
        <!-- List of Shows for Selected Movie and Theater -->
        <div class="col-md-8">
            <h3>Shows</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>Theater</th>
                    <th>Show Time</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="show" items="${shows}">
                    <tr>
                      
                        <td>
                            <a href="<c:url value='/seats?showId=${show.id}'/>" class="btn btn-primary">${show.time}</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <!-- show details -->
                <tbody>
                <c:forEach var="show" items="${shows}">
                    <tr>
                      
                        <td>
                            <a href="<c:url value='/seats?showId=${show.id}'/>" class="btn btn-primary">${show.time}</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
