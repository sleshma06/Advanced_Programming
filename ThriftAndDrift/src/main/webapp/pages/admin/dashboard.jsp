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
        <!-- Each nav item has an icon (using simple text symbols) and a label -->
        <a href="#" class="nav-item active" onclick="showSection('overview')">
            <span class="nav-icon">&#9783;</span>
            <span class="nav-label">Dashboard</span>
        </a>
        <a href="#" class="nav-item" onclick="showSection('listings')">
            <span class="nav-icon">&#9741;</span>
            <span class="nav-label">Manage Listings</span>
        </a>
        <a href="#" class="nav-item" onclick="showSection('users')">
            <span class="nav-icon">&#9786;</span>
            <span class="nav-label">Manage Users</span>
        </a>
        <a href="#" class="nav-item" onclick="showSection('reports')">
            <span class="nav-icon">&#9741;</span>
            <span class="nav-label">Reports &amp; Analytics</span>
        </a>
    </nav>

    <!-- Admin info at the bottom of sidebar -->
    <div class="sidebar-footer">
        <div class="admin-avatar">A</div>
        <div class="admin-info">
            <span class="admin-name">Admin User</span>
            <span class="admin-role">Superadmin</span>
        </div>
    </div>
</div>

<!-- ========== MAIN CONTENT AREA ========== -->
<div class="main-content">

    <!-- Top bar with title, search, and notification bell -->
    <div class="topbar">
        <h2 class="page-title" id="page-title">Dashboard Overview</h2>
        <div class="topbar-right">
            <div class="search-box">
                <span class="search-icon">&#128269;</span>
                <input type="text" placeholder="Search..." id="searchInput">
            </div>
            <div class="notif-bell">&#128276;
                <span class="notif-dot"></span>
            </div>
            <div class="topbar-avatar">A</div>
        </div>
    </div>

    <!-- ===== SECTION 1: OVERVIEW (default shown) ===== -->
    <div id="section-overview" class="section active">

        <!-- Stat cards row -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">TOTAL ITEMS LISTED</span>
                    <span class="stat-icon">&#127991;</span>
                </div>
                <!-- In real version: <%= totalItems %> -->
                <div class="stat-number">12,450</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">PENDING APPROVALS</span>
                    <span class="stat-icon">&#9203;</span>
                </div>
                <!-- In real version: <%= pendingApprovals %> -->
                <div class="stat-number">342</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">ACTIVE USERS</span>
                    <span class="stat-icon">&#128101;</span>
                </div>
                <!-- In real version: <%= activeUsers %> -->
                <div class="stat-number">8,901</div>
            </div>
            <div class="stat-card">
                <div class="stat-top">
                    <span class="stat-label">ITEMS SOLD THIS MONTH</span>
                    <span class="stat-icon">&#128203;</span>
                </div>
                <!-- In real version: <%= itemsSoldThisMonth %> -->
                <div class="stat-number">1,204</div>
            </div>
        </div>

        <!-- Chart + Recent Activity row -->
        <div class="bottom-row">

            <!-- Bar chart (built with CSS/JS, no library needed) -->
            <div class="chart-card">
                <h3 class="chart-title">Sales vs Listings &mdash; last 6 months</h3>
                <div class="chart-legend">
                    <span class="legend-dot red"></span><span>Sales</span>
                    <span class="legend-dot beige"></span><span>Listings</span>
                </div>
                <div class="bar-chart">
                    <!-- Each month has two bars: sales (red) and listings (beige) -->
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 80px;"></div>
                            <div class="bar beige" style="height: 120px;"></div>
                        </div>
                        <span class="bar-label">Jan</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 100px;"></div>
                            <div class="bar beige" style="height: 140px;"></div>
                        </div>
                        <span class="bar-label">Feb</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 65px;"></div>
                            <div class="bar beige" style="height: 100px;"></div>
                        </div>
                        <span class="bar-label">Mar</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 130px;"></div>
                            <div class="bar beige" style="height: 160px;"></div>
                        </div>
                        <span class="bar-label">Apr</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 155px;"></div>
                            <div class="bar beige" style="height: 170px;"></div>
                        </div>
                        <span class="bar-label">May</span>
                    </div>
                    <div class="bar-group">
                        <div class="bar-wrap">
                            <div class="bar red" style="height: 140px;"></div>
                            <div class="bar beige" style="height: 155px;"></div>
                        </div>
                        <span class="bar-label">Jun</span>
                    </div>
                </div>

                <!-- Action buttons at bottom of chart -->
                <div class="chart-actions">
                    <a href="#" class="btn btn-red" onclick="showSection('users'); return false;">
                        &#10003; Approve Users
                    </a>
                    <a href="#" class="btn btn-outline" onclick="showSection('listings'); return false;">
                        + Add New Item
                    </a>
                </div>
            </div>

            <!-- Recent Activity feed -->
            <div class="activity-card">
                <h3 class="activity-title">Recent Activity</h3>
                <ul class="activity-list">
                    <!-- In real version these would be looped from DB -->
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

    <!-- ===== SECTION 2: MANAGE LISTINGS ===== -->
    <div id="section-listings" class="section">
        <div class="section-header">
            <h3>Manage Listings</h3>
            <button class="btn btn-red" onclick="openModal('addItemModal')">+ Add New Item</button>
        </div>

        <!-- Search and filter bar -->
        <div class="filter-bar">
            <input type="text" placeholder="Search listings..." class="filter-input" oninput="filterTable(this, 'listings-table')">
            <select class="filter-select">
                <option value="">All Categories</option>
                <option>Tops</option>
                <option>Bottoms</option>
                <option>Outerwear</option>
                <option>Accessories</option>
                <option>Footwear</option>
            </select>
            <select class="filter-select">
                <option value="">All Status</option>
                <option>Active</option>
                <option>Pending</option>
                <option>Sold</option>
            </select>
        </div>

        <!-- Listings table -->
        <div class="table-wrap">
            <table class="data-table" id="listings-table">
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
                    <!-- In real version: loop through items from DB using JSTL or scriptlets -->
                    <tr>
                        <td>#001</td>
                        <td>90s Levi's 501 Jeans</td>
                        <td>Bottoms</td>
                        <td>£25.00</td>
                        <td>sarah_vintage</td>
                        <td><span class="badge green">Active</span></td>
                        <td class="action-btns">
                            <button class="btn-sm edit" onclick="openModal('editItemModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('item', '#001')">Delete</button>
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
                            <button class="btn-sm edit" onclick="openModal('editItemModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('item', '#002')">Delete</button>
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
                            <button class="btn-sm edit" onclick="openModal('editItemModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('item', '#003')">Delete</button>
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
                            <button class="btn-sm edit" onclick="openModal('editItemModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('item', '#004')">Delete</button>
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
                            <button class="btn-sm edit" onclick="openModal('editItemModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('item', '#005')">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ===== SECTION 3: MANAGE USERS ===== -->
    <div id="section-users" class="section">
        <div class="section-header">
            <h3>Manage Users</h3>
        </div>

        <!-- Pending approvals highlighted box -->
        <div class="pending-box">
            <span class="pending-icon">&#9203;</span>
            <span><strong>3 users</strong> are waiting for approval.</span>
            <button class="btn btn-red" onclick="filterPending()">View Pending</button>
        </div>

        <div class="filter-bar">
            <input type="text" placeholder="Search users..." class="filter-input" oninput="filterTable(this, 'users-table')">
            <select class="filter-select" onchange="filterByStatus(this, 'users-table')">
                <option value="">All Status</option>
                <option value="Approved">Approved</option>
                <option value="Pending">Pending</option>
                <option value="Rejected">Rejected</option>
            </select>
        </div>

        <div class="table-wrap">
            <table class="data-table" id="users-table">
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
                    <!-- In real version: loop from DB -->
                    <tr>
                        <td>#U01</td>
                        <td>Sarah Johnson</td>
                        <td>sarah@email.com</td>
                        <td>12 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <button class="btn-sm approve" onclick="approveUser(this)">Approve</button>
                            <button class="btn-sm delete" onclick="rejectUser(this)">Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#U02</td>
                        <td>Raj Patel</td>
                        <td>raj@email.com</td>
                        <td>10 May 2026</td>
                        <td><span class="badge green">Approved</span></td>
                        <td class="action-btns">
                            <button class="btn-sm edit" onclick="openModal('editUserModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('user', '#U02')">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#U03</td>
                        <td>Emma Clarke</td>
                        <td>emma@email.com</td>
                        <td>11 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <button class="btn-sm approve" onclick="approveUser(this)">Approve</button>
                            <button class="btn-sm delete" onclick="rejectUser(this)">Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#U04</td>
                        <td>Marcus Lee</td>
                        <td>marcus@email.com</td>
                        <td>08 May 2026</td>
                        <td><span class="badge green">Approved</span></td>
                        <td class="action-btns">
                            <button class="btn-sm edit" onclick="openModal('editUserModal')">Edit</button>
                            <button class="btn-sm delete" onclick="confirmDelete('user', '#U04')">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#U05</td>
                        <td>Yasmin Ali</td>
                        <td>yasmin@email.com</td>
                        <td>13 May 2026</td>
                        <td><span class="badge yellow">Pending</span></td>
                        <td class="action-btns">
                            <button class="btn-sm approve" onclick="approveUser(this)">Approve</button>
                            <button class="btn-sm delete" onclick="rejectUser(this)">Reject</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ===== SECTION 4: REPORTS & ANALYTICS ===== -->
    <div id="section-reports" class="section">
        <div class="section-header">
            <h3>Reports &amp; Analytics</h3>
        </div>

        <!-- Summary stat cards for reports page -->
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

        <!-- Two report tables side by side -->
        <div class="reports-row">

            <!-- Top selling categories -->
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

            <!-- Most popular items -->
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

        <!-- Bar chart for reports page (sales by month) -->
        <div class="chart-card" style="margin-top: 24px;">
            <h3 class="chart-title">Monthly Revenue Overview</h3>
            <div class="chart-legend">
                <span class="legend-dot red"></span><span>Revenue</span>
            </div>
            <div class="bar-chart">
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 90px;"></div></div>
                    <span class="bar-label">Jan</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 110px;"></div></div>
                    <span class="bar-label">Feb</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 75px;"></div></div>
                    <span class="bar-label">Mar</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 145px;"></div></div>
                    <span class="bar-label">Apr</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 160px;"></div></div>
                    <span class="bar-label">May</span>
                </div>
                <div class="bar-group">
                    <div class="bar-wrap"><div class="bar red" style="height: 130px;"></div></div>
                    <span class="bar-label">Jun</span>
                </div>
            </div>
        </div>
    </div>

