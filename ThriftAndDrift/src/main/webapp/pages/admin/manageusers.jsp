<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users — Thrift &amp; Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageusers.css">
</head>
<body>

<div class="admin-shell">

    <!-- ===================== SIDEBAR ===================== -->
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>

        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/pages/admin/dashboard">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25
                             2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25
                             2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0
                             01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0
                             012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118
                             10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0
                             012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118
                             20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"/>
                </svg>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/pages/admin/managelisting">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75zm.375
                             0a.375.375 0 11-.75 0 .375.375 0 01.75 0zM3.75 12h.007v.008H3.75V12zm.375
                             0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm-.375 5.25h.007v.008H3.75v-.008zm.375
                             0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"/>
                </svg>
                Manage Listings
            </a>

            <a href="${pageContext.request.contextPath}/pages/admin/manageusers" class="active">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5
                             7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/>
                </svg>
                Manage Users
            </a>

            <a href="${pageContext.request.contextPath}/pages/admin/reports">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504
                             1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125
                             1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125
                             1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0
                             .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0
                             01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125
                             1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0
                             .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0
                             01-1.125-1.125V4.125z"/>
                </svg>
                Reports &amp; Analytics
            </a>
        </nav>

        <div class="sidebar-user">
            <div class="sidebar-user-avatar">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501
                             20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676
                             0-5.216-.584-7.499-1.632z"/>
                </svg>
            </div>
            <div class="sidebar-user-info">
                <span class="sidebar-user-name">Admin User</span>
                <span class="sidebar-user-role">Superadmin</span>
            </div>
        </div>
    </aside>

    <!-- ===================== MAIN AREA ===================== -->
    <div class="main-area">

        <!-- Top Bar -->
        <header class="topbar">
            <h1 class="topbar-title">Manage Users</h1>
            <div class="topbar-right">
                <div class="topbar-search">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 15.803 7.5 7.5 0 0015.803 15.803z"/>
                    </svg>
                    <input type="text" placeholder="Search..." aria-label="Global search">
                </div>
                <button class="topbar-icon-btn" type="button" aria-label="Notifications">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="1.8" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0
                                 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0
                                 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255
                                 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0"/>
                    </svg>
                    <span class="notif-dot"></span>
                </button>
                <button class="topbar-icon-btn" type="button" aria-label="Profile">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="1.8" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501
                                 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676
                                 0-5.216-.584-7.499-1.632z"/>
                    </svg>
                </button>
            </div>
        </header>

        <!-- Page Body -->
        <main class="page-body">

            <!-- Toolbar -->
            <div class="toolbar">
                <div class="toolbar-search">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 15.803 7.5 7.5 0 0015.803 15.803z"/>
                    </svg>
                    <input type="text" placeholder="Search users by name or email..."
                           aria-label="Search users" value="${param.search}">
                </div>

                <select class="toolbar-select" name="status" aria-label="Filter by status">
                    <option value="">Status: All</option>
                    <option value="ACTIVE"   ${param.status eq 'ACTIVE'   ? 'selected' : ''}>Active</option>
                    <option value="PENDING"  ${param.status eq 'PENDING'  ? 'selected' : ''}>Pending</option>
                    <option value="REJECTED" ${param.status eq 'REJECTED' ? 'selected' : ''}>Rejected</option>
                </select>

                <div class="toolbar-spacer"></div>

                <a href="${pageContext.request.contextPath}/admin/users/invite" class="btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"/>
                    </svg>
                    Invite User
                </a>
            </div>

            <div class="bulk-bar" id="bulkBar">
                <div class="bulk-bar-icon" id="bulkDeselect" title="Deselect all"
                     onclick="deselectAll()">&#8722;</div>
                <span class="bulk-bar-text" id="bulkCount">2 users selected</span>
                <button class="btn-approve" type="button"
                        onclick="bulkAction('approve')">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2.5" stroke="currentColor" style="width:14px;height:14px">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5"/>
                    </svg>
                    Approve Selected
                </button>
                <button class="btn-reject" type="button"
                        onclick="bulkAction('reject')">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2.5" stroke="currentColor" style="width:14px;height:14px">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                    Reject Selected
                </button>
            </div>

            <!-- Table Card -->
            <div class="table-card">
                <table class="data-table" aria-label="Users table" id="usersTable">
                    <thead>
                        <tr>
                            <th class="col-check">
                                <input type="checkbox" id="selectAll"
                                       aria-label="Select all users"
                                       onchange="toggleSelectAll(this)">
                            </th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Registered</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                     

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="101"
                                       aria-label="Select Sarah Jenkins" checked
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-101</span></td>
                            <td><span class="user-name">Sarah Jenkins</span></td>
                            <td>sarah@example.com</td>
                            <td>User</td>
                            <td><span class="badge badge-pending">Pending</span></td>
                            <td>Oct 12, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/approve/101"
                                       class="action-btn approve" title="Approve user">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="2" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/reject/101"
                                       class="action-btn reject" title="Reject user">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="2" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/view/101"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/101"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="102"
                                       aria-label="Select Mike Ross" checked
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-102</span></td>
                            <td><span class="user-name">Mike Ross</span></td>
                            <td>mike.r@example.com</td>
                            <td>User</td>
                            <td><span class="badge badge-pending">Pending</span></td>
                            <td>Oct 12, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/approve/102"
                                       class="action-btn approve" title="Approve user">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="2" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/reject/102"
                                       class="action-btn reject" title="Reject user">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="2" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/view/102"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/102"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="103"
                                       aria-label="Select Admin User"
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-103</span></td>
                            <td><span class="user-name">Admin User</span></td>
                            <td>admin@thriftdrift.com</td>
                            <td>Admin</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Jan 01, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/view/103"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/103"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="104"
                                       aria-label="Select Jane Doe"
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-104</span></td>
                            <td><span class="user-name">Jane Doe</span></td>
                            <td>jane.d@example.com</td>
                            <td>User</td>
                            <td><span class="badge badge-rejected">Rejected</span></td>
                            <td>Oct 05, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/view/104"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/104"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="105"
                                       aria-label="Select Chris Evans"
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-105</span></td>
                            <td><span class="user-name">Chris Evans</span></td>
                            <td>cevans@example.com</td>
                            <td>User</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Oct 01, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/view/105"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/105"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="col-check">
                                <input type="checkbox" class="row-check" value="106"
                                       aria-label="Select Amanda Smith"
                                       onchange="updateBulkBar()">
                            </td>
                            <td><span class="item-id">USR-106</span></td>
                            <td><span class="user-name">Amanda Smith</span></td>
                            <td>asmith22@example.com</td>
                            <td>User</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Sep 28, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/users/view/106"
                                       class="action-btn" title="View profile">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12
                                                     4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0
                                                     .639C20.577 16.49 16.64 19.5 12 19.5c-4.638
                                                     0-8.573-3.007-9.963-7.178z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/106"
                                       class="action-btn delete" title="Delete user"
                                       onclick="return confirm('Permanently delete this user?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772
                                                     5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12
                                                     .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0
                                                     013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                      
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination-row">
                   
                    <span class="pagination-info">Showing 1 to 6 of 100 users</span>
                    <div class="pagination-controls">
                        <button class="page-btn prev-next" type="button" aria-label="Previous page">Previous</button>
                        <button class="page-btn active" type="button" aria-current="page">1</button>
                        <button class="page-btn" type="button">2</button>
                        <button class="page-btn" type="button">3</button>
                        <span class="page-btn" style="border:none;background:none;color:var(--text-muted)">...</span>
                        <button class="page-btn" type="button">89</button>
                        <button class="page-btn prev-next" type="button" aria-label="Next page">Next</button>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<script>
    /* -------------------------------------------------------
       Bulk selection helpers
       All vanilla JS — no frameworks, no scriptlets.
       In a dynamic setup, wire bulk action buttons to form
       submissions pointing to /admin/users/bulkAction.
    ------------------------------------------------------- */

    function updateBulkBar() {
        var checks = document.querySelectorAll('.row-check:checked');
        var bar    = document.getElementById('bulkBar');
        var countEl = document.getElementById('bulkCount');
        if (checks.length > 0) {
            bar.style.display = 'flex';
            countEl.textContent = checks.length + ' user' + (checks.length > 1 ? 's' : '') + ' selected';
        } else {
            bar.style.display = 'none';
        }
    }

    function toggleSelectAll(masterCheckbox) {
        var rowChecks = document.querySelectorAll('.row-check');
        rowChecks.forEach(function(cb) { cb.checked = masterCheckbox.checked; });
        updateBulkBar();
    }

    function deselectAll() {
        document.querySelectorAll('.row-check, #selectAll').forEach(function(cb) {
            cb.checked = false;
        });
        updateBulkBar();
    }

    function bulkAction(action) {
        var checks = document.querySelectorAll('.row-check:checked');
        var ids    = [];
        checks.forEach(function(cb) { ids.push(cb.value); });
        if (ids.length === 0) return;
        /* Wire to actual backend endpoint when going dynamic:
           window.location = contextPath + '/admin/users/bulkAction?action=' + action + '&ids=' + ids.join(','); */
        alert(action.charAt(0).toUpperCase() + action.slice(1) + ' users: ' + ids.join(', '));
    }

    /* Initialise bar state on page load based on pre-checked rows */
    document.addEventListener('DOMContentLoaded', function() {
        updateBulkBar();
    });
</script>

</body>
</html>
