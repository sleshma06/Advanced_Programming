<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Thrift&Drift</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

    <div class="auth-page">

        <div class="auth-left login-left">
            <div class="brand top-brand">THRIFT&DRIFT</div>

            <div class="form-box">
                <h1>Log in</h1>
                <p class="sub-text">Sign in to drift your way to better finds.</p>

                <% String error = request.getParameter("error"); %>
                <% if(error != null){ %>
                    <div class="message error-message"><%= error %></div>
                <% } %>

                <% String success = request.getParameter("success"); %>
                <% if(success != null){ %>
                    <div class="message success-message"><%= success %></div>
                <% } %>

                <form action="#" method="post">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="advancedprogramming@gmail.com" required>

                    <div class="password-top">
                        <label>Password</label>
                        <a href="#" class="small-link">forgot password?</a>
                    </div>
                    <input type="password" name="password" placeholder="Password" required>

                    <div class="save-row">
                        <input type="checkbox" id="saveInfo" name="saveInfo">
                        <label for="saveInfo" class="check-text">save login info</label>
                    </div>

                    <button type="submit" class="main-btn">Login</button>
                </form>

                <p class="bottom-text">
                    Dont have an account?
                    <a href="<%= request.getContextPath() %>/pages/user/register.jsp">Create one</a>
                </p>

                <p class="admin-link">
                    <a href="#">Login as admin</a>
                </p>
            </div>
        </div>

        <div class="auth-right image-right">
            <div class="image-box login-image"></div>
        </div>

    </div>

</body>
</html>