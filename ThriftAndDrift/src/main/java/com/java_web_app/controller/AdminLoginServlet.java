package com.java_web_app.controller;

import com.java_web_app.dao.UserDAO;
import com.java_web_app.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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

        UserModel user = userDAO.getUserByEmailAndPassword(email.trim(), password);

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            request.setAttribute("error", "Access denied. Admin credentials required.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", user);
        session.setAttribute("userId",   user.getId());
        session.setAttribute("userName", user.getName());
        session.setAttribute("userRole", user.getRole());
        session.setAttribute("isAdmin",  true);

        response.sendRedirect(request.getContextPath() + "/pages/admin/dashboard.jsp");
    }
}