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
    private static final int SESSION_TIME = 30 * 60;
    private final LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If admin already logged in via session, send to dashboard
        if (SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
            return;
        }
        // If user already logged in via session, send home
        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/HomeServlet");
            return;
        }
        request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
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
                    // ADMIN: keep admin details in session
                    SessionUtil.createAdminSession(request, user, SESSION_TIME);
                    CookieUtil.addCookie(response, "last_login", loginTime, SESSION_TIME);

                    response.sendRedirect(request.getContextPath() + "/DashboardServlet");
                } else {
                    // USER: session for sensitive info and cookie for last login only
                    SessionUtil.createUserSession(request, user, SESSION_TIME);
                    CookieUtil.addCookie(response, "last_login", loginTime, SESSION_TIME);

                    response.sendRedirect(request.getContextPath() + "/HomeServlet");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Something went wrong. Please try again.");
                request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", status);
            request.setAttribute("typedEmail", email);
            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
        }
    }
}