</div><!-- end main-content -->


<!-- ========== MODALS ========== -->

<!-- Add Item Modal -->
<div id="addItemModal" class="modal-overlay" onclick="closeModalOutside(event, 'addItemModal')">
    <div class="modal">
        <div class="modal-header">
            <h3>Add New Item</h3>
            <button class="modal-close" onclick="closeModal('addItemModal')">&times;</button>
        </div>
        <div class="modal-body">
            <!-- Form fields - backend team connects these to a servlet -->
            <div class="form-group">
                <label>Item Name</label>
                <input type="text" placeholder="e.g. Vintage Levi Jacket" class="form-input">
            </div>
            <div class="form-group">
                <label>Category</label>
                <select class="form-input">
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
                    <input type="number" placeholder="0.00" class="form-input">
                </div>
                <div class="form-group">
                    <label>Condition</label>
                    <select class="form-input">
                        <option>Excellent</option>
                        <option>Good</option>
                        <option>Fair</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea placeholder="Describe the item..." class="form-input form-textarea"></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline" onclick="closeModal('addItemModal')">Cancel</button>
            <button class="btn btn-red">Save Item</button>
        </div>
    </div>
</div>

<!-- Edit Item Modal (same structure, backend fills values) -->
<div id="editItemModal" class="modal-overlay" onclick="closeModalOutside(event, 'editItemModal')">
    <div class="modal">
        <div class="modal-header">
            <h3>Edit Item</h3>
            <button class="modal-close" onclick="closeModal('editItemModal')">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Item Name</label>
                <input type="text" value="90s Levi's 501 Jeans" class="form-input">
            </div>
            <div class="form-group">
                <label>Category</label>
                <select class="form-input">
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
                    <input type="number" value="25.00" class="form-input">
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <select class="form-input">
                        <option selected>Active</option>
                        <option>Pending</option>
                        <option>Sold</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline" onclick="closeModal('editItemModal')">Cancel</button>
            <button class="btn btn-red">Update Item</button>
        </div>
    </div>
