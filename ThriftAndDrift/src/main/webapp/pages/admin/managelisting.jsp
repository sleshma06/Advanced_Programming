<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Listings</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managelisting.css">
</head>
<body>
<div class="admin-shell">
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/DashboardServlet">Dashboard</a>
            <a href="${pageContext.request.contextPath}/AdminListingsServlet" class="active">Manage Listings</a>
            <a href="${pageContext.request.contextPath}/AdminUsersServlet">Manage Users</a>
            <a href="${pageContext.request.contextPath}/AdminOrdersServlet">Orders</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
        </nav>
    </aside>

    <div class="main-area">
        <header class="topbar">
            <h1 class="topbar-title">Manage Seller Submissions</h1>
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
                        <th>ID</th>
                        <th>Seller</th>
                        <th>Item</th>
                        <th>Category</th>
                        <th>Condition</th>
                        <th>Estimated</th>
                        <th>Final Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${submissions}">
                        <tr>
                            <td>SUB-${item.id}</td>
                            <td>${item.sellerName}</td>
                            <td>
                                <strong>${item.itemName}</strong><br>
                                <small>${item.size} | ${item.dropoffDate} ${item.dropoffTimeSlot}</small>
                            </td>
                            <td>${item.category}</td>
                            <td>${item.condition}</td>
                            <td>Rs. ${item.estimatedPrice}</td>
                            <td>Rs. ${item.finalPrice}</td>
                            <td><span class="badge badge-pending">${item.status}</span></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/AdminListingsServlet" method="post">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <input type="number" step="0.01" name="finalPrice" placeholder="Final price">
                                    <input type="text" name="adminNote" placeholder="Admin note">
                                    <button class="btn-approve" type="submit" name="action" value="approve">Approve</button>
                                    <button class="btn-reject" type="submit" name="action" value="reject">Reject</button>
                                    <button class="btn-primary" type="submit" name="action" value="list">List</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty submissions}">
                        <tr>
                            <td colspan="9">No seller submissions found.</td>
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
