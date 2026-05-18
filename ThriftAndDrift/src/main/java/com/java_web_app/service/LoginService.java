package com.java_web_app.service;

import com.java_web_app.dao.UserDAO;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.PasswordUtil;

import java.sql.SQLException;

public class LoginService {

    private final UserDAO userDAO = new UserDAO();

    // Returns "Success" or an error message string
    public String authenticate(String email, String password) {
        if (email == null || email.trim().isEmpty()) return "Email is required";
        if (password == null || password.isEmpty())  return "Password is required";
        try {
            UserModel user = userDAO.getUserByEmail(email);
            if (user == null) return "No account found with that email";
            if (PasswordUtil.checkPassword(password, user.getPassword())) return "Success";
            return "Incorrect password";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error. Please try again.";
        }
    }

    // Fetch user after successful authentication
    public UserModel getUserByEmail(String email) throws SQLException {
        return userDAO.getUserByEmail(email);
    }
}