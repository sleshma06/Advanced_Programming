package com.java_web_app.controller;

import com.java_web_app.dao.CartDAO;
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
import java.util.List;

@WebServlet("/BagServlet")
public class BagServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final double PLATFORM_FEE = 50;
    private CartDAO cartDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
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
            List<ProductModel> cartProducts = cartDAO.getCartProducts(user.getId());
            double subtotal = 0;
            for (ProductModel product : cartProducts) {
                subtotal += product.getPrice();
            }

            request.setAttribute("cartProducts", cartProducts);
            request.setAttribute("cartCount", cartProducts.size());
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("platformFee", cartProducts.isEmpty() ? 0 : PLATFORM_FEE);
            request.setAttribute("total", cartProducts.isEmpty() ? 0 : subtotal + PLATFORM_FEE);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load your bag.");
            request.setAttribute("cartCount", 0);
            request.setAttribute("subtotal", 0);
            request.setAttribute("platformFee", 0);
            request.setAttribute("total", 0);
        }

        request.getRequestDispatcher("/pages/user/bag.jsp").forward(request, response);
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
        String action = request.getParameter("action");

        try {
            if (productId <= 0 || productDAO.getListedProductById(productId) == null) {
                request.setAttribute("error", "Product could not be found.");
                doGet(request, response);
                return;
            }

            if ("remove".equals(action)) {
                cartDAO.removeItem(user.getId(), productId);
                response.sendRedirect(request.getContextPath() + "/BagServlet?removed=true");
            } else {
                boolean added = cartDAO.addItem(user.getId(), productId);
                if (added) {
                    response.sendRedirect(request.getContextPath() + "/BagServlet?added=true");
                } else {
                    response.sendRedirect(request.getContextPath() + "/BagServlet?exists=true");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while updating bag.");
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
}
