package com.java_web_app.controller;

import com.java_web_app.dao.WishlistDAO;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WishlistDAO wishlistDAO;

    @Override
    public void init() {
        wishlistDAO = new WishlistDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = SessionUtil.getUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            List<Map<String, String>> wishlistProducts = new ArrayList<>();
            for (int productId : wishlistDAO.getProductIdsByUser(user.getId())) {
                Map<String, String> product = ProductCatalog.findById(String.valueOf(productId));
                if (product != null) {
                    wishlistProducts.add(product);
                }
            }

            request.setAttribute("wishlistProducts", wishlistProducts);
            request.setAttribute("wishlistCount", wishlistProducts.size());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load your wishlist.");
        }

        request.getRequestDispatcher("/pages/user/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = SessionUtil.getUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        int productId = getInt(request.getParameter("productId"));
        if (productId <= 0 || ProductCatalog.findById(String.valueOf(productId)) == null) {
            request.setAttribute("error", "Product could not be found.");
            doGet(request, response);
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("remove".equals(action)) {
                wishlistDAO.removeItem(user.getId(), productId);
                response.sendRedirect(request.getContextPath() + "/WishlistServlet?removed=true");
            } else {
                boolean added = wishlistDAO.addItem(user.getId(), productId);
                if (added) {
                    response.sendRedirect(request.getContextPath() + "/WishlistServlet?added=true");
                } else {
                    response.sendRedirect(request.getContextPath() + "/WishlistServlet?exists=true");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating wishlist.");
            doGet(request, response);
        }
    }

    private int getInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }
}
