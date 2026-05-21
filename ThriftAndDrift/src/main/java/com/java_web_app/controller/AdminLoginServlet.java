package com.java_web_app.controller;

import com.java_web_app.dao.UserDAO;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private static final int SESSION_TIME = 30 * 60;
	private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(request, response);
            return;
        }

        UserModel user;
        try {
            user = userDAO.getUserByEmailAndPassword(email.trim(), password.trim());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.setAttribute("email", email);
            request.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(request, response);
            return;
        }

        String role = user != null ? user.getRole() : "";
        if (user == null || !"admin".equalsIgnoreCase(role.trim())) {
            request.setAttribute("error", "Access denied. Admin credentials required.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(request, response);
            return;
        }

        SessionUtil.createAdminSession(request, user, SESSION_TIME);

        response.sendRedirect(request.getContextPath() + "/DashboardServlet");
    }
}
