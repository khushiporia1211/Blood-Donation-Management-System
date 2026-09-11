<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 600px;">

    <h1 class="text-danger font-weight-bold mb-4">My Profile</h1>

    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table mb-0">
                <tr><th>Name</th><td>${donor.name}</td></tr>
                <tr><th>Age</th><td>${donor.age}</td></tr>
                <tr><th>Gender</th><td>${donor.gender}</td></tr>
                <tr><th>Blood Group</th><td><span class="badge badge-secondary">${donor.bloodGroup}</span></td></tr>
                <tr><th>Contact</th><td>${donor.contactNumber}</td></tr>
                <tr><th>Email</th><td>${donor.email}</td></tr>
                <tr><th>Address</th><td>${donor.address}</td></tr>
                <tr>
                    <th>Last Donation</th>
                    <td>
                        <c:choose>
                            <c:when test="${donor.lastDonationDate != null}">${donor.lastDonationDate}</c:when>
                            <c:otherwise><span class="text-muted">Never</span></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <th>Eligible to Donate?</th>
                    <td>
                        <c:choose>
                            <c:when test="${donor.eligibleToDonate}">
                                <span class="badge badge-success">Yes</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-danger">No</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <p class="mt-4">
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">Back to Home</a>
        <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-primary">Contact Admin to Edit Profile</a>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger">Logout</a>
    </p>

</div>

</body>
</html>
