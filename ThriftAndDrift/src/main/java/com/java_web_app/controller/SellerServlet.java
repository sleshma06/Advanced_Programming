package com.java_web_app.controller;

import com.java_web_app.dao.SellerSubmissionDAO;
import com.java_web_app.model.SellerSubmissionModel;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/SellerServlet")
public class SellerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SellerSubmissionDAO submissionDAO;

    @Override
    public void init() {
        submissionDAO = new SellerSubmissionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        request.getRequestDispatcher("/seller.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = SessionUtil.getUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        String itemName = request.getParameter("listingTitle");
        String category = request.getParameter("category");
        String size = request.getParameter("size");
        String condition = request.getParameter("condition");
        String price = request.getParameter("price");
        String dropDate = request.getParameter("dropDate");
        String dropSlot = request.getParameter("dropSlot");
        String payoutInfo = request.getParameter("payoutInfo");

        if (isBlank(itemName) || isBlank(category) || isBlank(size) || isBlank(condition)
                || isBlank(price) || isBlank(dropDate) || isBlank(dropSlot) || isBlank(payoutInfo)) {
            request.setAttribute("errorMessage", "Please fill in all required seller submission fields.");
            request.getRequestDispatcher("/seller.jsp").forward(request, response);
            return;
        }

        double estimatedPrice = getPrice(price);
        if (estimatedPrice <= 0) {
            request.setAttribute("errorMessage", "Estimated price must be greater than 0.");
            request.getRequestDispatcher("/seller.jsp").forward(request, response);
            return;
        }

        SellerSubmissionModel submission = new SellerSubmissionModel();
        submission.setUserId(user.getId());
        submission.setItemName(itemName.trim());
        submission.setCategory(category.trim());
        submission.setSize(size.trim());
        submission.setCondition(condition.trim());
        submission.setEstimatedPrice(estimatedPrice);
        submission.setDropoffDate(dropDate);
        submission.setDropoffTimeSlot(dropSlot);
        submission.setPayoutInfo(payoutInfo.trim());
        submission.setStatus("Submitted");

        try {
            if (submissionDAO.addSubmission(submission)) {
                request.setAttribute("successMessage", "Your item was submitted. Admin will review it soon.");
            } else {
                request.setAttribute("errorMessage", "Submission failed. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("/seller.jsp").forward(request, response);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private double getPrice(String value) {
        try {
            return Double.parseDouble(value.replace("Rs.", "").replace("Rs", "").trim());
        } catch (Exception e) {
            return 0;
        }
    }
}
