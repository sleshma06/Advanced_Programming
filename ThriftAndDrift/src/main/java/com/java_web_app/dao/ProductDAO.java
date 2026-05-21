package com.java_web_app.dao;

import com.java_web_app.model.ProductModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<ProductModel> getListedProducts() throws SQLException {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE status IN ('available', 'Listed') ORDER BY product_id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        }
        return products;
    }

    public List<ProductModel> searchListedProducts(String category, String size, String condition,
            int minPrice, int maxPrice, String keyword) throws SQLException {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products "
                + "WHERE status IN ('available', 'Listed') "
                + "AND (? IS NULL OR category = ?) "
                + "AND (? IS NULL OR size = ?) "
                + "AND (? IS NULL OR condition_rating = ?) "
                + "AND price BETWEEN ? AND ? "
                + "AND (? IS NULL OR name LIKE ? OR category LIKE ?) "
                + "ORDER BY product_id DESC";

        String cleanCategory = emptyToNull(category);
        String cleanSize = emptyToNull(size);
        Integer conditionRating = conditionToRating(condition);
        String cleanKeyword = emptyToNull(keyword);
        String keywordSearch = cleanKeyword == null ? null : "%" + cleanKeyword + "%";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cleanCategory);
            stmt.setString(2, cleanCategory);
            stmt.setString(3, cleanSize);
            stmt.setString(4, cleanSize);
            if (conditionRating == null) {
                stmt.setNull(5, java.sql.Types.INTEGER);
                stmt.setNull(6, java.sql.Types.INTEGER);
            } else {
                stmt.setInt(5, conditionRating);
                stmt.setInt(6, conditionRating);
            }
            stmt.setInt(7, minPrice);
            stmt.setInt(8, maxPrice);
            stmt.setString(9, cleanKeyword);
            stmt.setString(10, keywordSearch);
            stmt.setString(11, keywordSearch);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapProduct(rs));
                }
            }
        }
        return products;
    }

    public ProductModel getListedProductById(int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE product_id = ? AND status IN ('available', 'Listed')";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapProduct(rs);
                }
            }
        }
        return null;
    }

    public List<ProductModel> getLatestProducts(int limit) throws SQLException {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE status IN ('available', 'Listed') ORDER BY product_id DESC LIMIT ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapProduct(rs));
                }
            }
        }
        return products;
    }

    private ProductModel mapProduct(ResultSet rs) throws SQLException {
        ProductModel product = new ProductModel();
        product.setId(rs.getInt("product_id"));
        product.setName(rs.getString("name"));
        product.setCategory(rs.getString("category"));
        product.setCondition(ratingToCondition(rs.getInt("condition_rating")));
        product.setSize(rs.getString("size"));
        product.setPrice(rs.getDouble("price"));
        product.setStatus(rs.getString("status"));
        product.setImageUrl(imageOrDefault(rs.getString("image")));
        product.setDescription(rs.getString("description"));
        return product;
    }

    private String emptyToNull(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value.trim();
    }

    private String imageOrDefault(String imageUrl) {
        if (imageUrl == null || imageUrl.trim().isEmpty()) {
            return "images/c1.jfif";
        }
        return imageUrl.trim();
    }

    private Integer conditionToRating(String condition) {
        if (condition == null || condition.trim().isEmpty()) {
            return null;
        }

        if ("Like New".equalsIgnoreCase(condition)) {
            return 5;
        }
        if ("Good".equalsIgnoreCase(condition)) {
            return 4;
        }
        if ("Fair".equalsIgnoreCase(condition)) {
            return 3;
        }
        return null;
    }

    private String ratingToCondition(int rating) {
        if (rating >= 5) {
            return "Like New";
        }
        if (rating == 4) {
            return "Good";
        }
        return "Fair";
    }
}
