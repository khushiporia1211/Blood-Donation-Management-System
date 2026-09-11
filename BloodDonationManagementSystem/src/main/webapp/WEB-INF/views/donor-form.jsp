<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 650px;">

    <h1 class="text-danger font-weight-bold mb-4">
        <c:if test="${donor.id == null}">Register New Donor</c:if>
        <c:if test="${donor.id != null}">Edit Donor</c:if>
    </h1>

    <div class="card shadow-sm">
        <div class="card-body">

            <form:form modelAttribute="donor" method="post">

                <div class="form-group">
                    <form:label path="name">Full Name</form:label>
                    <form:input path="name" cssClass="form-control"/>
                    <form:errors path="name" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="age">Age</form:label>
                    <form:input path="age" type="number" cssClass="form-control"/>
                    <form:errors path="age" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="gender">Gender</form:label>
                    <form:select path="gender" cssClass="form-control">
                        <form:option value="" label="-- Select --"/>
                        <form:option value="Male" label="Male"/>
                        <form:option value="Female" label="Female"/>
                        <form:option value="Other" label="Other"/>
                    </form:select>
                    <form:errors path="gender" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="bloodGroup">Blood Group</form:label>
                    <form:select path="bloodGroup" cssClass="form-control">
                        <form:option value="" label="-- Select --"/>
                        <form:option value="A+" label="A+"/>
                        <form:option value="A-" label="A-"/>
                        <form:option value="B+" label="B+"/>
                        <form:option value="B-" label="B-"/>
                        <form:option value="AB+" label="AB+"/>
                        <form:option value="AB-" label="AB-"/>
                        <form:option value="O+" label="O+"/>
                        <form:option value="O-" label="O-"/>
                    </form:select>
                    <form:errors path="bloodGroup" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="contactNumber">Contact Number</form:label>
                    <form:input path="contactNumber" cssClass="form-control"/>
                    <form:errors path="contactNumber" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="email">Email</form:label>
                    <form:input path="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="address">Address</form:label>
                    <form:textarea path="address" rows="3" cssClass="form-control"/>
                    <form:errors path="address" cssClass="text-danger small"/>
                </div>

                <div class="form-group">
                    <form:label path="lastDonationDate">Last Donation Date (if any)</form:label>
                    <form:input path="lastDonationDate" type="date" cssClass="form-control"/>
                    <form:errors path="lastDonationDate" cssClass="text-danger small"/>
                </div>

                <c:if test="${donor.id == null}">
                    <hr/>
                    <h5 class="mb-3">Create Your Login Account</h5>
                    <div class="form-group">
                        <label for="accountUsername">Username</label>
                        <input type="text" id="accountUsername" name="accountUsername" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label for="accountPassword">Password</label>
                        <input type="password" id="accountPassword" name="accountPassword" class="form-control" minlength="4" required/>
                    </div>
                </c:if>

                <button type="submit" class="btn btn-danger btn-block">Save Donor</button>

            </form:form>

        </div>
    </div>

    <p class="mt-4">
        <a href="${pageContext.request.contextPath}/list" class="btn btn-outline-secondary">Back to Donor List</a>
    </p>

</div>

</body>
</html>
