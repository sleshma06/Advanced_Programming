package com.java_web_app.controller;

import com.java_web_app.dao.AdminDAO;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdminOrdersServlet")
public class AdminOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request, response)) {
            return;
        }

        if ("true".equals(request.getParameter("updated"))) {
            request.setAttribute("success", "Order status updated.");
        }
        if ("true".equals(request.getParameter("invalid"))) {
            request.setAttribute("error", "Please choose a valid order and status.");
        }

        try {
            request.setAttribute("orders", adminDAO.getAllOrders());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load orders.");
        }

        request.getRequestDispatcher("/pages/admin/reports.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request, response)) {
            return;
        }

        int orderId = getInt(request.getParameter("orderId"));
        String status = request.getParameter("orderStatus");

        if (orderId <= 0 || !isValidStatus(status)) {
            response.sendRedirect(request.getContextPath() + "/AdminOrdersServlet?invalid=true");
            return;
        }

        try {
            boolean updated = adminDAO.updateOrderStatus(orderId, status);
            response.sendRedirect(request.getContextPath() + "/AdminOrdersServlet?"
                    + (updated ? "updated=true" : "invalid=true"));
            return;
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating order.");
        }

        doGet(request, response);
    }

    private boolean isAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
            return false;
        }
        return true;
    }

    private int getInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }

    private boolean isValidStatus(String status) {
        return "Processing".equals(status)
                || "Ready for Pickup".equals(status)
                || "Delivered".equals(status)
                || "Cancelled".equals(status);
    }
}
