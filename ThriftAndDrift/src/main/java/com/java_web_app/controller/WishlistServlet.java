package com.java_web_app.controller;

import com.java_web_app.dao.WishlistDAO;
import com.java_web_app.dao.ProductDAO;
import com.java_web_app.model.ProductModel;
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

@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WishlistDAO wishlistDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        wishlistDAO = new WishlistDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            List<ProductModel> wishlistProducts = new ArrayList<>();
            for (int productId : wishlistDAO.getProductIdsByUser(user.getId())) {
                ProductModel product = productDAO.getListedProductById(productId);
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
        UserModel user = getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        int productId = getInt(request.getParameter("productId"));
        try {
            if (productId <= 0 || productDAO.getListedProductById(productId) == null) {
                request.setAttribute("error", "Product could not be found.");
                doGet(request, response);
                return;
            }
        } catch (SQLException e) {
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
                    response.sendRedirect(getReturnUrl(request, "wishlistAdded=true"));
                } else {
                    response.sendRedirect(getReturnUrl(request, "wishlistExists=true"));
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

    private UserModel getLoggedInUser(HttpServletRequest request) {
        UserModel user = SessionUtil.getUser(request);
        if (user != null) {
            return user;
        }

        Object loggedInUser = SessionUtil.getAttribute(request, "loggedInUser");
        if (loggedInUser instanceof UserModel) {
            return (UserModel) loggedInUser;
        }
        return null;
    }

    private String getReturnUrl(HttpServletRequest request, String message) {
        String returnUrl = request.getParameter("returnUrl");
        if (returnUrl == null || returnUrl.trim().isEmpty()) {
            returnUrl = request.getHeader("referer");
        }
        if (returnUrl == null || returnUrl.trim().isEmpty()) {
            return request.getContextPath() + "/WishlistServlet?" + message;
        }

        String separator = returnUrl.contains("?") ? "&" : "?";
        return returnUrl + separator + message;
    }
}
