<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container my-5" style="max-width: 750px;">

    <h1 class="text-danger font-weight-bold mb-4">About Us</h1>

    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h5 class="card-title">Our Mission</h5>
            <p class="card-text text-muted">
                City Central Blood Bank is dedicated to ensuring a safe and reliable
                blood supply for hospitals and patients in emergency need. We connect
                voluntary blood donors with recipients through a simple, transparent
                donation and stock management process.
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-people-fill text-danger" style="font-size: 2rem;"></i>
                    <h6 class="mt-2">Donor Registration</h6>
                    <p class="text-muted small mb-0">Quick and easy sign-up for anyone who wants to donate.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-droplet-half text-danger" style="font-size: 2rem;"></i>
                    <h6 class="mt-2">Stock Management</h6>
                    <p class="text-muted small mb-0">Real-time tracking of blood units by group.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-shield-check text-danger" style="font-size: 2rem;"></i>
                    <h6 class="mt-2">Safe & Reliable</h6>
                    <p class="text-muted small mb-0">Eligibility rules ensure safe donation intervals.</p>
                </div>
            </div>
        </div>
    </div>

    <p class="mt-4">
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">Back to Home</a>
    </p>

</div>

</body>
</html>
