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

// Stops already logged-in users from opening login/register again
@WebFilter(urlPatterns = {
        "/LoginServlet",
        "/AdminLoginServlet",
        "/register",
        "/pages/user/login.jsp",
        "/pages/user/registration.jsp"
})
public class GuestFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        if (SessionUtil.isAdminLoggedIn(httpReq)) {
            httpResp.sendRedirect(httpReq.getContextPath() + "/DashboardServlet");
            return;
        }

        if (SessionUtil.isLoggedIn(httpReq)) {
            httpResp.sendRedirect(httpReq.getContextPath() + "/HomeServlet");
            return;
        }

        httpResp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResp.setHeader("Pragma", "no-cache");
        httpResp.setDateHeader("Expires", 0);
        chain.doFilter(request, response);
    }
}
