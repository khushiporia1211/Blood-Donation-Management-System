<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 950px;">

    <h1 class="mb-4 text-danger fw-bold">Registered Donors</h1>

    <div class="row g-3 align-items-center mb-4">
        <div class="col-sm-6">
            <a href="${pageContext.request.contextPath}/register" class="btn btn-danger">
                + Register New Donor
            </a>
        </div>

        <div class="col-sm-6">
            <form action="${pageContext.request.contextPath}/search" method="get" class="d-flex align-items-center justify-content-sm-end">
                <label for="bloodGroupSelect" class="me-2 text-nowrap fw-semibold">Filter by Blood Group:</label>
                <select id="bloodGroupSelect" name="bloodGroup" class="form-select w-auto" onchange="this.form.submit()">
                    <option value="">All</option>
                    <option value="A+" ${selectedBloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                    <option value="A-" ${selectedBloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                    <option value="B+" ${selectedBloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                    <option value="B-" ${selectedBloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                    <option value="AB+" ${selectedBloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                    <option value="AB-" ${selectedBloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                    <option value="O+" ${selectedBloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                    <option value="O-" ${selectedBloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                </select>
            </form>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-danger text-white">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Age</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Last Donation</th>
                        <th scope="col">Eligible?</th>
                        <th scope="col" class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="donor" items="${donors}">
                        <tr>
                            <td><strong>${donor.id}</strong></td>
                            <td>${donor.name}</td>
                            <td>${donor.age}</td>
                            <td>${donor.gender}</td>
                            <td><span class="badge bg-secondary">${donor.bloodGroup}</span></td>
                            <td>${donor.contactNumber}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${donor.lastDonationDate != null}">
                                        ${donor.lastDonationDate}
                                    </c:when>
                                    <c:otherwise><span class="text-muted">Never</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${donor.eligibleToDonate}">
                                        <span class="badge bg-success">Yes</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">No</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center text-nowrap">
                                <a class="btn btn-sm btn-outline-success me-1" href="${pageContext.request.contextPath}/donate/${donor.id}">Record Donation</a>
                                <a class="btn btn-sm btn-outline-primary me-1" href="${pageContext.request.contextPath}/edit/${donor.id}">Edit</a>
                                <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/delete/${donor.id}" onclick="return confirm('Delete this donor?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty donors}">
                        <tr>
                            <td colspan="9" class="text-center text-muted py-4">No donors found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
