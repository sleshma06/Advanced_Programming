package com.java_web_app.controller;

import com.java_web_app.model.UserModel;
import com.java_web_app.service.LoginService;
import com.java_web_app.utils.CookieUtil;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If user already logged in via session, send home
        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/HomeServlet");
            return;
        }
        // If admin already logged in via cookie, send to dashboard
        String adminId = CookieUtil.getCookieValue(request, "adminId");
        if (adminId != null && !adminId.trim().isEmpty()) {
            String adminName = CookieUtil.getCookieValue(request, "adminName");
            response.sendRedirect(request.getContextPath()
                    + "/DashboardServlet?adminId=" + adminId
                    + "&adminName=" + (adminName != null ? adminName : ""));
            return;
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        String status = loginService.authenticate(email, password);

        if ("Success".equals(status)) {
            try {
                UserModel user = loginService.getUserByEmail(email);

                String loginTime = LocalDateTime.now()
                        .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                if ("admin".equals(user.getRole())) {
                    // ADMIN: query string + non-sensitive cookies only
                    CookieUtil.addCookie(response, "last_login", loginTime, 3600);
                    CookieUtil.addCookie(response, "adminId",    String.valueOf(user.getId()), 3600);
                    CookieUtil.addCookie(response, "adminName",  user.getName(), 3600);

                    response.sendRedirect(request.getContextPath()
                            + "/DashboardServlet?adminId=" + user.getId()
                            + "&adminName=" + user.getName());
                } else {
                    // USER: session for sensitive info + cookie for last login only
                    SessionUtil.createUserSession(request, user, 3600);
                    CookieUtil.addCookie(response, "last_login", loginTime, 3600);

                    response.sendRedirect(request.getContextPath() + "/HomeServlet");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Something went wrong. Please try again.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", status);
            request.setAttribute("typedEmail", email);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}