</div>

<!-- Edit User Modal -->
<div id="editUserModal" class="modal-overlay" onclick="closeModalOutside(event, 'editUserModal')">
    <div class="modal">
        <div class="modal-header">
            <h3>Edit User</h3>
            <button class="modal-close" onclick="closeModal('editUserModal')">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" value="Raj Patel" class="form-input">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" value="raj@email.com" class="form-input">
            </div>
            <div class="form-group">
                <label>Account Status</label>
                <select class="form-input">
                    <option selected>Approved</option>
                    <option>Pending</option>
                    <option>Rejected</option>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline" onclick="closeModal('editUserModal')">Cancel</button>
            <button class="btn btn-red">Save Changes</button>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal-overlay" onclick="closeModalOutside(event, 'deleteModal')">
    <div class="modal modal-sm">
        <div class="modal-header">
            <h3>Confirm Delete</h3>
            <button class="modal-close" onclick="closeModal('deleteModal')">&times;</button>
        </div>
        <div class="modal-body">
            <p id="deleteMessage">Are you sure you want to delete this item? This action cannot be undone.</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-outline" onclick="closeModal('deleteModal')">Cancel</button>
            <button class="btn btn-red">Yes, Delete</button>
        </div>
    </div>
</div>

<!-- Toast notification (success/error messages) -->
<div id="toast" class="toast"></div>


