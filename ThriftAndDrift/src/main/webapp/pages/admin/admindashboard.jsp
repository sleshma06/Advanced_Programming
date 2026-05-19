<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard — Thrift &amp; Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
</head>
<body>

<div class="admin-shell">

    <!-- ══════════════════════════════════════════════════════
         SIDEBAR
    ═══════════════════════════════════════════════════════ -->
    <aside class="sidebar">

        <!-- Logo -->
        <div class="sidebar-logo">
            <a href="#">Thrift &amp; Drift</a>
        </div>

        <!-- Nav Links -->
        <nav class="sidebar-nav">
            <ul>
                <li>
                    <a href="#" class="nav-item active">
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <rect x="3" y="3" width="7" height="7" rx="1"/>
                            <rect x="14" y="3" width="7" height="7" rx="1"/>
                            <rect x="3" y="14" width="7" height="7" rx="1"/>
                            <rect x="14" y="14" width="7" height="7" rx="1"/>
                        </svg>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-item">
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M9 5H7a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-2"/>
                            <rect x="9" y="3" width="6" height="4" rx="1"/>
                            <line x1="9" y1="12" x2="15" y2="12"/>
                            <line x1="9" y1="16" x2="13" y2="16"/>
                        </svg>
                        Manage Listings
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-item">
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                        Manage Users
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-item">
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <line x1="18" y1="20" x2="18" y2="10"/>
                            <line x1="12" y1="20" x2="12" y2="4"/>
                            <line x1="6"  y1="20" x2="6"  y2="14"/>
                        </svg>
                        Reports &amp; Analytics
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Admin User -->
        <div class="sidebar-user">
            <div class="user-avatar">
                <svg viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                    <circle cx="12" cy="7" r="4"/>
                </svg>
            </div>
            <div class="user-info">
                <span class="user-name">Admin User</span>
                <span class="user-role">Superadmin</span>
            </div>
        </div>

    </aside>

    <!-- ══════════════════════════════════════════════════════
         MAIN CONTENT
    ═══════════════════════════════════════════════════════ -->
    <div class="main-content">

        <!-- Top Bar -->
        <header class="topbar">
            <h1 class="topbar-title">Dashboard Overview</h1>
            <div class="topbar-right">

                <!-- Search -->
                <div class="search-box">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <circle cx="11" cy="11" r="8"/>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                    </svg>
                    <input type="text" placeholder="Search..." aria-label="Search" />
                </div>

                <!-- Bell -->
                <div class="topbar-icon" title="Notifications">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                    </svg>
                    <span class="badge"></span>
                </div>

                <!-- Profile -->
                <div class="topbar-profile" title="Profile">
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                        <circle cx="12" cy="7" r="4"/>
                    </svg>
                </div>

            </div>
        </header>

        <!-- Page Body -->
        <main class="page-body">

            <!-- ── STAT CARDS ── -->
            <div class="stat-cards">

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Total Items Listed</span>
                        <div class="stat-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/>
                                <line x1="7" y1="7" x2="7.01" y2="7"/>
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value">12,450</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Pending Approvals</span>
                        <div class="stat-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <circle cx="12" cy="12" r="10"/>
                                <polyline points="12 6 12 12 16 14"/>
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value">342</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Active Users</span>
                        <div class="stat-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                                <circle cx="9" cy="7" r="4"/>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value">8,901</div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <span class="stat-label">Items Sold This Month</span>
                        <div class="stat-icon">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/>
                                <line x1="3" y1="6" x2="21" y2="6"/>
                                <path d="M16 10a4 4 0 0 1-8 0"/>
                            </svg>
                        </div>
                    </div>
                    <div class="stat-value">1,204</div>
                </div>

            </div>
            <!-- ── END STAT CARDS ── -->

            <!-- ── BOTTOM ROW ── -->
            <div class="bottom-row">

                <!-- Chart Card -->
                <div class="chart-card">
                    <h2 class="chart-card-title">Sales vs Listings — last 6 months</h2>

                    <!-- Legend -->
                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-dot sales"></span>
                            Sales
                        </div>
                        <div class="legend-item">
                            <span class="legend-dot listings"></span>
                            Listings
                        </div>
                    </div>

                    <!-- Bar Chart -->
                    <div class="bar-chart">
                        <!-- Jan -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 42%"></div>
                                <div class="bar listings-bar" style="height: 62%"></div>
                            </div>
                        </div>
                        <!-- Feb -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 55%"></div>
                                <div class="bar listings-bar" style="height: 72%"></div>
                            </div>
                        </div>
                        <!-- Mar -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 35%"></div>
                                <div class="bar listings-bar" style="height: 52%"></div>
                            </div>
                        </div>
                        <!-- Apr -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 70%"></div>
                                <div class="bar listings-bar" style="height: 88%"></div>
                            </div>
                        </div>
                        <!-- May -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 62%"></div>
                                <div class="bar listings-bar" style="height: 78%"></div>
                            </div>
                        </div>
                        <!-- Jun -->
                        <div class="bar-group">
                            <div class="bars">
                                <div class="bar sales-bar"    style="height: 80%"></div>
                                <div class="bar listings-bar" style="height: 95%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- X-axis Labels -->
                    <div class="chart-labels">
                        <span>Jan</span>
                        <span>Feb</span>
                        <span>Mar</span>
                        <span>Apr</span>
                        <span>May</span>
                        <span>Jun</span>
                    </div>

                </div>
                <!-- End Chart Card -->

                <!-- Activity Card -->
                <div class="activity-card">
                    <h2 class="activity-card-title">Recent Activity</h2>

                    <ul class="activity-list">
                        <li class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <div class="activity-desc">New user registered: sarah_vintage</div>
                                <div class="activity-time">2 mins ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <div class="activity-desc">Item approved: "90s Levi's 501"</div>
                                <div class="activity-time">15 mins ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <div class="activity-desc">Item sold: "Oversized Wool Blazer"</div>
                                <div class="activity-time">1 hour ago</div>
                            </div>
                        </li>
                        <li class="activity-item">
                            <span class="activity-dot"></span>
                            <div class="activity-text">
                                <div class="activity-desc">Item rejected: "Fake Gucci Belt"</div>
                                <div class="activity-time">3 hours ago</div>
                            </div>
                        </li>
                    </ul>

                    <!-- Action Buttons -->
                    <div class="activity-actions">
                        <a href="#" class="btn-approve">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                                <polyline points="22 4 12 14.01 9 11.01"/>
                            </svg>
                            Approve Users
                        </a>
                        <a href="#" class="btn-add">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <line x1="12" y1="5"  x2="12" y2="19"/>
                                <line x1="5"  y1="12" x2="19" y2="12"/>
                            </svg>
                            Add New Item
                        </a>
                    </div>

                </div>
                <!-- End Activity Card -->

            </div>
            <!-- ── END BOTTOM ROW ── -->

        </main>

    </div>
    <!-- End Main Content -->

</div>
<!-- End Admin Shell -->

</body>
</html>
