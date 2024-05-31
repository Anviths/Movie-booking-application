<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
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


</head>
<body>

  <jsp:include page="navbar.jsp"></jsp:include>
  <jsp:include page="sidebar.jsp"></jsp:include>
  
  <div class="container mt-4">
        <form action="addmovie" enctype="multipart/form-data" method="post">

            <!-- Movie Name Input -->
            <div class="form-group">
                <label for="moviename">Movie Name:</label>
                <input type="text" class="form-control" id="moviename" name="moviename" required>
            </div>

            <!-- Movie Language Input -->
            <div class="form-group">
                <label for="movieLanguage">Movie Language:</label>
                <input type="text" class="form-control" id="movieLanguage" name="movieLanguage" required>
            </div>

            <!-- Movie Duration Input -->
            <div class="form-group">
                <label for="duration">Movie Duration:</label>
                <input type="time" class="form-control" id="duration" name="duration" required>
            </div>

            <!-- Movie Genre Input -->
            <div class="form-group">
                <label for="genre">Movie Genre:</label>
                <input type="text" class="form-control" id="genre" name="genre" required>
            </div>

            <!-- Movie Image Input -->
            <div class="form-group">
                <label for="img">Movie Image:</label>
                <input type="file" class="form-control-file" id="img" name="img" accept="image/*" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>