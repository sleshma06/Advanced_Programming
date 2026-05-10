package com.java_web_app.controller;

import jakarta.servlet.ServletException;
import com.java_web_app.utils.DBConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String email    = request.getParameter("email");
		String password = request.getParameter("password");

		try {

		    try (Connection conn = DBConfig.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(
		                 "SELECT * FROM users WHERE email = ? AND password = ?")) {

		        stmt.setString(1, email);
		        stmt.setString(2, password);

		        ResultSet rs = stmt.executeQuery();

		        if (rs.next()) {
		            HttpSession session = request.getSession();
		            session.setAttribute("userId",    rs.getInt("id"));
		            session.setAttribute("userEmail", rs.getString("email"));
		            session.setAttribute("userName",  rs.getString("name"));

		            response.sendRedirect(request.getContextPath() + "/pages/user/dashboard.jsp");
		        } else {
		            request.setAttribute("error", "Invalid email or password.");
		            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
		        }
		    }

		} catch (SQLException e) {
		    e.printStackTrace();
		    request.setAttribute("error", "Something went wrong. Please try again.");
		    request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
		}
	}

}
