<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>

        <li><a href="${pageContext.request.contextPath}/AboutServlet">About</a></li>
        <li><a href="${pageContext.request.contextPath}/HomeServlet#contact-us">Contact</a></li>


    </ul>
    <div class="nav-right">
        <form class="nav-search" action="${pageContext.request.contextPath}/ShopServlet" method="get">
            <input class="nav-search-input" type="search" name="q" placeholder="Search products">
            <button class="nav-search-button" type="submit" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></button>
        </form>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Account"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="profile-page">
    <aside class="profile-menu">
        <h1>My Account</h1>
        <p>Manage your basic account details here.</p>
        <a href="#profile">Profile Details</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
    </aside>

    <section class="profile-content">
        <div class="panel" id="profile">
            <h2>Profile Details</h2>
            <p class="profile-help">Update your name, email, or password. Leave password fields blank if you do not want to change it.</p>

            <c:if test="${not empty success}">
                <p class="profile-message success">${success}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="profile-message error">${error}</p>
            </c:if>

            <form class="profile-form" method="post" action="${pageContext.request.contextPath}/ProfileServlet">
                <input type="text" name="name" placeholder="Full name" value="${profileUser.name}" required>
                <input type="email" name="email" placeholder="Email" value="${profileUser.email}" required>
                <input type="password" name="newPassword" placeholder="New password optional">
                <input type="password" name="confirmPassword" placeholder="Confirm new password">
                <button type="submit">Save Changes</button>
            </form>
        </div>
    </section>
</main>
</body>
</html>
