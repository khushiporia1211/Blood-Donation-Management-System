<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 550px;">

    <h1 class="text-danger font-weight-bold mb-4">Contact Admin</h1>

    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title text-danger font-weight-bold">City Central Blood Bank</h5>
            <p class="text-muted">
                Need to update your profile details, or have a question about your
                donation record? Reach out to us using the details below, or visit us in person.
            </p>

            <table class="table mb-0">
                <tr>
                    <th style="width: 120px;">Address</th>
                    <td>12, MG Road, Sector 5, New Delhi - 110001</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><a >8624122@gmail.com</a></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><a href="tel:+911234567890">+91 12345 67890</a></td>
                </tr>
                <tr>
                    <th>Office Hours</th>
                    <td>Mon - Sat, 9:00 AM - 5:00 PM</td>
                </tr>
            </table>
        </div>
    </div>

    <p class="mt-4">
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">Back to Home</a>
    </p>

</div>

</body>
</html>
