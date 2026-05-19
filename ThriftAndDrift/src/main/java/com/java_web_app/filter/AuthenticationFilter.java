package com.java_web_app.filter;

import com.java_web_app.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;


@WebFilter(urlPatterns = { "/dashboard", "/shop", "/students", "/logout" })
public class AuthenticationFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest  httpReq  = (HttpServletRequest)  request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
        String path = httpReq.getRequestURI().substring(httpReq.getContextPath().length());

        if (path.equals("/pages/user/login.jsp")
                || path.equals("/pages/user/register.jsp")
                || path.equals("/pages/user/registration.jsp")
                || path.equals("/pages/user/wishlist.jsp")
                || path.equals("/pages/user/bag.jsp")
                || path.equals("/pages/user/checkout.jsp")
                || path.equals("/pages/user/profile.jsp")) {
            chain.doFilter(request, response);
            return;
        }

        if (SessionUtil.isLoggedIn(httpReq)) {
            // Prevent back-button revealing protected pages after logout
            httpResp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            chain.doFilter(request, response);
        } else {
            httpResp.sendRedirect(httpReq.getContextPath() + "/LoginServlet");
        }
    }
}
