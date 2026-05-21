package com.java_web_app.controller;

import com.java_web_app.dao.ContactMessageDAO;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdminContactMessagesServlet")
public class AdminContactMessagesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactMessageDAO contactMessageDAO;

    @Override
    public void init() {
        contactMessageDAO = new ContactMessageDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
            return;
        }

        try {
            request.setAttribute("messages", contactMessageDAO.getAllMessages());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load contact messages.");
        }

        request.getRequestDispatcher("/pages/admin/contactmessages.jsp").forward(request, response);
    }
}
