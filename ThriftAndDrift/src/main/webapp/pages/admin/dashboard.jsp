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
                <li><a href="${pageContext.request.contextPath}/AdminContactMessagesServlet" class="nav-item">Contact Messages</a></li>
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
            <div>
                <h1 class="topbar-title">Admin Dashboard</h1>
                <p class="topbar-subtitle">Welcome back, ${adminName}. Here is what needs attention.</p>
            </div>
        </header>

        <main class="page-body">
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <div class="stat-cards">
                <a class="stat-card" href="${pageContext.request.contextPath}/AdminUsersServlet">
                    <div class="stat-card-header">
                        <span class="stat-label">Total Users</span>
                    </div>
                    <div class="stat-value">${totalUsers}</div>
                    <p class="stat-note">Registered accounts</p>
                </a>

                <a class="stat-card" href="${pageContext.request.contextPath}/AdminListingsServlet">
                    <div class="stat-card-header">
                        <span class="stat-label">Products in Shop</span>
                    </div>
                    <div class="stat-value">${totalProducts}</div>
                    <p class="stat-note">Live thrift listings</p>
                </a>

                <a class="stat-card" href="${pageContext.request.contextPath}/AdminOrdersServlet">
                    <div class="stat-card-header">
                        <span class="stat-label">Orders</span>
                    </div>
                    <div class="stat-value">${totalOrders}</div>
                    <p class="stat-note">Customer checkouts</p>
                </a>

                <a class="stat-card" href="${pageContext.request.contextPath}/AdminListingsServlet">
                    <div class="stat-card-header">
                        <span class="stat-label">Pending Listings</span>
                    </div>
                    <div class="stat-value">${pendingSubmissions}</div>
                    <p class="stat-note">Seller items to review</p>
                </a>

                <a class="stat-card" href="${pageContext.request.contextPath}/AdminContactMessagesServlet">
                    <div class="stat-card-header">
                        <span class="stat-label">Contact Messages</span>
                    </div>
                    <div class="stat-value">${contactMessages}</div>
                    <p class="stat-note">Customer questions</p>
                </a>
            </div>

            <div class="dashboard-grid">
                <section class="dashboard-panel">
                    <h2 class="panel-title">Today's Admin Tasks</h2>
                    <div class="task-list">
                        <a href="${pageContext.request.contextPath}/AdminListingsServlet" class="task-item">
                            <strong>Review seller submissions</strong>
                            <span>Approve good items, reject unsuitable ones, and list approved products.</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/AdminOrdersServlet" class="task-item">
                            <strong>Update order statuses</strong>
                            <span>Move orders through Processing, Ready for Pickup, Delivered, or Cancelled.</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/AdminContactMessagesServlet" class="task-item">
                            <strong>Read contact messages</strong>
                            <span>Check questions sent from the home page contact form.</span>
                        </a>
                    </div>
                </section>

                <section class="dashboard-panel recent-panel">
                    <h2 class="panel-title">Recent Activity</h2>
                    <div class="activity-list">
                        <a href="${pageContext.request.contextPath}/AdminListingsServlet" class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <p class="activity-desc">${pendingSubmissions} seller submissions waiting for review</p>
                                <p class="activity-time">Manage Listings</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/AdminOrdersServlet" class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <p class="activity-desc">${totalOrders} orders recorded in the system</p>
                                <p class="activity-time">Orders</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/AdminContactMessagesServlet" class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <p class="activity-desc">${contactMessages} contact messages from customers</p>
                                <p class="activity-time">Contact Messages</p>
                            </div>
                        </a>
                    </div>
                </section>
            </div>
        </main>
    </div>
</div>
</body>
</html>
