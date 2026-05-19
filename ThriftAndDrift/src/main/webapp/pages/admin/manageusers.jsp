<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageusers.css">
</head>
<body>
<div class="admin-shell">
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/DashboardServlet">Dashboard</a>
            <a href="${pageContext.request.contextPath}/AdminListingsServlet">Manage Listings</a>
            <a href="${pageContext.request.contextPath}/AdminUsersServlet" class="active">Manage Users</a>
            <a href="${pageContext.request.contextPath}/AdminOrdersServlet">Orders</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
        </nav>
    </aside>

    <div class="main-area">
        <header class="topbar">
            <h1 class="topbar-title">Manage Users</h1>
        </header>

        <main class="page-body">
            <c:if test="${not empty success}">
                <p class="success-message">${success}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <div class="table-card">
                <table class="data-table">
                    <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>USR-${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td><span class="badge badge-active">${user.role}</span></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/AdminUsersServlet" method="post">
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <button class="btn-approve" type="submit" name="action" value="makeAdmin">Make Admin</button>
                                    <button class="btn-primary" type="submit" name="action" value="makeUser">Make User</button>
                                    <button class="btn-reject" type="submit" name="action" value="delete">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="5">No users found.</td>
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
