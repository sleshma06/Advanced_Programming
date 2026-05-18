<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift &amp; Drift - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>

<!-- ========== SIDEBAR ========== -->
<div class="sidebar">
    <div class="sidebar-logo">
        <h1>Thrift &amp; Drift</h1>
    </div>

    <nav class="sidebar-nav">
        <a href="?section=overview" class="nav-item <%= "overview".equals(request.getParameter("section")) || request.getParameter("section") == null ? "active" : "" %>">
            <span class="nav-label">&#9783; Dashboard</span>
        </a>
        <a href="?section=listings" class="nav-item <%= "listings".equals(request.getParameter("section")) ? "active" : "" %>">
            <span class="nav-label">&#9741; Manage Listings</span>
        </a>
        <a href="?section=users" class="nav-item <%= "users".equals(request.getParameter("section")) ? "active" : "" %>">
            <span class="nav-label">&#9786; Manage Users</span>
        </a>
        <a href="?section=reports" class="nav-item <%= "reports".equals(request.getParameter("section")) ? "active" : "" %>">
            <span class="nav-label">&#9741; Reports &amp; Analytics</span>
        </a>
    </nav>

    <!-- Admin info at bottom of sidebar -->
    <div class="sidebar-footer">
        <div class="admin-avatar">A</div>
        <div class="admin-info">
            <!-- In real version: <%= session.getAttribute("adminName") %> -->
            <span class="admin-name">Admin User</span>
            <span class="admin-role">Superadmin</span>
        </div>
    </div>
</div>

