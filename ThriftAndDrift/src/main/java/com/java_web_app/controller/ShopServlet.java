package com.java_web_app.controller;


import com.java_web_app.dao.ProductDAO;
import com.java_web_app.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import java.sql.SQLException;


@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        final String category  = request.getParameter("category");
        final String size      = request.getParameter("size");
        final String condition = request.getParameter("condition");
        final String minP      = request.getParameter("minPrice");
        final String maxP      = request.getParameter("maxPrice");
        final String query     = request.getParameter("q");

        int minPrice = parsePrice(minP, 99);
        int maxPrice = parsePrice(maxP, 10000);
        if (minPrice > maxPrice) {
            int tmp = minPrice; minPrice = maxPrice; maxPrice = tmp;
        }
        try {
            List<ProductModel> allProducts = productDAO.getListedProducts();
            List<ProductModel> filteredProducts = productDAO.searchListedProducts(
                    category, size, condition, minPrice, maxPrice, query);

            request.setAttribute("products", filteredProducts);
            request.setAttribute("categories", categories(allProducts));
            request.setAttribute("productCount", filteredProducts.size());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load products from database.");
            request.setAttribute("products", List.of());
            request.setAttribute("categories", List.of());
            request.setAttribute("productCount", 0);
        }

        request.setAttribute("sizes", List.of("S", "M", "L", "XL"));
        request.setAttribute("conditions", List.of("Like New", "Good", "Fair"));
        request.setAttribute("shopLoaded", true);
        request.setAttribute("selCategory", category);
        request.setAttribute("selSize", size);
        request.setAttribute("selCondition", condition);
        request.setAttribute("selMinPrice", minPrice);
        request.setAttribute("selMaxPrice", maxPrice);
        request.setAttribute("searchQuery", query);

        request.getRequestDispatcher("/pages/user/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


    private int parsePrice(String value, int fallback) {
        if (value == null || value.isBlank()) return fallback;
        try { return Integer.parseInt(value); }
        catch (NumberFormatException e) { return fallback; }
    }

    private List<Map<String, String>> categories(List<ProductModel> products) {
        Map<String, Integer> counts = new LinkedHashMap<>();
        for (ProductModel product : products) {
            String category = product.getCategory();
            if (category == null || category.isBlank()) {
                continue;
            }
            counts.put(category, counts.getOrDefault(category, 0) + 1);
        }

        List<Map<String, String>> categories = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            Map<String, String> category = new LinkedHashMap<>();
            category.put("name", entry.getKey());
            category.put("count", String.valueOf(entry.getValue()));
            categories.add(category);
        }
        return categories;
    }
}


