package com.java_web_app.controller;

import com.java_web_app.dao.UserDAO;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/user/registration.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (isBlank(email) || isBlank(username) || isBlank(password) || isBlank(confirmPassword)) {
            request.setAttribute("error", "Please fill in all fields.");
            doGet(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            doGet(request, response);
            return;
        }

        try {
            if (userDAO.getUserByEmail(email.trim()) != null) {
                request.setAttribute("error", "An account with this email already exists.");
                doGet(request, response);
                return;
            }

            UserModel user = new UserModel();
            user.setEmail(email.trim());
            user.setName(username.trim());
            user.setPassword(PasswordUtil.hashPassword(password));
            user.setRole("user");

            if (userDAO.registerUser(user)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?registered=true");
            } else {
                request.setAttribute("error", "Could not create account. Please try again.");
                doGet(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again.");
            doGet(request, response);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
