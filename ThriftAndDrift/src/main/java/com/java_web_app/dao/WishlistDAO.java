package com.java_web_app.dao;

import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO {

    public boolean addItem(int userId, int productId) throws SQLException {
        if (isItemInWishlist(userId, productId)) {
            return false;
        }

        String sql = "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean removeItem(int userId, int productId) throws SQLException {
        String sql = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        }
    }

    public List<Integer> getProductIdsByUser(int userId) throws SQLException {
        List<Integer> productIds = new ArrayList<>();
        String sql = "SELECT product_id FROM wishlist WHERE user_id = ? ORDER BY product_id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    productIds.add(rs.getInt("product_id"));
                }
            }
        }
        return productIds;
    }

    private boolean isItemInWishlist(int userId, int productId) throws SQLException {
        String sql = "SELECT product_id FROM wishlist WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
}
