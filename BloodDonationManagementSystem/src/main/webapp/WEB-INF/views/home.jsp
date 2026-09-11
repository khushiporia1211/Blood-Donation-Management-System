<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .carousel-item {
            height: 480px;
        }
        .carousel-item img {
            width: 100%;
            height: 480px;
            object-fit: cover;
        }
        .carousel-caption h2 {
            font-weight: bold;
            text-shadow: 0 2px 8px rgba(0,0,0,0.6);
        }
        .carousel-caption p {
            text-shadow: 0 1px 5px rgba(0,0,0,0.6);
        }
        .section-icon {
            font-size: 2.2rem;
            color: #b30000;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<!-- Hero Carousel -->
<div id="heroCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#heroCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#heroCarousel" data-slide-to="1"></li>
        <li data-target="#heroCarousel" data-slide-to="2"></li>
        <li data-target="#heroCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://picsum.photos/seed/blooddonation1/1600/600" alt="Blood donation">
            <div class="carousel-caption d-none d-md-block">
                <h2>${message}</h2>
                <p>Every donation can save up to three lives.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://picsum.photos/seed/blooddonation2/1600/600" alt="Donors">
            <div class="carousel-caption d-none d-md-block">
                <h2>Join Thousands of Donors</h2>
                <p>Be part of a community that gives the gift of life.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://picsum.photos/seed/blooddonation3/1600/600" alt="Blood stock">
            <div class="carousel-caption d-none d-md-block">
                <h2>Real-Time Stock Tracking</h2>
                <p>We keep an accurate record of every blood group, every day.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://picsum.photos/seed/blooddonation4/1600/600" alt="Emergency response">
            <div class="carousel-caption d-none d-md-block">
                <h2>Ready for Emergencies</h2>
                <p>Fast, reliable access to blood when it matters most.</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#heroCarousel" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#heroCarousel" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>

<!-- Login / Register action section -->
<div class="container text-center" style="max-width: 700px; margin-top: 50px;">
    <c:choose>
        <c:when test="${empty sessionScope.loggedInUser}">
            <p class="mb-4 text-muted">Please choose how you'd like to continue:</p>
            <div class="d-flex flex-column flex-sm-row justify-content-center">
                <a href="${pageContext.request.contextPath}/login?type=admin" class="btn btn-danger btn-lg m-2">Login as Admin</a>
                <a href="${pageContext.request.contextPath}/login?type=donor" class="btn btn-danger btn-lg m-2">Login as Donor</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-danger btn-lg m-2">Register as New Donor</a>
            </div>
        </c:when>
        <c:when test="${sessionScope.loggedInUser.admin}">
            <p class="mb-4 text-muted">Logged in as Admin: <strong>${sessionScope.loggedInUser.username}</strong></p>
            <div class="d-flex flex-column flex-sm-row justify-content-center">
                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-danger btn-lg m-2">Dashboard</a>
                <a href="${pageContext.request.contextPath}/list" class="btn btn-danger btn-lg m-2">View Donor List</a>
                <a href="${pageContext.request.contextPath}/stock/list" class="btn btn-danger btn-lg m-2">Manage Blood Stock</a>
            </div>
        </c:when>
        <c:otherwise>
            <p class="mb-4 text-muted">Logged in as Donor: <strong>${sessionScope.loggedInUser.username}</strong></p>
            <div class="d-flex flex-column flex-sm-row justify-content-center">
                <a href="${pageContext.request.contextPath}/profile" class="btn btn-danger btn-lg m-2">My Profile</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Why Donate section -->
<div class="container my-5">
    <h2 class="text-center font-weight-bold mb-5">Why Your Donation Matters</h2>
    <div class="row">
        <div class="col-md-3 col-6 text-center mb-4">
            <i class="bi bi-heart-pulse-fill section-icon"></i>
            <h6 class="mt-2 font-weight-bold">Save Lives</h6>
            <p class="text-muted small">A single donation can save up to three lives in emergencies and surgeries.</p>
        </div>
        <div class="col-md-3 col-6 text-center mb-4">
            <i class="bi bi-clock-history section-icon"></i>
            <h6 class="mt-2 font-weight-bold">Takes Minutes</h6>
            <p class="text-muted small">The donation process is quick, safe, and simple for every registered donor.</p>
        </div>
        <div class="col-md-3 col-6 text-center mb-4">
            <i class="bi bi-shield-check section-icon"></i>
            <h6 class="mt-2 font-weight-bold">Medically Safe</h6>
            <p class="text-muted small">Our system enforces a 90-day gap between donations to protect donor health.</p>
        </div>
        <div class="col-md-3 col-6 text-center mb-4">
            <i class="bi bi-graph-up-arrow section-icon"></i>
            <h6 class="mt-2 font-weight-bold">Always Tracked</h6>
            <p class="text-muted small">Live stock levels help hospitals respond quickly during shortages.</p>
        </div>
    </div>
</div>

<!-- About blurb section -->
<div class="bg-white py-5">
    <div class="container" style="max-width: 800px;">
        <h2 class="text-center font-weight-bold mb-4">About City Central Blood Bank</h2>
        <p class="text-muted text-center">
            City Central Blood Bank has been serving the community by maintaining a
            reliable and transparent blood donation network. Our platform connects
            willing donors with hospitals in need, ensuring that no emergency goes
            unmet due to a shortage of blood. From donor registration to real-time
            stock management, every step is designed to be simple, safe, and fast.
            Whether you're donating for the first time or the tenth, thank you for
            being part of something that saves lives every single day.
        </p>
        <p class="text-center">
            <a href="${pageContext.request.contextPath}/about" class="btn btn-outline-danger">Learn More About Us</a>
        </p>
    </div>
</div>

<!-- Footer -->
<footer class="bg-danger text-white text-center py-4">
    <p class="mb-0">&copy; 2026 City Central Blood Bank. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
