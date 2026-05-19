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

@WebServlet("/AdminUsersServlet")
public class AdminUsersServlet extends HttpServlet {
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
            request.setAttribute("users", adminDAO.getAllUsers());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load users.");
        }

        request.getRequestDispatcher("/pages/admin/manageusers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request, response)) {
            return;
        }

        String action = request.getParameter("action");
        int userId = getInt(request.getParameter("userId"));

        try {
            if ("makeAdmin".equals(action)) {
                adminDAO.updateUserRole(userId, "admin");
                request.setAttribute("success", "User role changed to admin.");
            } else if ("makeUser".equals(action)) {
                adminDAO.updateUserRole(userId, "user");
                request.setAttribute("success", "User role changed to user.");
            } else if ("delete".equals(action)) {
                adminDAO.deleteUser(userId);
                request.setAttribute("success", "User deleted.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating user.");
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
