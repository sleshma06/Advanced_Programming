package com.java_web_app.controller;

import com.java_web_app.utils.DBConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/NewsletterServlet")
public class NewsletterServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        if (email == null || email.isBlank() || !isValidEmail(email.trim())) {
            session.setAttribute("newsletterError", "Please enter a valid email address.");
            response.sendRedirect(request.getContextPath() + "/ShopServlet#newsletter");
            return;
        }

        try {
            if (subscribe(email.trim())) {
                session.setAttribute("newsletterSuccess", "Subscribed successfully!");
            } else {
                session.setAttribute("newsletterSuccess", "You are already subscribed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("newsletterError", "Subscription failed. Please try again.");
        }

        response.sendRedirect(request.getContextPath() + "/ShopServlet#newsletter");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/ShopServlet#newsletter");
    }

    private boolean subscribe(String email) throws SQLException {
        String sql = "INSERT INTO newsletter_subscribers (email) "
                + "SELECT ? WHERE NOT EXISTS (SELECT 1 FROM newsletter_subscribers WHERE email = ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        }
    }

    private boolean isValidEmail(String email) {
        return email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }
}
