<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Admin Login - ThriftAndDrift</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminlogin.css">
</head>
<body>

<div class="page-wrapper">
    <div class="login-box">

        <div class="brand">THRIFT&amp;DRIFT</div>

        <h2>Admin Login</h2>
        <p class="subtitle">Restricted access. Admins only.</p>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="success-message">${success}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email"
                       placeholder="admin@example.com"
                       value="${not empty email ? email : ''}" required>
            </div>

            <div class="form-group">
                <div class="label-row">
                    <label for="password">Password</label>
                    <a href="#" class="forgot-link">forgot password?</a>
                </div>
                <input type="password" id="password" name="password"
                       placeholder="••••••••" required>
            </div>

            <button type="submit" class="btn-login">Login as Admin</button>

        </form>

        <div class="bottom-links">
            <p>Not an admin? <a href="${pageContext.request.contextPath}/LoginServlet">Back to login</a></p>
        </div>

    </div>
</div>

</body>
</html>