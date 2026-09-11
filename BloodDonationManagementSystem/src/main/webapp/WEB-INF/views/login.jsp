<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container" style="max-width: 400px; margin-top: 100px;">

    <h1 class="text-center text-danger font-weight-bold mb-4">
        <c:if test="${loginType == 'admin'}">Admin Login</c:if>
        <c:if test="${loginType != 'admin'}">Donor Login</c:if>
    </h1>

    <div class="card shadow-sm">
        <div class="card-body">

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" name="loginType" value="${loginType}"/>

                <div class="form-group">
                    <c:if test="${loginType == 'admin'}">
                        <label for="username">Hospital ID</label>
                    </c:if>
                    <c:if test="${loginType != 'admin'}">
                        <label for="username">Username</label>
                    </c:if>
                    <input type="text" id="username" name="username" class="form-control" required autofocus/>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required/>
                </div>

                <button type="submit" class="btn btn-danger btn-block">Login</button>
            </form>

        </div>
    </div>

    <c:if test="${loginType == 'admin'}">
        <p class="text-center text-muted mt-3">
            Default admin login: <strong>admin</strong> / <strong>admin123</strong>
        </p>
    </c:if>

    <c:if test="${loginType != 'admin'}">
        <p class="text-center text-muted mt-3">
            Don't have an account? <a href="${pageContext.request.contextPath}/register">Register as a donor</a>
        </p>
    </c:if>

</div>

</body>
</html>
