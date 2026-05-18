package com.java_web_app.controller;

import com.java_web_app.utils.CookieUtil;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Destroy user session
        SessionUtil.invalidateSession(request);

        // Clear all cookies (covers admin cookies too)
        CookieUtil.deleteCookie(response, "last_login");
        CookieUtil.deleteCookie(response, "adminId");
        CookieUtil.deleteCookie(response, "adminName");

        response.sendRedirect(request.getContextPath() + "/LoginServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}