<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Orders</title>
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
            <a href="${pageContext.request.contextPath}/AdminOrdersServlet" class="active">Orders</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
        </nav>
    </aside>

    <div class="main-area">
        <header class="topbar">
            <h1 class="topbar-title">Manage Orders</h1>
        </header>

        <main class="page-body">
            <c:if test="${not empty success}">
                <p class="success-message">${success}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>


            <!-- ===== KPI STAT CARDS ===== -->
            <div class="stats-grid">

                <!-- Total Revenue -->
                <div class="stat-card">
                    <div class="stat-label">Total Revenue</div>
                
                    <div class="stat-value">Rs 16,558,500</div>
                    <div class="stat-delta">
                        <span class="delta-up">+12%</span> vs last month
                    </div>
                </div>

                <!-- Most Popular Category -->
                <div class="stat-card">
                    <div class="stat-label">Most Popular Category</div>
               
                    <div class="stat-value big-text">Vintage Outerwear</div>
                    <div class="stat-delta">
                        <span class="delta-trend">Trending</span> vs last month
                    </div>
                </div>

                <!-- Avg. Selling Price -->
                <div class="stat-card">
                    <div class="stat-label">Avg. Selling Price</div>
                
                    <div class="stat-value">Rs 6,450</div>
                    <div class="stat-delta">
                        <span class="delta-down">-2%</span> vs last month
                    </div>
                </div>

                <!-- Return Rate -->
                <div class="stat-card">
                    <div class="stat-label">Return Rate</div>
                  
                    <div class="stat-value">2.4%</div>
                    <div class="stat-delta">
                        <span class="delta-down">-0.5%</span> vs last month
                    </div>
                </div>

            <div class="table-card">
                <table class="data-table">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Payment</th>
                        <th>Delivery</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>ORD-${order.id}</td>
                            <td>${order.customerName}</td>
                            <td>Rs. ${order.totalAmount}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.deliveryType}</td>
                            <td><span class="badge badge-pending">${order.orderStatus}</span></td>
                            <td>${order.createdAt}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/AdminOrdersServlet" method="post">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <select name="orderStatus">
                                        <option value="Processing">Processing</option>
                                        <option value="Ready for Pickup">Ready for Pickup</option>
                                        <option value="Delivered">Delivered</option>
                                        <option value="Cancelled">Cancelled</option>
                                    </select>
                                    <button class="btn-primary" type="submit">Update</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>


                    <c:if test="${empty orders}">
                        <tr>
                            <td colspan="8">No orders found.</td>
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
