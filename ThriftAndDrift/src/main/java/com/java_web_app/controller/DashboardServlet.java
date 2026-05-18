package com.java_web_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Admin arrives via query string — validate it
        String adminId   = request.getParameter("adminId");
        String adminName = request.getParameter("adminName");

        if (adminId == null || adminId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        // Pass to JSP as request attributes
        request.setAttribute("adminId",   adminId);
        request.setAttribute("adminName", adminName);
        request.getRequestDispatcher("/pages/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}