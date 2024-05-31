<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Booking App - Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Movie Booking App - Sign Up</h2>
    
    <form:form action="save" method="post" modelAttribute="user" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <form:input type="text" path="name" class="form-control" id="email" aria-describedby="emailHelp"/>
            <form:errors path="name" cssClass="text-danger"/>
        </div>
        
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <form:input type="email" path="email" class="form-control" id="email" aria-describedby="emailHelp"/>
            <form:errors path="email" cssClass="text-danger"/>
        </div>
        
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <form:input type="tel" path="phone" class="form-control" id="phone" aria-describedby="emailHelp"/>
            <form:errors path="phone" cssClass="text-danger"/>
        </div>
        
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <form:password path="password" class="form-control" id="password"/>
            <form:errors path="password" cssClass="text-danger"/>
        </div>
        
        <div class="mb-3">
            <label for="img" class="form-label">Photo</label>
            <input type="file" name="img" class="form-control" id="img"/>
            <form:errors name="img" cssClass="text-danger"/>
        </div>
        
        <div class="mb-3">
            <form:checkbox path="role" id="btn-check" value="ADMIN" /> 
            <label for="btn-check">Admin</label>

            <form:checkbox path="role" id="btn-check-2" value="CUSTOMER" checked="true" />
            <label  for="btn-check-2">Customer</label>
        </div>
        
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </div>
    </form:form>
    
</div>

</body>
</html>
