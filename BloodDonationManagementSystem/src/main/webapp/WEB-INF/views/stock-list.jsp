<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Stock</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 800px;">

    <h1 class="mb-4 text-danger font-weight-bold">Blood Stock Levels</h1>

    <div class="card shadow-sm mb-4">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Units Available</th>
                        <th scope="col">Status</th>
                        <th scope="col">Last Updated</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stock" items="${stockList}">
                        <tr>
                            <td><span class="badge badge-secondary">${stock.bloodGroup}</span></td>
                            <td><strong>${stock.unitsAvailable}</strong></td>
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
                            <td>
                                <c:choose>
                                    <c:when test="${stock.lastUpdated != null}">
                                        ${stock.lastUpdated}
                                    </c:when>
                                    <c:otherwise><span class="text-muted">Never</span></c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty stockList}">
                        <tr>
                            <td colspan="4" class="text-center text-muted py-4">No stock records found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title mb-3">Set Stock Units</h5>
            <form action="${pageContext.request.contextPath}/stock/update" method="post" class="form-row align-items-end">
                <div class="col-auto">
                    <label for="bloodGroupSelect">Blood Group</label>
                    <select id="bloodGroupSelect" name="bloodGroup" class="form-control" required>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>
                <div class="col-auto">
                    <label for="unitsInput">Units</label>
                    <input type="number" id="unitsInput" name="units" class="form-control" min="0" required/>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger">Update</button>
                </div>
            </form>
        </div>
    </div>

    <p class="mt-4">
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">Back to Home</a>
    </p>

</div>

</body>
</html>
