package com.java_web_app.controller;

import com.java_web_app.dao.AdminDAO;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdminListingsServlet")
public class AdminListingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request, response)) {
            return;
        }

        try {
            request.setAttribute("submissions", adminDAO.getAllSubmissions());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load seller submissions: " + e.getMessage());
        }

        request.getRequestDispatcher("/pages/admin/managelisting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request, response)) {
            return;
        }

        String action = request.getParameter("action");
        int id = getInt(request.getParameter("id"));
        String adminNote = request.getParameter("adminNote");

        try {
            if ("approve".equals(action)) {
                double finalPrice = getDouble(request.getParameter("finalPrice"));
                if (finalPrice <= 0) {
                    request.setAttribute("error", "Final price must be greater than 0.");
                    doGet(request, response);
                    return;
                }
                adminDAO.approveSubmission(id, finalPrice, adminNote);
                request.setAttribute("success", "Submission approved.");
            } else if ("reject".equals(action)) {
                adminDAO.rejectSubmission(id, adminNote);
                request.setAttribute("success", "Submission rejected.");
            } else if ("list".equals(action)) {
                if (adminDAO.listSubmissionInShop(id)) {
                    request.setAttribute("success", "Item listed in shop.");
                } else {
                    request.setAttribute("error", "Approve the item and set final price before listing.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating listing: " + e.getMessage());
        }

        doGet(request, response);
    }

    private boolean isAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
            return false;
        }
        return true;
    }

    private int getInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }

    private double getDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (Exception e) {
            return 0;
        }
    }
}
