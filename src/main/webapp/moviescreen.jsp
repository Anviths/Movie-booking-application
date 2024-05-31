<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BookHere</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      nav {
        background-color: antiquewhite;
        height: 80px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1.5em;
      }
      .div2 {
        display: flex;
        align-items: center;
        gap: 0.5em;
      }
      section {
        background-color: aliceblue;
        display: flex;
        gap: 8em;
        padding: 1em;
        height: auto;
        justify-content: space-evenly;
      }
      .imgDiv {
        width: 10%;
      }
    </style>
     <script>
        function filterShows() {
            var selectedDate = document.getElementById("dateFilter").value;
            var shows = document.getElementsByClassName("shows");

            for (var i = 0; i < shows.length; i++) {
                var showDate = shows[i].querySelector('a').innerText;

                // Assuming the date is present in the show time
                if (showDate.includes(selectedDate)) {
                    shows[i].style.display = "block"; // Show matched show
                } else {
                    shows[i].style.display = "none"; // Hide non-matching shows
                }
            }
        }
    </script>
  </head>
  <body>
  <jsp:include page="navbar.jsp"></jsp:include>
    <nav>
      <div class="div1">
        <input type="date" id="dateFilter"  onchange="filterEvents()">
      </div>
      <div class="div2">
        <h4>Filter By :</h4>
        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Language
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Hindi</a></li>
            <li><a class="dropdown-item" href="#">English</a></li>
            <li><a class="dropdown-item" href="#">Hinglish</a></li>
          </ul>
        </div>

        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Format
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">2D</a></li>
            <li><a class="dropdown-item" href="#">3D</a></li>
            <li><a class="dropdown-item" href="#">Dobly</a></li>
          </ul>
        </div>

        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Price
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Below Rs 300</a></li>
            <li><a class="dropdown-item" href="#">Rs 300 - Rs 500</a></li>
            <li><a class="dropdown-item" href="#">Above Rs 500</a></li>
          </ul>
        </div>

        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            ShowTime
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Morning</a></li>
            <li><a class="dropdown-item" href="#">Noon</a></li>
            <li><a class="dropdown-item" href="#">Evening</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
<c:set var="selected_movie"  value="${sessionScope.movie_selected }" />
<c:set var="list_shows"  value="${movie_selected.show }" />


<div class="container mt-4">
    <div class="row">
        <div class="col-md-4 movieDetails">
            <img src="<c:url value='/resources/image/movie/${selected_movie.movieImageName}'/>"
                 class="img-thumbnail" alt="..."/>
            <h2>${selected_movie.moviename}</h2>
            <p>${selected_movie.genre}</p>
            <p>${selected_movie.duration}</p>
        </div>

        <div class="col-md-8">
            <c:forEach var="entry" items="${theaters}">
            <c:set var="theater"  value="${entry.value }"/>
                <section class="mt-3">
                    <div class="nameGenreLikes">
                        <h4>${theater.name.toUpperCase()}</h4>
                        <p>UA * ${theater.address.toUpperCase()}</p>
                        <button type="button" class="btn btn-outline-danger">Likes</button>
                    </div>
                    <div class="timeLanguage">
                        <h5>${selected_movie.movieLanguage}</h5>
                    <c:forEach  var="show" items="${theater.showTime }">
                    <div class="shows">
                    <c:if test="${selected_movie.moviename==show.movie.moviename}">
                        <a href="seat?show_id=${show.id }" class="btn btn-primary">${show.time}</a>
                        </c:if>
                        </div>
                    </c:forEach>
                    </div>
                </section>
            </c:forEach>
        </div>
    </div>
</div>
    

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    >
    function filterShows() {
        var selectedDate = document.getElementById("dateFilter").value;
        var shows = document.getElementsByClassName("shows");

        for (var i = 0; i < shows.length; i++) {
            var showDate = shows[i].querySelector('a').innerText;

            // Assuming the date is present in the show time
            if (showDate.includes(selectedDate)) {
                shows[i].style.display = "block"; // Show matched show
            } else {
                shows[i].style.display = "none"; // Hide non-matching shows
            }
        }
    }
   
    </script>
  </body>
</html>