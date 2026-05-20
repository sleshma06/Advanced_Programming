package com.java_web_app.filter;

import com.java_web_app.utils.CookieUtil;
import com.java_web_app.utils.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

// Stops already-logged-in users from visiting login/register
@WebFilter(urlPatterns = {
        "/LoginServlet",
        "/register",
        "/pages/user/login.jsp",
        "/pages/user/registration.jsp"
})
public class GuestFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest  httpReq  = (HttpServletRequest)  request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        // Check regular user logged in via session
        boolean userLoggedIn = SessionUtil.isLoggedIn(httpReq);

        // Check admin logged in via cookie
        String adminId   = CookieUtil.getCookieValue(httpReq, "adminId");
        boolean adminLoggedIn = (adminId != null && !adminId.trim().isEmpty());

        if (userLoggedIn) {
          
            httpResp.sendRedirect(httpReq.getContextPath() + "/HomeServlet");

        } else if (adminLoggedIn) {
            
            String adminName = CookieUtil.getCookieValue(httpReq, "adminName");
            httpResp.sendRedirect(httpReq.getContextPath()
                    + "/DashboardServlet?adminId=" + adminId
                    + "&adminName=" + (adminName != null ? adminName : ""));

        } else {
            // Nobody logged in — let them through
            chain.doFilter(request, response);
        }
    }
}
