<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seat</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"/>
      
      <style>
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
      }
      .optionType {
        display: flex;
        padding: 0em 1.5em;
        justify-content: space-between;
      }
    </style>
</head>
<body>
  
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
    <div
        class="btn-group"
        role="group"
        aria-label="Basic checkbox toggle button group"
      >
 <c:forEach var="seat" items="${seats }">
    <h3>${seat.seatNumber.charAt(0) }</h3>
    <label class="btn btn-outline-primary" for="btncheckA6">${seat.seatNumber.charAt(1) }</label>

        <input
          type="checkbox"
          class="btn-check"
          id="btncheckA7"
          autocomplete="off"
        />
 </c:forEach>
 </div>
</body>
 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
</html>