package com.java_web_app.dao;

import com.java_web_app.model.ProductModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addItem(int userId, int productId) throws SQLException {
        if (isItemInCart(userId, productId)) {
            return false;
        }

        String sql = "INSERT INTO cart (user_id, product_id) VALUES (?, ?)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean removeItem(int userId, int productId) throws SQLException {
        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        }
    }

    public List<ProductModel> getCartProducts(int userId) throws SQLException {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT p.* FROM cart c "
                + "JOIN products p ON c.product_id = p.product_id "
                + "WHERE c.user_id = ? AND p.status IN ('available', 'Listed') "
                + "ORDER BY c.product_id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
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
                    products.add(product);
                }
            }
        }
        return products;
    }

    private boolean isItemInCart(int userId, int productId) throws SQLException {
        String sql = "SELECT product_id FROM cart WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    private String imageOrDefault(String imageUrl) {
        if (imageUrl == null || imageUrl.trim().isEmpty()) {
            return "images/c1.jfif";
        }
        return imageUrl.trim();
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
