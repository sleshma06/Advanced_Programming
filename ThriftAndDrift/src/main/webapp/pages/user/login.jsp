<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Login - ThriftAndDrift</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="page-wrapper">

    <div class="left-panel">

        <div class="brand">THRIFT&amp;DRIFT</div>

        <div class="form-area">
            <h2>Log in</h2>
            <p class="subtitle">Sign in to drift your way to better finds.</p>

            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="success-message">${success}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email"
                           placeholder="you@example.com"
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

                <div class="form-group remember-row">
                    <label class="checkbox-label">
                        <input type="checkbox" name="remember"> save login info
                    </label>
                </div>

                <button type="submit" class="btn-login">Login</button>

            </form>

            <div class="bottom-links">
                <p>Dont have an account? <a href="${pageContext.request.contextPath}/pages/user/register.jsp">Create one</a></p>
                <a href="${pageContext.request.contextPath}/AdminLoginServlet" class="admin-link">Login as admin</a>
            </div>
        </div>

    </div>

    <div class="right-panel">
        <img src="${pageContext.request.contextPath}/images/allison-christine-wV7UfVeI84w-unsplash.jpg" alt="Thrift store front">
    </div>

</div>

</body>
</html>