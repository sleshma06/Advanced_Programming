<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - ThriftAndDrift</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="page-wrapper">
    <div class="login-box">

        <div class="logo-area">
            <h1>ThriftAndDrift</h1>
            <p>Welcome back! Please login to continue.</p>
        </div>

        <%-- Error message (set by LoginServlet on failed authentication) --%>
        <%
            String errorMsg = (String) request.getAttribute("error");
            if (errorMsg != null) {
        %>
        <div class="error-message">
            <%= errorMsg %>
        </div>
        <% } %>

        <%-- Success message (set by RegisterServlet after a successful registration) --%>
        <%
            String successMsg = (String) request.getAttribute("success");
            if (successMsg != null) {
        %>
        <div class="success-message">
            <%= successMsg %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email"
                       placeholder="Enter your email"
                       value="<%= request.getAttribute("typedEmail") != null
                                   ? request.getAttribute("typedEmail") : "" %>"
                       required />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password"
                       placeholder="Enter your password"
                       required />
            </div>

            <div class="form-group remember-row">
                <label class="checkbox-label">
                    <input type="checkbox" name="remember" /> Remember me
                </label>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-login">Login</button>
            </div>

        </form>

        <div class="register-link">
            <p>Don't have an account?
               <a href="${pageContext.request.contextPath}/pages/user/register.jsp">Register here</a>
            </p>
        </div>

    </div>
</div>

</body>
</html>
