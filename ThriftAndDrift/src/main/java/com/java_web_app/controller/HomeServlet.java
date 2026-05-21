package com.java_web_app.controller;

import com.java_web_app.dao.ProductDAO;
import com.java_web_app.model.ProductModel;
import com.java_web_app.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
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
            request.setAttribute("newInProducts", productDAO.getLatestProducts(3));
            request.setAttribute("designerProducts", productDAO.getDesignerProducts(3));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("homeError", "Showing the built-in catalog because the database is unavailable.");
            List<ProductModel> catalogProducts = ProductCatalogServlet.productModels();
            request.setAttribute("newInProducts", firstProducts(catalogProducts, 3));
            request.setAttribute("designerProducts", designerProducts(catalogProducts, 3));
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private List<ProductModel> firstProducts(List<ProductModel> products, int limit) {
        return products.subList(0, Math.min(limit, products.size()));
    }

    private List<ProductModel> designerProducts(List<ProductModel> products, int limit) {
        List<ProductModel> designerProducts = new ArrayList<>();
        for (ProductModel product : products) {
            if (contains(product.getName(), "Prada")
                    || contains(product.getName(), "Gucci")
                    || contains(product.getName(), "Dior")
                    || contains(product.getDescription(), "designer")) {
                designerProducts.add(product);
                if (designerProducts.size() == limit) {
                    return designerProducts;
                }
            }
        }
        return firstProducts(products, limit);
    }

    private boolean contains(String value, String keyword) {
        return value != null && value.toLowerCase().contains(keyword.toLowerCase());
    }
}
