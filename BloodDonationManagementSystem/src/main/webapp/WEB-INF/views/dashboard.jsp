<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 950px;">

    <h1 class="mb-4 text-danger font-weight-bold">Admin Dashboard</h1>

    <!-- Summary cards -->
    <div class="row mb-4">
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <h6 class="text-muted">Total Registered Donors</h6>
                    <h2 class="text-danger font-weight-bold">${totalDonors}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <h6 class="text-muted">Currently Eligible Donors</h6>
                    <h2 class="text-success font-weight-bold">${eligibleCount}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <h6 class="text-muted">Total Blood Units in Stock</h6>
                    <h2 class="text-danger font-weight-bold">${totalUnits}</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Stock breakdown table -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h5 class="card-title mb-3">Stock by Blood Group</h5>
            <table class="table table-sm mb-0">
                <thead>
                    <tr>
                        <th>Blood Group</th>
                        <th>Units</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stock" items="${stockList}">
                        <tr>
                            <td><span class="badge badge-secondary">${stock.bloodGroup}</span></td>
                            <td>${stock.unitsAvailable}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${stock.lowStock}">
                                        <span class="badge badge-danger">Low Stock</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-success">Sufficient</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div>
        <a href="${pageContext.request.contextPath}/list" class="btn btn-danger">View Donor List</a>
        <a href="${pageContext.request.contextPath}/stock/list" class="btn btn-danger">Manage Blood Stock</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">Back to Home</a>
    </div>

</div>

</body>
</html>
>