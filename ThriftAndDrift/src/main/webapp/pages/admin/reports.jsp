<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports &amp; Analytics — Thrift &amp; Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reports.css">
    <style>
        /* ---- Reports-only extras ---- */
        .reports-body {
            padding-bottom: 32px;
        }

        /* Donut SVG ring */
        .donut-ring {
            fill: none;
            stroke-width: 28;
        }

        /* Line chart area fill */
        .line-area {
            fill: rgba(155, 28, 28, 0.10);
        }

        .line-path {
            fill: none;
            stroke: #9B1C1C;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .line-dot {
            fill: #9B1C1C;
            stroke: #fff;
            stroke-width: 2;
        }
    </style>
</head>
<body>

<div class="admin-shell">

    <!-- ===================== SIDEBAR ===================== -->
    <aside class="sidebar">
        <div class="sidebar-logo">Thrift &amp; Drift</div>

        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
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

            <a href="${pageContext.request.contextPath}/admin/managelistings">
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
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5
                             7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/>
                </svg>
                Manage Users
            </a>

            <a href="${pageContext.request.contextPath}/admin/reports" class="active">
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
            <h1 class="topbar-title">Reports &amp; Analytics</h1>
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
                    <%-- Dot hidden on reports page — add class notif-dot if needed --%>
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
        <main class="page-body reports-body">

            <!-- ===== KPI STAT CARDS ===== -->
            <div class="stats-grid">

                <!-- Total Revenue -->
                <div class="stat-card">
                    <div class="stat-label">Total Revenue</div>
                    <%-- Replace value with EL: ${stats.totalRevenue} --%>
                    <div class="stat-value">Rs. 16,558,500</div>
                    <div class="stat-delta">
                        <span class="delta-up">+12%</span> vs last month
                    </div>
                </div>

                <!-- Most Popular Category -->
                <div class="stat-card">
                    <div class="stat-label">Most Popular Category</div>
                    <%-- Replace with EL: ${stats.topCategory} --%>
                    <div class="stat-value big-text">Vintage Outerwear</div>
                    <div class="stat-delta">
                        <span class="delta-trend">Trending</span> vs last month
                    </div>
                </div>

                <!-- Avg. Selling Price -->
                <div class="stat-card">
                    <div class="stat-label">Avg. Selling Price</div>
                    <%-- Replace with EL: ${stats.avgSellingPrice} --%>
                    <div class="stat-value">Rs. 6,450</div>
                    <div class="stat-delta">
                        <span class="delta-down">-2%</span> vs last month
                    </div>
                </div>

                <!-- Return Rate -->
                <div class="stat-card">
                    <div class="stat-label">Return Rate</div>
                    <%-- Replace with EL: ${stats.returnRate} --%>
                    <div class="stat-value">2.4%</div>
                    <div class="stat-delta">
                        <span class="delta-down">-0.5%</span> vs last month
                    </div>
                </div>

            </div>
            <%-- End KPI cards — when dynamic, wrap in <c:if test="${not empty stats}"> --%>


            <!-- ===== BAR CHART: Items Listed vs Sold ===== -->
            <div class="chart-row one-col" style="margin-bottom:16px;">
                <div class="chart-card">
                    <div class="chart-card-header">
                        <span class="chart-card-title">Items Listed vs Sold</span>
                        <div class="chart-card-actions">
                            <%-- Replace with dynamic range selector --%>
                            <button class="chart-filter-btn" type="button">Last 6 Months</button>
                            <a href="${pageContext.request.contextPath}/admin/reports/export?type=listed-sold"
                               class="chart-filter-btn">Export</a>
                        </div>
                    </div>

                    <%--
                        Static bar chart built with CSS heights.
                        When dynamic, compute heights as percentage of max value via EL/JSTL math
                        and set via inline style="height:${item.listedPct}%"
                    --%>
                    <div class="bar-chart-wrap" aria-label="Items listed vs sold bar chart">

                        <!-- January -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 55%;"
                                 title="Jan — Listed: ~220"></div>
                            <div class="bar sold"   style="height: 38%;"
                                 title="Jan — Sold: ~152"></div>
                            <span class="bar-month-label">Jan</span>
                        </div>

                        <!-- February -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 72%;"
                                 title="Feb — Listed: ~288"></div>
                            <div class="bar sold"   style="height: 50%;"
                                 title="Feb — Sold: ~200"></div>
                            <span class="bar-month-label">Feb</span>
                        </div>

                        <!-- March -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 62%;"
                                 title="Mar — Listed: ~248"></div>
                            <div class="bar sold"   style="height: 44%;"
                                 title="Mar — Sold: ~176"></div>
                            <span class="bar-month-label">Mar</span>
                        </div>

                        <!-- April -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 85%;"
                                 title="Apr — Listed: ~340"></div>
                            <div class="bar sold"   style="height: 60%;"
                                 title="Apr — Sold: ~240"></div>
                            <span class="bar-month-label">Apr</span>
                        </div>

                        <!-- May -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 78%;"
                                 title="May — Listed: ~312"></div>
                            <div class="bar sold"   style="height: 52%;"
                                 title="May — Sold: ~208"></div>
                            <span class="bar-month-label">May</span>
                        </div>

                        <!-- June -->
                        <div class="bar-group">
                            <div class="bar listed" style="height: 100%;"
                                 title="Jun — Listed: ~400"></div>
                            <div class="bar sold"   style="height: 68%;"
                                 title="Jun — Sold: ~272"></div>
                            <span class="bar-month-label">Jun</span>
                        </div>

                    </div>

                    <div class="chart-legend">
                        <div class="legend-item">
                            <span class="legend-dot listed"></span> Listed
                        </div>
                        <div class="legend-item">
                            <span class="legend-dot sold"></span> Sold
                        </div>
                    </div>
                </div>
            </div>


            <!-- ===== BOTTOM ROW: Donut + Line Chart ===== -->
            <div class="chart-row two-col">

                <!-- Donut: Top Categories -->
                <div class="chart-card">
                    <div class="chart-card-header">
                        <span class="chart-card-title">Top Categories</span>
                        <div class="chart-card-actions">
                            <button class="chart-filter-btn" type="button">This Month</button>
                            <button class="chart-icon-btn" type="button" aria-label="More options">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                     stroke-width="2" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M6.75 12a.75.75 0 11-1.5 0 .75.75 0 011.5 0zM12.75
                                             12a.75.75 0 11-1.5 0 .75.75 0 011.5 0zM18.75 12a.75.75
                                             0 11-1.5 0 .75.75 0 011.5 0z"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="donut-wrap">
                        <%--
                            SVG donut chart.
                            Circumference of a circle with r=54: ~339.3
                            Each stroke-dasharray segment = pct * 339.3
                            Outerwear 42% = 142.5 | Bottoms 35% = 118.8 | Tops 15% = 50.9 | Accessories 8% = 27.1
                            When dynamic: compute these values in a servlet/bean and pass via EL.
                        --%>
                        <div class="donut-svg-wrap">
                            <svg viewBox="0 0 160 160" xmlns="http://www.w3.org/2000/svg"
                                 aria-label="Category breakdown donut chart">
                                <!-- Track -->
                                <circle class="donut-ring"
                                        cx="80" cy="80" r="54"
                                        stroke="#EDE5DF"/>
                                <!-- Outerwear 42% -->
                                <circle class="donut-ring"
                                        cx="80" cy="80" r="54"
                                        stroke="#9B1C1C"
                                        stroke-dasharray="142.5 339.3"
                                        stroke-dashoffset="0"
                                        transform="rotate(-90 80 80)"/>
                                <!-- Bottoms 35% -->
                                <circle class="donut-ring"
                                        cx="80" cy="80" r="54"
                                        stroke="#D9CEC9"
                                        stroke-dasharray="118.8 339.3"
                                        stroke-dashoffset="-142.5"
                                        transform="rotate(-90 80 80)"/>
                                <!-- Tops 15% -->
                                <circle class="donut-ring"
                                        cx="80" cy="80" r="54"
                                        stroke="#C4B5AE"
                                        stroke-dasharray="50.9 339.3"
                                        stroke-dashoffset="-261.3"
                                        transform="rotate(-90 80 80)"/>
                                <!-- Accessories 8% — remainder -->
                                <circle class="donut-ring"
                                        cx="80" cy="80" r="54"
                                        stroke="#E8DDD6"
                                        stroke-dasharray="27.1 339.3"
                                        stroke-dashoffset="-312.2"
                                        transform="rotate(-90 80 80)"/>
                            </svg>
                            <div class="donut-center-label">
                                <%-- Replace with EL: ${topCategory.percentage}% --%>
                                <div class="donut-center-pct">42%</div>
                                <div class="donut-center-name">Outerwear</div>
                            </div>
                        </div>

                        <div class="donut-legend">
                            <div class="donut-legend-item">
                                <span class="donut-dot" style="background:#9B1C1C;"></span>
                                Outerwear 42%
                            </div>
                            <div class="donut-legend-item">
                                <span class="donut-dot" style="background:#D9CEC9;"></span>
                                Bottoms 35%
                            </div>
                            <div class="donut-legend-item">
                                <span class="donut-dot" style="background:#C4B5AE;"></span>
                                Tops 15%
                            </div>
                            <div class="donut-legend-item">
                                <span class="donut-dot" style="background:#E8DDD6;"></span>
                                Accessories 8%
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Line Chart: New User Registrations -->
                <div class="chart-card">
                    <div class="chart-card-header">
                        <span class="chart-card-title">New User Registrations</span>
                        <div class="chart-card-actions">
                            <button class="chart-filter-btn" type="button">Last 7 Days</button>
                            <button class="chart-icon-btn" type="button" aria-label="More options">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                     stroke-width="2" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M6.75 12a.75.75 0 11-1.5 0 .75.75 0 011.5 0zM12.75
                                             12a.75.75 0 11-1.5 0 .75.75 0 011.5 0zM18.75 12a.75.75
                                             0 11-1.5 0 .75.75 0 011.5 0z"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <%--
                        SVG line chart.
                        viewBox: 0 0 400 140.  Y-axis inverted (SVG 0 = top).
                        Data points (Mon–Sun): 35, 50, 20, 60, 75, 95, 55
                        Y position = 130 - (value / 100 * 120)
                        X positions evenly spread: 10, 76, 143, 210, 277, 344, 390
                        When dynamic: generate points string via servlet.
                    --%>
                    <div class="line-chart-wrap">
                        <svg viewBox="0 0 400 140" xmlns="http://www.w3.org/2000/svg"
                             aria-label="New user registrations line chart">
                            <!-- Filled area under the line -->
                            <path class="line-area"
                                  d="M10,88 L76,70 L143,106 L210,58 L277,40 L344,16 L390,64 L390,130 L10,130 Z"/>
                            <!-- Line itself -->
                            <path class="line-path"
                                  d="M10,88 L76,70 L143,106 L210,58 L277,40 L344,16 L390,64"/>
                            <!-- Data point dots -->
                            <circle class="line-dot" cx="10"  cy="88"  r="4"/>
                            <circle class="line-dot" cx="76"  cy="70"  r="4"/>
                            <circle class="line-dot" cx="143" cy="106" r="4"/>
                            <circle class="line-dot" cx="210" cy="58"  r="4"/>
                            <circle class="line-dot" cx="277" cy="40"  r="4"/>
                            <circle class="line-dot" cx="344" cy="16"  r="5"/><!-- peak -->
                            <circle class="line-dot" cx="390" cy="64"  r="4"/>
                        </svg>
                        <div class="line-x-labels" aria-hidden="true">
                            <span class="line-x-label">Mon</span>
                            <span class="line-x-label">Tue</span>
                            <span class="line-x-label">Wed</span>
                            <span class="line-x-label">Thu</span>
                            <span class="line-x-label">Fri</span>
                            <span class="line-x-label">Sat</span>
                            <span class="line-x-label">Sun</span>
                        </div>
                    </div>
                </div>

            </div>
            <%-- End bottom row --%>

        </main>
    </div><!-- /.main-area -->
</div><!-- /.admin-shell -->

</body>
</html>
