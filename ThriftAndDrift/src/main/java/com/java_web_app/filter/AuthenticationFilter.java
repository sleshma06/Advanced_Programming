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

// Protect pages that should only open after login
@WebFilter(urlPatterns = {
        "/HomeServlet",
        "/index.jsp",
        "/WishlistServlet",
        "/BagServlet",
        "/CheckoutServlet",
        "/ProfileServlet",
        "/SellerServlet",
        "/pages/user/wishlist.jsp",
        "/pages/user/bag.jsp",
        "/pages/user/checkout.jsp",
        "/pages/user/profile.jsp",
        "/seller.jsp"
})
public class AuthenticationFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        if (SessionUtil.isLoggedIn(httpReq) || SessionUtil.isAdminLoggedIn(httpReq)) {
            httpResp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            httpResp.setHeader("Pragma", "no-cache");
            httpResp.setDateHeader("Expires", 0);
            chain.doFilter(request, response);
            return;
        }

        httpResp.sendRedirect(httpReq.getContextPath() + "/LoginServlet");
    }
}
