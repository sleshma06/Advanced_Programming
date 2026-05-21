package com.java_web_app.controller;

import com.java_web_app.dao.CartDAO;
import com.java_web_app.dao.OrderDAO;
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

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final double PLATFORM_FEE = 50;
    private CartDAO cartDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = SessionUtil.getUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        loadOrderSummary(request, user.getId());
        request.getRequestDispatcher("/pages/user/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = SessionUtil.getUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        String paymentMethod = clean(request.getParameter("payment"));
        String deliveryType = clean(request.getParameter("fulfillment"));

        try {
            double total = loadOrderSummary(request, user.getId());
            if (total <= 0) {
                request.setAttribute("error", "Your bag is empty.");
                request.getRequestDispatcher("/pages/user/checkout.jsp").forward(request, response);
                return;
            }

            if (orderDAO.createOrder(user.getId(), total, paymentMethod, deliveryType)) {
                try {
                    cartDAO.clearCart(user.getId());
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + "/BagServlet?ordered=true");
                return;
            }

            request.setAttribute("error", "Order could not be placed.");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error while placing order.");
        }

        request.getRequestDispatcher("/pages/user/checkout.jsp").forward(request, response);
    }

    private double loadOrderSummary(HttpServletRequest request, int userId) throws ServletException {
        try {
            List<ProductModel> products = cartDAO.getCartProducts(userId);
            double subtotal = 0;
            for (ProductModel product : products) {
                subtotal += product.getPrice();
            }

            double platformFee = products.isEmpty() ? 0 : PLATFORM_FEE;
            double total = subtotal + platformFee;
            request.setAttribute("cartProducts", products);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("platformFee", platformFee);
            request.setAttribute("total", total);
            return total;
        } catch (SQLException e) {
            throw new ServletException("Could not load checkout summary.", e);
        }
    }

    private String clean(String value) {
        if (value == null || value.trim().isEmpty()) {
            return "Not selected";
        }
        return value.trim();
    }
}
