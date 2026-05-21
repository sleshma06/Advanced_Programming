package com.java_web_app.controller;

import com.java_web_app.dao.ProductDAO;
import com.java_web_app.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId;
        try {
            productId = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/ShopServlet");
            return;
        }

        try {
            ProductModel product = productDAO.getListedProductById(productId);
            if (product == null) {
                Map<String, String> catalogProduct = ProductCatalogServlet.findById(String.valueOf(productId));
                if (catalogProduct == null) {
                    response.sendRedirect(request.getContextPath() + "/ShopServlet");
                    return;
                }
                request.setAttribute("product", detailProduct(catalogProduct));
                request.getRequestDispatcher("/pages/user/productdetail.jsp").forward(request, response);
                return;
            }

            request.setAttribute("product", detailProduct(product));
            request.getRequestDispatcher("/pages/user/productdetail.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> catalogProduct = ProductCatalogServlet.findById(String.valueOf(productId));
            if (catalogProduct != null) {
                request.setAttribute("product", detailProduct(catalogProduct));
            } else {
                request.setAttribute("error", "Could not load product details.");
            }
            request.getRequestDispatcher("/pages/user/productdetail.jsp").forward(request, response);
        }
    }

    private Map<String, String> detailProduct(ProductModel product) {
        Map<String, String> details = new LinkedHashMap<>();
        Map<String, String> catalogProduct = ProductCatalogServlet.findByName(product.getName());

        details.put("id", String.valueOf(product.getId()));
        details.put("name", product.getName());
        details.put("category", product.getCategory());
        details.put("price", String.valueOf(product.getPrice()));
        details.put("imageUrl", product.getImageUrl());
        details.put("condition", product.getCondition());
        details.put("size", product.getSize());
        details.put("rating", catalogProduct != null ? catalogProduct.get("rating") : "Store inspected");
        details.put("description", product.getDescription() != null && !product.getDescription().isBlank()
                ? product.getDescription()
                : catalogProduct != null
                ? catalogProduct.get("description")
                : "A listed Thrift&Drift item inspected by the store and ready for a second life.");
        return details;
    }

    private Map<String, String> detailProduct(Map<String, String> product) {
        Map<String, String> details = new LinkedHashMap<>();
        details.put("id", product.get("id"));
        details.put("name", product.get("name"));
        details.put("category", product.get("category"));
        details.put("price", product.get("price"));
        details.put("imageUrl", "images/" + product.get("image"));
        details.put("condition", product.get("condition"));
        details.put("size", product.get("size"));
        details.put("rating", product.get("rating"));
        details.put("description", product.get("description"));
        return details;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
