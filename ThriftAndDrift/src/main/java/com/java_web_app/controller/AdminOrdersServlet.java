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

        try {
            adminDAO.updateOrderStatus(orderId, status);
            request.setAttribute("success", "Order status updated.");
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
}
