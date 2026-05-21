<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Messages</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageusers.css">
</head>
<body>
<div class="admin-shell">
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/DashboardServlet">Dashboard</a>
            <a href="${pageContext.request.contextPath}/AdminListingsServlet">Manage Listings</a>
            <a href="${pageContext.request.contextPath}/AdminUsersServlet">Manage Users</a>
            <a href="${pageContext.request.contextPath}/AdminOrdersServlet">Orders</a>
            <a href="${pageContext.request.contextPath}/AdminContactMessagesServlet" class="active">Contact Messages</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
        </nav>
    </aside>

    <div class="main-area">
        <header class="topbar">
            <h1 class="topbar-title">Contact Messages</h1>
        </header>

        <main class="page-body">
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <div class="table-card">
                <table class="data-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Message</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="message" items="${messages}">
                        <tr>
                            <td>MSG-${message.id}</td>
                            <td>${message.name}</td>
                            <td>${message.email}</td>
                            <td>${message.phone}</td>
                            <td>${message.message}</td>
                            <td>${message.createdAt}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty messages}">
                        <tr>
                            <td colspan="6">No contact messages yet.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>
