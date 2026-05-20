package com.java_web_app.controller;

import com.java_web_app.dao.UserDAO;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.PasswordUtil;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
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
        UserModel sessionUser = SessionUtil.getUser(request);
        if (sessionUser == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            UserModel user = userDAO.getUserById(sessionUser.getId());
            request.setAttribute("profileUser", user);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load your profile.");
            request.setAttribute("profileUser", sessionUser);
        }

        request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel sessionUser = SessionUtil.getUser(request);
        if (sessionUser == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (isBlank(name) || isBlank(email)) {
            request.setAttribute("error", "Name and email are required.");
            request.setAttribute("profileUser", sessionUser);
            request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
            return;
        }

        try {
            UserModel user = userDAO.getUserById(sessionUser.getId());
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/LogoutServlet");
                return;
            }

            UserModel emailOwner = userDAO.getUserByEmail(email.trim());
            if (emailOwner != null && emailOwner.getId() != user.getId()) {
                request.setAttribute("error", "This email is already used by another account.");
                request.setAttribute("profileUser", user);
                request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
                return;
            }

            user.setName(name.trim());
            user.setEmail(email.trim());

            if (!isBlank(newPassword) || !isBlank(confirmPassword)) {
                if (isBlank(newPassword) || newPassword.length() < 6) {
                    request.setAttribute("error", "New password must be at least 6 characters.");
                    request.setAttribute("profileUser", user);
                    request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
                    return;
                }
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "Password confirmation does not match.");
                    request.setAttribute("profileUser", user);
                    request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
                    return;
                }
                user.setPassword(PasswordUtil.hashPassword(newPassword));
            }

            if (userDAO.updateUser(user)) {
                SessionUtil.createUserSession(request, user, SESSION_TIME);
                request.setAttribute("success", "Profile updated successfully.");
            } else {
                request.setAttribute("error", "Profile could not be updated.");
            }

            request.setAttribute("profileUser", user);
            request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating profile.");
            request.setAttribute("profileUser", sessionUser);
            request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
