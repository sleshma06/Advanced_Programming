package com.java_web_app.controller;

import com.java_web_app.dao.ContactMessageDAO;
import com.java_web_app.model.ContactMessageModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactMessageDAO contactMessageDAO;

    @Override
    public void init() {
        contactMessageDAO = new ContactMessageDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String messageText = request.getParameter("message");

        if (isBlank(name) || isBlank(email) || isBlank(messageText)) {
            response.sendRedirect(request.getContextPath() + "/HomeServlet?contactError=true#contact-us");
            return;
        }

        ContactMessageModel message = new ContactMessageModel();
        message.setName(name.trim());
        message.setEmail(email.trim());
        message.setPhone(phone == null ? "" : phone.trim());
        message.setMessage(messageText.trim());

        try {
            contactMessageDAO.saveMessage(message);
            response.sendRedirect(request.getContextPath() + "/HomeServlet?contactSuccess=true#contact-us");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/HomeServlet?contactError=true#contact-us");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
