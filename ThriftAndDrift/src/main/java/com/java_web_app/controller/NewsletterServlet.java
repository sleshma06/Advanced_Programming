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

        if (email != null && !email.isBlank()) 
        {
        	email = email.trim();
            // TODO: save email to DB later
        	request.setAttribute(
        		    "newsletterSuccess",
        		    "Subscribed successfully!"
        		);
        } else {
        	request.setAttribute(
                    "newsletterError",
                    "Please enter a valid email address."
            );
        }

        request.getRequestDispatcher("/pages/user/shop.jsp").forward(request, response);
    }
}
