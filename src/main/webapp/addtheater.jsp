<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Theater</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
  <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container mt-4">
        <form action="savetheater" method="post">

 
            <!-- Theater Name Input -->
            <div class="form-group">
                <label for="name">Theater Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <!-- Theater Address Input -->
            <div class="form-group">
                <label for="address">Theater Address:</label>
                <textarea class="form-control" id="address" name="address" rows="5" required></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
