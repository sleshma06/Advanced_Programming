package com.java_web_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        if (email != null && !email.isBlank()) {
            // TODO: save email to DB later
            request.setAttribute("newsletterSuccess", true);
        } else {
            request.setAttribute("newsletterError", true);
        }

        request.getRequestDispatcher("/pages/user/shop.jsp").forward(request, response);
    }
}