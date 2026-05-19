<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Listings — Thrift &amp; Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managelistings.css">
</head>
<body>

<div class="admin-shell">

    <!-- ===================== SIDEBAR ===================== -->
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>

        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <!-- Dashboard icon -->
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0
                             01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016
                             13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25
                             2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0
                             0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0
                             01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0
                             012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0
                             0113.5 18v-2.25z"/>
                </svg>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/admin/managelistings" class="active">
                <!-- List icon -->
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

            <a href="${pageContext.request.contextPath}/admin/manageusers">
                <!-- Users icon -->
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5
                             7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676
                             0-5.216-.584-7.499-1.632z"/>
                </svg>
                Manage Users
            </a>

            <a href="${pageContext.request.contextPath}/admin/reports">
                <!-- Analytics icon -->
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125
                             1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0
                             013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621
                             0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125
                             1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5
                             4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21
                             4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0
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
            <h1 class="topbar-title">Manage Listings</h1>
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
                              d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118
                                 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64
                                 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714
                                 0a3 3 0 11-5.714 0"/>
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
                    <input type="text" placeholder="Search listings..."
                           aria-label="Search listings"
                           value="${param.search}">
                </div>

                <select class="toolbar-select" name="category" aria-label="Filter by category">
                    <option value="">All Categories</option>
                    <option value="Outerwear"  ${param.category eq 'Outerwear'  ? 'selected' : ''}>Outerwear</option>
                    <option value="Tops"       ${param.category eq 'Tops'       ? 'selected' : ''}>Tops</option>
                    <option value="Bottoms"    ${param.category eq 'Bottoms'    ? 'selected' : ''}>Bottoms</option>
                    <option value="Shoes"      ${param.category eq 'Shoes'      ? 'selected' : ''}>Shoes</option>
                    <option value="Accessories"${param.category eq 'Accessories'? 'selected' : ''}>Accessories</option>
                </select>

                <select class="toolbar-select" name="status" aria-label="Filter by status">
                    <option value="">Status: All</option>
                    <option value="ACTIVE"  ${param.status eq 'ACTIVE'  ? 'selected' : ''}>Active</option>
                    <option value="PENDING" ${param.status eq 'PENDING' ? 'selected' : ''}>Pending</option>
                    <option value="SOLD"    ${param.status eq 'SOLD'    ? 'selected' : ''}>Sold</option>
                    <option value="REMOVED" ${param.status eq 'REMOVED' ? 'selected' : ''}>Removed</option>
                </select>

                <div class="toolbar-spacer"></div>

                <a href="${pageContext.request.contextPath}/admin/listings/new" class="btn-primary">
                    <!-- Plus icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                         stroke-width="2.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"/>
                    </svg>
                    Add New Item
                </a>
            </div>

            <!-- Table Card -->
            <div class="table-card">
                <table class="data-table" aria-label="Listings table">
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Category</th>
                            <th>Condition</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Date Added</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Static rows — replace <c:forEach items="${listings}" var="listing"> when dynamic --%>

                        <tr>
                            <td><span class="item-id">ITM-9021</span></td>
                            <td><span class="item-name">Vintage Leather Jacket</span></td>
                            <td>Outerwear</td>
                            <td>Good</td>
                            <td>NPR 85.00</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Oct 12, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9021"
                                       class="action-btn" title="View listing">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9021"
                                       class="action-btn" title="Edit listing">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0
                                                     0L19.5 7.125"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/listings/delete/9021"
                                       class="action-btn delete" title="Delete listing"
                                       onclick="return confirm('Delete this listing?');">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107
                                                     1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244
                                                     2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456
                                                     0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114
                                                     1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964
                                                     51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09
                                                     2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"/>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td><span class="item-id">ITM-9022</span></td>
                            <td><span class="item-name">Y2K Cargo Pants</span></td>
                            <td>Bottoms</td>
                            <td>Excellent</td>
                            <td>NPR 45.00</td>
                            <td><span class="badge badge-pending">Pending</span></td>
                            <td>Oct 12, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9022"
                                       class="action-btn" title="View">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9022"
                                       class="action-btn" title="Edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.Request.contextPath}/admin/listings/delete/9022"
                                       class="action-btn delete" title="Delete"
                                       onclick="return confirm('Delete this listing?');">
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
                            <td><span class="item-id">ITM-9023</span></td>
                            <td><span class="item-name">Band Graphic Tee</span></td>
                            <td>Tops</td>
                            <td>Fair</td>
                            <td>NPR 20.00</td>
                            <td><span class="badge badge-removed">Removed</span></td>
                            <td>Oct 11, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9023"
                                       class="action-btn" title="View">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9023"
                                       class="action-btn" title="Edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/listings/delete/9023"
                                       class="action-btn delete" title="Delete"
                                       onclick="return confirm('Delete this listing?');">
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
                            <td><span class="item-id">ITM-9024</span></td>
                            <td><span class="item-name">Doc Martens Boots</span></td>
                            <td>Shoes</td>
                            <td>Good</td>
                            <td>NPR 110.00</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Oct 10, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9024"
                                       class="action-btn" title="View">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9024"
                                       class="action-btn" title="Edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/listings/delete/9024"
                                       class="action-btn delete" title="Delete"
                                       onclick="return confirm('Delete this listing?');">
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
                            <td><span class="item-id">ITM-9025</span></td>
                            <td><span class="item-name">Nike Spellout Sweatshirt</span></td>
                            <td>Tops</td>
                            <td>Excellent</td>
                            <td>NPR 65.00</td>
                            <td><span class="badge badge-sold">Sold</span></td>
                            <td>Oct 09, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9025"
                                       class="action-btn" title="View">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9025"
                                       class="action-btn" title="Edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/listings/delete/9025"
                                       class="action-btn delete" title="Delete"
                                       onclick="return confirm('Delete this listing?');">
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
                            <td><span class="item-id">ITM-9026</span></td>
                            <td><span class="item-name">Levi's 501 Jeans</span></td>
                            <td>Bottoms</td>
                            <td>Good</td>
                            <td>NPR 55.00</td>
                            <td><span class="badge badge-active">Active</span></td>
                            <td>Oct 08, 2026</td>
                            <td>
                                <div class="action-icons">
                                    <a href="${pageContext.request.contextPath}/admin/listings/view/9026"
                                       class="action-btn" title="View">
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
                                    <a href="${pageContext.request.contextPath}/admin/listings/edit/9026"
                                       class="action-btn" title="Edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="1.8" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652
                                                     2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6
                                                     18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931z"/>
                                        </svg>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/listings/delete/9026"
                                       class="action-btn delete" title="Delete"
                                       onclick="return confirm('Delete this listing?');">
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

                        <%-- End static rows — swap with <c:forEach> for dynamic content --%>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination-row">
                    <%-- Replace with dynamic total count via EL: ${totalEntries} --%>
                    <span class="pagination-info">Showing 1 to 6 of 12,450 entries</span>
                    <div class="pagination-controls">
                        <button class="page-btn prev-next" type="button" aria-label="Previous page">Previous</button>
                        <button class="page-btn active" type="button" aria-current="page">1</button>
                        <button class="page-btn" type="button">2</button>
                        <button class="page-btn" type="button">3</button>
                        <button class="page-btn prev-next" type="button" aria-label="Next page">Next</button>
                    </div>
                </div>
            </div>

        </main>
    </div><!-- /.main-area -->
</div><!-- /.admin-shell -->

</body>
</html>
