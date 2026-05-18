<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Thrift&amp;Drift</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="page-wrapper">
    <div class="login-card">

        <div class="logo-area">
            <span class="brand">THRIFT&amp;DRIFT</span>
        </div>

        <c:if test="${not empty requestScope.error}">
            <div class="alert alert--error">${requestScope.error}</div>
        </c:if>

        <c:if test="${not empty requestScope.success}">
            <div class="alert alert--success">${requestScope.success}</div>
        </c:if>

        <div class="form-header">
            <h1 class="form-title">Log in</h1>
            <p class="form-subtitle">Sign in to drift your way to better finds.</p>
        </div>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="login-form" novalidate>

            <div class="field-group">
                <label for="email" class="field-label">Email</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    class="field-input"
                    placeholder="advancedprogramming@gmail.com"
                    value="${not empty param.email ? param.email : ''}"
                    autocomplete="email"
                    required
                />
            </div>

            <div class="field-group">
                <div class="field-row-top">
                    <a href="${pageContext.request.contextPath}/pages/user/forgotPassword.jsp" class="forgot-link">forgot password?</a>
                </div>
                <label for="password" class="field-label">Password</label>
                <div class="password-wrapper">
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="field-input"
                        placeholder="Password"
                        autocomplete="current-password"
                        required
                    />
                    <button type="button" class="toggle-password" aria-label="Toggle password visibility" onclick="togglePassword()">
                        <svg id="eye-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/>
                            <path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/>
                            <line x1="1" y1="1" x2="23" y2="23"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="checkbox-group">
                <label class="checkbox-label">
                    <input type="checkbox" name="remember" class="checkbox-input"
                        ${not empty param.remember ? 'checked' : ''}
                    />
                    <span class="checkbox-custom"></span>
                    <span class="checkbox-text">Save Login Info</span>
                </label>
            </div>

            <button type="submit" class="btn-login">Login</button>

        </form>

        <div class="login-footer">
            <p class="register-text">
                Don't have an account?
                <a href="${pageContext.request.contextPath}/pages/user/register.jsp" class="register-link">Create one</a>
            </p>
            <a href="${pageContext.request.contextPath}/AdminLoginServlet" class="admin-link">Login as admin</a>
        </div>

    </div>
</div>

<script>
    function togglePassword() {
        var input = document.getElementById('password');
        var icon  = document.getElementById('eye-icon');
        if (input.type === 'password') {
            input.type = 'text';
            icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
        } else {
            input.type = 'password';
            icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/><path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/><line x1="1" y1="1" x2="23" y2="23"/>';
        }
    }
</script>

</body>
</html>