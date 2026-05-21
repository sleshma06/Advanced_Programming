package com.java_web_app.filter;

import com.java_web_app.utils.SessionUtil;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Only admins can open admin pages
@WebFilter(urlPatterns = {
        "/DashboardServlet",
        "/AdminListingsServlet",
        "/AdminUsersServlet",
        "/AdminOrdersServlet",
        "/AdminContactMessagesServlet",
        "/pages/admin/dashboard.jsp",
        "/pages/admin/managelisting.jsp",
        "/pages/admin/manageusers.jsp",
        "/pages/admin/reports.jsp",
        "/pages/admin/contactmessages.jsp"
})
public class AdminFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        if (SessionUtil.isAdminLoggedIn(httpReq)) {
            String path = httpReq.getRequestURI().substring(httpReq.getContextPath().length());

            if ("/pages/admin/dashboard.jsp".equals(path)) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/DashboardServlet");
                return;
            }

            if ("/pages/admin/managelisting.jsp".equals(path)) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/AdminListingsServlet");
                return;
            }

            if ("/pages/admin/manageusers.jsp".equals(path)) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/AdminUsersServlet");
                return;
            }

            if ("/pages/admin/reports.jsp".equals(path)) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/AdminOrdersServlet");
                return;
            }

            if ("/pages/admin/contactmessages.jsp".equals(path)) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/AdminContactMessagesServlet");
                return;
            }

            chain.doFilter(request, response);
            return;
        }

        httpResp.sendRedirect(httpReq.getContextPath() + "/AdminLoginServlet");
    }
}
