<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous"/>
    <style>
        body {
            background-color: #f8f9fa; /* Bootstrap default background color */
        }
        section {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5em;
            padding-top: 0.5em;
        }
        .btn-group {
            display: flex;
            gap: 0.3em;
            padding: 0.5rem;
        }
        .screen {
            width: 400px;
            height: auto;
            border: 2px solid black;
            margin-bottom: 1em;
        }
        .optionType {
            display: flex;
            padding: 0em 1.5em;
            justify-content: space-between;
            margin-bottom: 1em;
        }
        .classic {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<form action="payment" method="post">
    <section>
        <div class="screen"></div>
        <h5>Screen this way</h5>
    </section>

    <div class="optionType">
        <div>
            <button type="button" class="btn btn-danger">EXIT</button>
        </div>
        <div>
            <button type="button" class="btn btn-primary">Selected</button>
            <button type="button" class="btn btn-outline-secondary">
                Available
            </button>
            <button type="button" class="btn btn-light">Sold Out</button>
        </div>
    </div>

    <section class="classic">
        <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
            <c:forEach var="seat" items="${seats}">
                <c:if test="${seat.seatNumber.charAt(1) == '0'}">
                    <c:set var="seatRow" value="${seat.seatNumber.charAt(0)}"/>
                    <div class="btn-group" id="class"></div>
                    <h3>${seatRow}</h3>
                </c:if>
                <input type="checkbox" class="btn-check" id="btncheck${seat.seatNumber}" name="seatIds" value="${seat.id}" />
                <label class="btn 
                    <c:choose>
                        <c:when test="${seat.booked}">
                            btn-outline-danger
                        </c:when>
                        <c:otherwise>
                            btn-outline-primary
                        </c:otherwise>
                    </c:choose>
                    " for="btncheck${seat.seatNumber}">${seat.seatNumber.charAt(1)}</label>
            </c:forEach>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Proceed to Payment</button>
    </section>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
