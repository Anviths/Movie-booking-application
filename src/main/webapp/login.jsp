<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Booking App - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-image: url('your-background-image-url.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            color: #fff; /* Text color on top of the background */
        }

        .card {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for the card */
        }

        .btn-social {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<c:if test="${errorMessage != null}">
        <div class="alert alert-danger" role="alert">
            ${errorMessage}
        </div>
    </c:if>
    <form action="signin" method="post">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="mb-0">Movie Booking App - Login</h4>
                        </div>
                        <div class="card-body">

                            <div class="form-group">
                                <label for="staticEmail">Email</label>
                                <input type="text" class="form-control" id="staticEmail" name="userid"
                                    placeholder="Enter your email">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="inputPassword" name="password"
                                        placeholder="Enter your password">
                                    <button class="btn btn-outline-secondary" type="button"
                                        onclick="togglePasswordVisibility()">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                            <p class="mt-2">Not registered? <a href="form">Register</a></p>

                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript for Password Visibility Toggle -->
    <script>
        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("inputPassword");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
    </script>
</body>
</html>
