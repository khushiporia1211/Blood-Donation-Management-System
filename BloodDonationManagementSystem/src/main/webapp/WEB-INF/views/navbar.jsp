<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <a class="navbar-brand font-weight-bold" href="${pageContext.request.contextPath}/">
        <i class="bi bi-droplet-fill"></i> City Central Blood Bank
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link text-white" href="${pageContext.request.contextPath}/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="${pageContext.request.contextPath}/about">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="${pageContext.request.contextPath}/contact">Contact</a>
            </li>
            <c:if test="${empty sessionScope.loggedInUser}">
                <li class="nav-item">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/register">Register</a>
                </li>
            </c:if>
            <c:if test="${not empty sessionScope.loggedInUser}">
                <li class="nav-item">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/logout">Logout</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