<!-- ========== MAIN CONTENT ========== -->
<div class="main-content">

    <!-- Top bar -->
    <div class="topbar">
        <%
            // Determine which section to show based on URL parameter
            String section = request.getParameter("section");
            if (section == null) section = "overview";

            // Set the page title based on section
            String pageTitle = "Dashboard Overview";
            if (section.equals("listings")) pageTitle = "Manage Listings";
            else if (section.equals("users")) pageTitle = "Manage Users";
            else if (section.equals("reports")) pageTitle = "Reports & Analytics";
            else if (section.equals("addItem")) pageTitle = "Add New Item";
            else if (section.equals("editItem")) pageTitle = "Edit Item";
            else if (section.equals("editUser")) pageTitle = "Edit User";
        %>
        <h2 class="page-title"><%= pageTitle %></h2>
        <div class="topbar-right">
            <div class="search-box">
                <span class="search-icon">&#128269;</span>
                <input type="text" placeholder="Search...">
            </div>
            <div class="notif-bell">
                &#128276;
                <span class="notif-dot"></span>
            </div>
            <div class="topbar-avatar">A</div>
        </div>
    </div>

    <!-- Show success or error message if passed from servlet -->
    <% String msg = request.getParameter("msg"); %>
    <% if (msg != null && !msg.isEmpty()) { %>
        <div class="alert-box"><%= msg %></div>
    <% } %>


    <!-- ===== OVERVIEW SECTION ===== -->
    <% if (section.equals("overview")) { %>
    <div class="section">

        <!-- Stat cards row -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">TOTAL ITEMS LISTED</span>
                    <span class="stat-icon">&#127991;</span>
                </div>
                <!-- In real version: replace 12,450 with <%= totalItems %> from servlet -->
                <div class="stat-number">12,450</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">PENDING APPROVALS</span>
                    <span class="stat-icon">&#9203;</span>
                </div>
                <div class="stat-number">342</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">ACTIVE USERS</span>
                    <span class="stat-icon">&#128101;</span>
                </div>
                <div class="stat-number">8,901</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">ITEMS SOLD THIS MONTH</span>
                    <span class="stat-icon">&#128203;</span>
                </div>
                <div class="stat-number">1,204</div>
            </div>
        </div>

        <!-- Chart + Activity row -->
        <div class="bottom-row">

            <!-- Bar chart built with pure CSS - no JavaScript or library used -->
            <div class="chart-card">
                <h3 class="chart-title">Sales vs Listings &mdash; last 6 months</h3>
                <div class="chart-legend">
                    <span class="legend-dot red"></span><span>Sales</span>
                    <span class="legend-dot beige"></span><span>Listings</span>
                </div>
                <div class="bar-chart">
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:80px;"></div>
                            <div class="bar beige" style="height:120px;"></div>
                        </div>
                        <span class="bar-label">Jan</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:100px;"></div>
                            <div class="bar beige" style="height:140px;"></div>
                        </div>
                        <span class="bar-label">Feb</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:65px;"></div>
                            <div class="bar beige" style="height:100px;"></div>
                        </div>
                        <span class="bar-label">Mar</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:130px;"></div>
                            <div class="bar beige" style="height:160px;"></div>
                        </div>
                        <span class="bar-label">Apr</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:155px;"></div>
                            <div class="bar beige" style="height:170px;"></div>
                        </div>
                        <span class="bar-label">May</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height:140px;"></div>
                            <div class="bar beige" style="height:155px;"></div>
                        </div>
                        <span class="bar-label">Jun</span>
                    </div>
                </div>
                <div class="chart-actions">
                    <a href="?section=users" class="btn btn-red">&#10003; Approve Users</a>
                    <a href="?section=listings" class="btn btn-outline">+ Add New Item</a>
                </div>
            </div>

            <!-- Recent Activity feed -->
            <div class="activity-card">
                <h3 class="activity-title">Recent Activity</h3>
                <ul class="activity-list">
                    <!-- In real version: loop through activityList from servlet -->
                    <li class="activity-item">
                        <span class="activity-dot"></span>
                        <div class="activity-text">
                            <p>New user registered: <strong>sarah_vintage</strong></p>
                            <span class="activity-time">2 mins ago</span>
                        </div>
                    </li>
                    <li class="activity-item">
                        <span class="activity-dot"></span>
                        <div class="activity-text">
                            <p>Item approved: <strong>90s Levi's 501</strong></p>
                            <span class="activity-time">15 mins ago</span>
                        </div>
                    </li>
                    <li class="activity-item">
                        <span class="activity-dot"></span>
                        <div class="activity-text">
                            <p>Item sold: <strong>Oversized Wool Blazer</strong></p>
                            <span class="activity-time">1 hour ago</span>
                        </div>
                    </li>
                    <li class="activity-item">
                        <span class="activity-dot"></span>
                        <div class="activity-text">
                            <p>Item rejected: <strong>Fake Gucci Belt</strong></p>
                            <span class="activity-time">3 hours ago</span>
                        </div>
                    </li>
                    <li class="activity-item">
                        <span class="activity-dot"></span>
                        <div class="activity-text">
                            <p>New user registered: <strong>vintage_king</strong></p>
                            <span class="activity-time">5 hours ago</span>
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </div>
    <% } %>


    <!-- ===== MANAGE LISTINGS ===== -->
    <% if (section.equals("listings")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Manage Listings</h3>
            <a href="?section=addItem" class="btn btn-red">+ Add New Item</a>
        </div>

        <!-- Filter form - uses GET so no JS needed, page reloads with filtered results -->
        <form method="get" action="" class="filter-bar">
            <input type="hidden" name="section" value="listings">
            <input type="text" name="search" placeholder="Search listings..." class="filter-input"
                   value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <select name="category" class="filter-select">
                <option value="">All Categories</option>
                <option <%= "Tops".equals(request.getParameter("category")) ? "selected" : "" %>>Tops</option>
                <option <%= "Bottoms".equals(request.getParameter("category")) ? "selected" : "" %>>Bottoms</option>
                <option <%= "Outerwear".equals(request.getParameter("category")) ? "selected" : "" %>>Outerwear</option>
                <option <%= "Accessories".equals(request.getParameter("category")) ? "selected" : "" %>>Accessories</option>
                <option <%= "Footwear".equals(request.getParameter("category")) ? "selected" : "" %>>Footwear</option>
            </select>
            <select name="status" class="filter-select">
                <option value="">All Status</option>
                <option <%= "Active".equals(request.getParameter("status")) ? "selected" : "" %>>Active</option>
                <option <%= "Pending".equals(request.getParameter("status")) ? "selected" : "" %>>Pending</option>
                <option <%= "Sold".equals(request.getParameter("status")) ? "selected" : "" %>>Sold</option>
            </select>
            <button type="submit" class="btn btn-outline">Search</button>
        </form>

        <div class="table-wrap">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Seller</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- In real version: loop through itemList from AdminServlet -->
                    <tr>
                        <td>#001</td>
                        <td>90s Levi's 501 Jeans</td>
                        <td>Bottoms</td>
                        <td>£25.00</td>
                        <td>sarah_vintage</td>
                        <td><span class="badge green">Active</span></td>
                        <td class="action-btns">
                            <a href="?section=editItem&id=001" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteItem&id=001" class="btn-sm delete"
                               onclick="return confirm('Delete this item?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#002</td>
                        <td>Oversized Wool Blazer</td>
                        <td>Outerwear</td>
                        <td>£45.00</td>
                        <td>retro_raj</td>
                        <td><span class="badge grey">Sold</span></td>
                        <td class="action-btns">
                            <a href="?section=editItem&id=002" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteItem&id=002" class="btn-sm delete"
                               onclick="return confirm('Delete this item?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#003</td>
                        <td>Vintage Band Tee - Nirvana</td>
                        <td>Tops</td>
                        <td>£18.00</td>
                        <td>grunge_goddess</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <a href="?section=editItem&id=003" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteItem&id=003" class="btn-sm delete"
                               onclick="return confirm('Delete this item?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#004</td>
                        <td>Leather Chelsea Boots</td>
                        <td>Footwear</td>
                        <td>£60.00</td>
                        <td>bootleg_bob</td>
                        <td><span class="badge green">Active</span></td>
                        <td class="action-btns">
                            <a href="?section=editItem&id=004" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteItem&id=004" class="btn-sm delete"
                               onclick="return confirm('Delete this item?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#005</td>
                        <td>Y2K Butterfly Clip Set</td>
                        <td>Accessories</td>
                        <td>£8.00</td>
                        <td>y2k_yasmin</td>
                        <td><span class="badge green">Active</span></td>
                        <td class="action-btns">
                            <a href="?section=editItem&id=005" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteItem&id=005" class="btn-sm delete"
                               onclick="return confirm('Delete this item?')">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>


    <!-- ===== ADD ITEM FORM ===== -->
    <% if (section.equals("addItem")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Add New Item</h3>
            <a href="?section=listings" class="btn btn-outline">&larr; Back</a>
        </div>
        <div class="form-card">
            <!-- Backend team connects this form to AdminServlet -->
            <form method="post" action="AdminServlet" class="item-form">
                <input type="hidden" name="action" value="addItem">
                <div class="form-group">
                    <label>Item Name</label>
                    <input type="text" name="itemName" placeholder="e.g. Vintage Levi Jacket"
                           class="form-input" required>
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <select name="category" class="form-input" required>
                        <option value="">Select category</option>
                        <option>Tops</option>
                        <option>Bottoms</option>
                        <option>Outerwear</option>
                        <option>Accessories</option>
                        <option>Footwear</option>
                    </select>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Price (£)</label>
                        <input type="number" name="price" placeholder="0.00"
                               step="0.01" min="0" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label>Condition</label>
                        <select name="itemCondition" class="form-input">
                            <option>Excellent</option>
                            <option>Good</option>
                            <option>Fair</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" placeholder="Describe the item..."
                              class="form-input form-textarea"></textarea>
                </div>
                <div class="form-footer">
                    <a href="?section=listings" class="btn btn-outline">Cancel</a>
                    <button type="submit" class="btn btn-red">Save Item</button>
                </div>
            </form>
        </div>
    </div>
    <% } %>


    <!-- ===== EDIT ITEM FORM ===== -->
    <% if (section.equals("editItem")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Edit Item</h3>
            <a href="?section=listings" class="btn btn-outline">&larr; Back</a>
        </div>
        <div class="form-card">
            <form method="post" action="AdminServlet" class="item-form">
                <input type="hidden" name="action" value="updateItem">
                <input type="hidden" name="itemId" value="<%= request.getParameter("id") %>">
                <div class="form-group">
                    <label>Item Name</label>
                    <!-- In real version: value="${item.name}" set by servlet -->
                    <input type="text" name="itemName" value="90s Levi's 501 Jeans"
                           class="form-input" required>
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <select name="category" class="form-input">
                        <option>Tops</option>
                        <option selected>Bottoms</option>
                        <option>Outerwear</option>
                        <option>Accessories</option>
                        <option>Footwear</option>
                    </select>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Price (£)</label>
                        <input type="number" name="price" value="25.00" step="0.01" class="form-input">
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" class="form-input">
                            <option selected>Active</option>
                            <option>Pending</option>
                            <option>Sold</option>
                        </select>
                    </div>
                </div>
                <div class="form-footer">
                    <a href="?section=listings" class="btn btn-outline">Cancel</a>
                    <button type="submit" class="btn btn-red">Update Item</button>
                </div>
            </form>
        </div>
    </div>
    <% } %>


    <!-- ===== MANAGE USERS ===== -->
    <% if (section.equals("users")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Manage Users</h3>
        </div>

        <!-- Pending users warning box -->
        <div class="pending-box">
            <span class="pending-icon">&#9203;</span>
            <!-- In real version: <%= pendingCount %> -->
            <span><strong>3 users</strong> are waiting for approval.</span>
            <a href="?section=users&status=Pending" class="btn btn-red">View Pending</a>
        </div>

        <!-- Filter form -->
        <form method="get" action="" class="filter-bar">
            <input type="hidden" name="section" value="users">
            <input type="text" name="search" placeholder="Search users..." class="filter-input"
                   value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <select name="status" class="filter-select">
                <option value="">All Status</option>
                <option <%= "Approved".equals(request.getParameter("status")) ? "selected" : "" %>>Approved</option>
                <option <%= "Pending".equals(request.getParameter("status")) ? "selected" : "" %>>Pending</option>
                <option <%= "Rejected".equals(request.getParameter("status")) ? "selected" : "" %>>Rejected</option>
            </select>
            <button type="submit" class="btn btn-outline">Search</button>
        </form>

        <div class="table-wrap">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Joined</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- In real version: loop through userList from AdminServlet -->
                    <tr>
                        <td>#U01</td>
                        <td>Sarah Johnson</td>
                        <td>sarah@email.com</td>
                        <td>12 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <a href="AdminServlet?action=approveUser&id=U01" class="btn-sm approve">Approve</a>
                            <a href="AdminServlet?action=rejectUser&id=U01" class="btn-sm delete"
                               onclick="return confirm('Reject this user?')">Reject</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#U02</td>
                        <td>Raj Patel</td>
                        <td>raj@email.com</td>
                        <td>10 May 2026</td>
                        <td><span class="badge green">Approved</span></td>
                        <td class="action-btns">
                            <a href="?section=editUser&id=U02" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteUser&id=U02" class="btn-sm delete"
                               onclick="return confirm('Delete this user?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#U03</td>
                        <td>Emma Clarke</td>
                        <td>emma@email.com</td>
                        <td>11 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <a href="AdminServlet?action=approveUser&id=U03" class="btn-sm approve">Approve</a>
                            <a href="AdminServlet?action=rejectUser&id=U03" class="btn-sm delete"
                               onclick="return confirm('Reject this user?')">Reject</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#U04</td>
                        <td>Marcus Lee</td>
                        <td>marcus@email.com</td>
                        <td>08 May 2026</td>
                        <td><span class="badge green">Approved</span></td>
                        <td class="action-btns">
                            <a href="?section=editUser&id=U04" class="btn-sm edit">Edit</a>
                            <a href="AdminServlet?action=deleteUser&id=U04" class="btn-sm delete"
                               onclick="return confirm('Delete this user?')">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>#U05</td>
                        <td>Yasmin Ali</td>
                        <td>yasmin@email.com</td>
                        <td>13 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <a href="AdminServlet?action=approveUser&id=U05" class="btn-sm approve">Approve</a>
                            <a href="AdminServlet?action=rejectUser&id=U05" class="btn-sm delete"
                               onclick="return confirm('Reject this user?')">Reject</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>


    <!-- ===== EDIT USER FORM ===== -->
    <% if (section.equals("editUser")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Edit User</h3>
            <a href="?section=users" class="btn btn-outline">&larr; Back</a>
        </div>
        <div class="form-card">
            <form method="post" action="AdminServlet" class="item-form">
                <input type="hidden" name="action" value="updateUser">
                <input type="hidden" name="userId" value="<%= request.getParameter("id") %>">
                <div class="form-group">
                    <label>Full Name</label>
                    <!-- In real version: value="${user.fullName}" -->
                    <input type="text" name="fullName" value="Raj Patel" class="form-input" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="raj@email.com" class="form-input" required>
                </div>
                <div class="form-group">
                    <label>Account Status</label>
                    <select name="status" class="form-input">
                        <option selected>Approved</option>
                        <option>Pending</option>
                        <option>Rejected</option>
                    </select>
                </div>
                <div class="form-footer">
                    <a href="?section=users" class="btn btn-outline">Cancel</a>
                    <button type="submit" class="btn btn-red">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
    <% } %>


    <!-- ===== REPORTS SECTION ===== -->
    <% if (section.equals("reports")) { %>
    <div class="section">
        <div class="section-header">
            <h3>Reports &amp; Analytics</h3>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">TOTAL REVENUE</span>
                    <span class="stat-icon">&#163;</span>
                </div>
                <div class="stat-number">£18,420</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">ITEMS SOLD</span>
                    <span class="stat-icon">&#127991;</span>
                </div>
                <div class="stat-number">1,204</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">AVG SALE PRICE</span>
                    <span class="stat-icon">&#9965;</span>
                </div>
                <div class="stat-number">£15.30</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">NEW USERS THIS MONTH</span>
                    <span class="stat-icon">&#128101;</span>
                </div>
                <div class="stat-number">214</div>
            </div>
        </div>

        <div class="reports-row">
            <div class="report-card">
                <h4>Top Categories by Sales</h4>
                <table class="data-table">
                    <thead>
                        <tr><th>Category</th><th>Items Sold</th><th>Revenue</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>Outerwear</td><td>312</td><td>£5,616</td></tr>
                        <tr><td>Tops</td><td>289</td><td>£3,179</td></tr>
                        <tr><td>Bottoms</td><td>241</td><td>£3,856</td></tr>
                        <tr><td>Footwear</td><td>198</td><td>£4,752</td></tr>
                        <tr><td>Accessories</td><td>164</td><td>£1,017</td></tr>
                    </tbody>
                </table>
            </div>
            <div class="report-card">
                <h4>Most Popular Items</h4>
                <table class="data-table">
                    <thead>
                        <tr><th>Item Name</th><th>Views</th><th>Sales</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>90s Levi's 501 Jeans</td><td>1,204</td><td>48</td></tr>
                        <tr><td>Leather Chelsea Boots</td><td>987</td><td>31</td></tr>
                        <tr><td>Oversized Wool Blazer</td><td>856</td><td>29</td></tr>
                        <tr><td>Vintage Nirvana Tee</td><td>743</td><td>24</td></tr>
                        <tr><td>Y2K Butterfly Clips</td><td>601</td><td>19</td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Monthly revenue bar chart - pure CSS, no JS -->
        <div class="chart-card" style="margin-top:24px;">
            <h3 class="chart-title">Monthly Revenue Overview</h3>
            <div class="chart-legend">
                <span class="legend-dot red"></span><span>Revenue</span>
            </div>
            <div class="bar-chart">
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:90px;"></div></div>
                    <span class="bar-label">Jan</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:110px;"></div></div>
                    <span class="bar-label">Feb</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:75px;"></div></div>
                    <span class="bar-label">Mar</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:145px;"></div></div>
                    <span class="bar-label">Apr</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:160px;"></div></div>
                    <span class="bar-label">May</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height:130px;"></div></div>
                    <span class="bar-label">Jun</span>
                </div>
            </div>
        </div>
    </div>
    <% } %>

</div><!-- end main-content -->

</body>
</html>
