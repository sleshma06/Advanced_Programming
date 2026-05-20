<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>
<div class="admin-shell">
    <aside class="sidebar">
        <div class="sidebar-logo">
            <a href="${pageContext.request.contextPath}/DashboardServlet">Thrift &amp; Drift</a>
        </div>

        <nav class="sidebar-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/DashboardServlet" class="nav-item active">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminListingsServlet" class="nav-item">Manage Listings</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminUsersServlet" class="nav-item">Manage Users</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminOrdersServlet" class="nav-item">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet" class="nav-item">Log Out</a></li>
            </ul>
        </nav>

        <div class="sidebar-user">
            <div class="user-info">
                <span class="user-name">${adminName}</span>
                <span class="user-role">Admin</span>
            </div>
        </div>
    </aside>

    <div class="main-content">
        <header class="topbar">
            <h1 class="topbar-title">Dashboard Overview</h1>
        </header>

        <main class="page-body">
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <div class="stat-cards">
                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Total Users</span>
                    </div>
                    <div class="stat-value">${totalUsers}</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Products in Shop</span>
                    </div>
                    <div class="stat-value">${totalProducts}</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Orders</span>
                    </div>
                    <div class="stat-value">${totalOrders}</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Pending Submissions</span>
                    </div>
                    <div class="stat-value">${pendingSubmissions}</div>
                </div>
            </div>

            <div class="bottom-row">
                <div class="chart-card">
                    <h2 class="chart-card-title">Admin Work To Do</h2>
                    <p>Review seller submissions, approve good items, set final prices, and list approved products in the shop.</p>
                    <br>
                    <a href="${pageContext.request.contextPath}/AdminListingsServlet" class="btn-primary">Review Listings</a>
                </div>

                <div class="activity-card">
                    <h2 class="activity-title">Coursework Coverage</h2>
                    <p>This admin backend supports role-based access, database CRUD, MVC servlet flow, validation messages, and MySQL data management.</p>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
