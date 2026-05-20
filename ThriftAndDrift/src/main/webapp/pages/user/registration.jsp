<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account </title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registration.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Nunito:wght@900&family=Barlow+Condensed:wght@900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="registration-container">
        <div class="card-wrapper">
        
            <div class="form-panel">
                <div class="form-content">

                    <a href="${pageContext.request.contextPath}/HomeServlet" class="back-home">

                        <span>&#8592;</span> Go back to home page
                    </a>
                    
                    <h1 class="page-title">Create account</h1>

                    <c:if test="${not empty error}">
                        <div class="error-message">${error}</div>
                    </c:if>
                    

                    <c:if test="${not empty error}">
                        <div class="error-message">${error}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post" class="registration-form">
                        <div class="input-group">
                            <input type="email" name="email" placeholder="Email address" value="${email}" required>
                        </div>
                        
                        <div class="input-group">
                            <input type="text" name="username" placeholder="Username" value="${username}" required>

                        </div>
                        
                        <div class="input-group">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        
                        <div class="input-group">
                            <input type="password" name="confirmPassword" placeholder="Confirm password" required>
                        </div>
                    
                        <button type="submit" class="submit-btn">Create account</button>
                    </form>
                </div>
                
                <div class="logo-container">
                    <span class="logo-text">THRIFT&amp;DRIFT</span>
                </div>
            </div>
            
            <!-- Right Side: Decorative Image -->
            <div class="image-panel">
                
                 <img src="${pageContext.request.contextPath}/images/registration.jpg" alt="bg">
        </div>
    </div>
    </div>
</body>
</html>
