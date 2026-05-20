package com.java_web_app.controller;

import com.java_web_app.dao.ProductDAO;
import com.java_web_app.model.ProductModel;
import com.java_web_app.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            List<ProductModel> products = productDAO.getListedProducts();
            int end = Math.min(products.size(), 3);
            request.setAttribute("newInProducts", products.subList(0, end));
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("homeError", "Could not load new products.");
            request.setAttribute("newInProducts", List.of());
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
