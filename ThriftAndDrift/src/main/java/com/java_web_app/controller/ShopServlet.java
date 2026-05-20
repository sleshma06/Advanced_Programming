package com.java_web_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read filter params
        final String category  = request.getParameter("category");
        final String size      = request.getParameter("size");
        final String style     = request.getParameter("style");
        final String condition = request.getParameter("condition");
        final String minP      = request.getParameter("minPrice");
        final String maxP      = request.getParameter("maxPrice");

        int minPrice = parsePrice(minP, 99);
        int maxPrice = parsePrice(maxP, 10000);
        if (minPrice > maxPrice) {
            int tmp = minPrice; minPrice = maxPrice; maxPrice = tmp;
        }
        final int selectedMinPrice = minPrice;
        final int selectedMaxPrice = maxPrice;

        List<Map<String, String>> products = ProductCatalog.products();

        products = products.stream()
            .filter(p -> {
                if (category != null && !category.isEmpty())
                    if (!p.get("category").equalsIgnoreCase(category)) return false;
                if (size != null && !size.isEmpty())
                    if (!p.get("size").equalsIgnoreCase(size)) return false;
                if (style != null && !style.isEmpty())
                    if (!p.get("badge").equalsIgnoreCase(style)) return false;
                if (condition != null && !condition.isEmpty())
                    if (!p.get("condition").equalsIgnoreCase(condition)) return false;
                int price = Integer.parseInt(p.get("price"));
                if (price < selectedMinPrice || price > selectedMaxPrice) return false;
                return true;
            })
            .collect(Collectors.toList());

        request.setAttribute("products", products);
        request.setAttribute("categories", ProductCatalog.categories(ProductCatalog.products()));
        request.setAttribute("categoryGroups", ProductCatalog.groupedByCategory(products));
        request.setAttribute("sizes", List.of("S", "M", "L", "XL"));
        request.setAttribute("styles", List.of("New-in", "Vintage", "Designer"));
        request.setAttribute("conditions", List.of("Like New", "Good", "Fair"));
        request.setAttribute("productCount", products.size());
        request.setAttribute("shopLoaded", true);

        request.setAttribute("selCategory", category);
        request.setAttribute("selSize",     size);
        request.setAttribute("selStyle",    style);
        request.setAttribute("selCondition", condition);
        request.setAttribute("selMinPrice", minPrice);
        request.setAttribute("selMaxPrice", maxPrice);

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
}