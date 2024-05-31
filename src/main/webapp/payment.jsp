<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
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
        
            <h2 class="card-title">Payment Details</h2>
             
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Seat Number</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="seat" items="${seats}">
                        <tr>
                            <td>${seat.seatNumber}</td>
                            <td>${seat.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <p>Total Amount: ${totalAmount}</p>

            <!-- Add your QR code image here -->
            <img id="qrCodeImage" src="path/to/your/qr/code/image" alt="QR Code" style="display: none;">

            <!-- Button to toggle QR code visibility -->
            <button class="btn btn-primary" onclick="toggleQRCode()">Show QR Code</button>

            <!-- Payment Information Form -->
                <!-- Add any additional payment information or form fields here -->
            <form action=" 	confirmPayment" method="post">
            <input type="hidden" name="total_price" value="${totalAmount}">
                <!-- Bootstrap Form Group -->
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" class="form-control" id="cardNumber"  required>
                </div>

                <div class="form-group">
                    <label for="expiryDate">Expiry Date:</label>
                   <input type="text" class="form-control" id="expiryDate"  placeholder="MM/YYYY" >
                </div>

                <!-- Add more payment fields as needed -->

                <button type="submit" class="btn btn-success">Pay</button>
            </form>
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        function toggleQRCode() {
            var qrCodeImage = document.getElementById("qrCodeImage");
            qrCodeImage.style.display = (qrCodeImage.style.display === 'none') ? 'block' : 'none';
        }
    </script>
</body>
</html>
