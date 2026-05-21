package com.java_web_app.controller;

import com.java_web_app.dao.AdminDAO;
import com.java_web_app.dao.ContactMessageDAO;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;
    private ContactMessageDAO contactMessageDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
        contactMessageDAO = new ContactMessageDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
            return;
        }

        request.setAttribute("adminId", SessionUtil.getAttribute(request, "userId"));
        request.setAttribute("adminName", SessionUtil.getAttribute(request, "userName"));

        try {
            request.setAttribute("totalUsers", adminDAO.countRows("users"));
            request.setAttribute("totalProducts", adminDAO.countRows("products"));
            request.setAttribute("totalOrders", adminDAO.countRows("orders"));
            request.setAttribute("pendingSubmissions", adminDAO.countSubmissionsByStatus("Submitted"));
            request.setAttribute("contactMessages", contactMessageDAO.countMessages());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load dashboard numbers.");
        }

        request.getRequestDispatcher("/pages/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
