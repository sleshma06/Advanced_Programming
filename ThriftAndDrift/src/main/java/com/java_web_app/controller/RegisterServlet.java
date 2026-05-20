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

    private UserDAO userDAO = new UserDAO();


    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/user/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        request.setAttribute("email", email);
        request.setAttribute("username", username);


        if (isBlank(email) || isBlank(username) || isBlank(password) || isBlank(confirmPassword)) {
            request.setAttribute("error", "Please fill in all fields.");
            doGet(request, response);
            return;
        }


        if (password.length() < 6) {
            request.setAttribute("error", "Password must be at least 6 characters.");
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

            user.setName(username.trim());
            user.setEmail(email.trim());

            user.setPassword(PasswordUtil.hashPassword(password));
            user.setRole("user");

            if (userDAO.registerUser(user)) {

                response.sendRedirect(request.getContextPath() + "/LoginServlet?registered=true");
            } else {
                request.setAttribute("error", "Could not create account. Please try again.");

                request.setAttribute("success", "Account created successfully. Please log in.");
         
                doGet(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();


            request.setAttribute("error", "Database error: " + e.getMessage());

            doGet(request, response);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