<!-- ========== JAVASCRIPT ========== -->
<script>
    // --- SECTION SWITCHING ---
    // Shows the selected section and hides all others
    function showSection(sectionName) {
        // Hide all sections
        var sections = document.querySelectorAll('.section');
        sections.forEach(function(s) {
            s.classList.remove('active');
        });

        // Remove active class from all nav items
        var navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(function(item) {
            item.classList.remove('active');
        });

        // Show the selected section
        document.getElementById('section-' + sectionName).classList.add('active');

        // Update the page title
        var titles = {
            'overview': 'Dashboard Overview',
            'listings': 'Manage Listings',
            'users': 'Manage Users',
            'reports': 'Reports & Analytics'
        };
        document.getElementById('page-title').textContent = titles[sectionName];

        // Highlight correct nav item (index matches order in sidebar)
        var indexMap = { 'overview': 0, 'listings': 1, 'users': 2, 'reports': 3 };
        navItems[indexMap[sectionName]].classList.add('active');
    }

    // --- MODAL FUNCTIONS ---
    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Close modal if user clicks outside the modal box
    function closeModalOutside(event, modalId) {
        if (event.target.id === modalId) {
            closeModal(modalId);
        }
    }

    // --- DELETE CONFIRMATION ---
    function confirmDelete(type, id) {
        document.getElementById('deleteMessage').textContent =
            'Are you sure you want to delete ' + type + ' ' + id + '? This cannot be undone.';
        openModal('deleteModal');
    }

    // --- APPROVE / REJECT USER (frontend demo) ---
    function approveUser(btn) {
        // Find the badge in the same row and update it
        var row = btn.closest('tr');
        var badge = row.querySelector('.badge');
        badge.textContent = 'Approved';
        badge.className = 'badge green';

        // Replace approve/reject buttons with edit/delete
        var actionCell = row.querySelector('.action-btns');
        actionCell.innerHTML =
            '<button class="btn-sm edit" onclick="openModal(\'editUserModal\')">Edit</button>' +
            '<button class="btn-sm delete" onclick="confirmDelete(\'user\', \'' + row.cells[0].textContent + '\')">Delete</button>';

        showToast('User approved successfully!');
    }

    function rejectUser(btn) {
        var row = btn.closest('tr');
        var badge = row.querySelector('.badge');
        badge.textContent = 'Rejected';
        badge.className = 'badge red-badge';
        var actionCell = row.querySelector('.action-btns');
        actionCell.innerHTML = '<span style="color:#999; font-size:13px;">Rejected</span>';
        showToast('User rejected.');
    }

    // --- TABLE SEARCH FILTER ---
    function filterTable(input, tableId) {
        var filter = input.value.toLowerCase();
        var rows = document.getElementById(tableId).querySelectorAll('tbody tr');
        rows.forEach(function(row) {
            var text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? '' : 'none';
        });
    }

    // Filter users table to show only pending
    function filterPending() {
        var rows = document.getElementById('users-table').querySelectorAll('tbody tr');
        rows.forEach(function(row) {
            var badge = row.querySelector('.badge');
            row.style.display = (badge && badge.textContent === 'Pending') ? '' : 'none';
        });
        showToast('Showing pending users only. Clear the search to reset.');
    }

    function filterByStatus(select, tableId) {
        var filter = select.value.toLowerCase();
        var rows = document.getElementById(tableId).querySelectorAll('tbody tr');
        rows.forEach(function(row) {
            var badge = row.querySelector('.badge');
            var status = badge ? badge.textContent.toLowerCase() : '';
            row.style.display = (!filter || status === filter) ? '' : 'none';
        });
    }

    // --- TOAST NOTIFICATION ---
    function showToast(message) {
        var toast = document.getElementById('toast');
        toast.textContent = message;
        toast.classList.add('show');
        setTimeout(function() {
            toast.classList.remove('show');
        }, 3000);
    }
</script>

</body>
</html>
