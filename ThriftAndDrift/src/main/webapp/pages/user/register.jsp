<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - ThriftAndDrift</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<div class="page-wrapper">

    <div class="register-box">

        <div class="logo-area">
            <h1>ThriftAndDrift</h1>
            <p>Create your account to get started.</p>
        </div>

        <!-- Show error if registration fails -->
        <%
            String errorMsg = (String) request.getAttribute("error");
            if (errorMsg != null) {
        %>
            <div class="error-message">
                <%= errorMsg %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" onsubmit="return validateForm()">

            <!-- Full Name -->
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required />
                <span class="field-hint" id="nameError"></span>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required />
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required />
                <span class="field-hint" id="phoneError"></span>
            </div>

            <!-- Date of Birth -->
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" required />
            </div>

            <!-- Address -->
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter your address" />
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required />
                <span class="field-hint">At least 6 characters</span>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required />
                <span class="field-hint" id="passwordError"></span>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-register">Create Account</button>
            </div>

        </form>

        <div class="login-link">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/pages/user/login.jsp">Login here</a></p>
        </div>

    </div>

</div>

<!-- Basic JS validation - keeps things clean on client side -->
<script>
    function validateForm() {
        var isValid = true;

        // Check that full name doesn't contain numbers
        var fullName = document.getElementById("fullName").value.trim();
        var nameError = document.getElementById("nameError");
        if (/\d/.test(fullName)) {
            nameError.textContent = "Name should not contain numbers.";
            nameError.style.color = "red";
            isValid = false;
        } else {
            nameError.textContent = "";
        }

        // Check phone is digits only
        var phone = document.getElementById("phone").value.trim();
        var phoneError = document.getElementById("phoneError");
        if (!/^\d{10,15}$/.test(phone)) {
            phoneError.textContent = "Enter a valid phone number (digits only).";
            phoneError.style.color = "red";
            isValid = false;
        } else {
            phoneError.textContent = "";
        }

        // Check passwords match
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var passwordError = document.getElementById("passwordError");
        if (password !== confirmPassword) {
            passwordError.textContent = "Passwords do not match.";
            passwordError.style.color = "red";
            isValid = false;
        } else {
            passwordError.textContent = "";
        }

        return isValid;
    }
</script>

</body>
</html>
