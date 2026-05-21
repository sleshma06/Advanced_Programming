package com.java_web_app.dao;

import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDAO {

    public boolean createOrder(int userId, double totalAmount, String paymentMethod, String deliveryType)
            throws SQLException {
        String sql = "INSERT INTO orders (user_id, total_amount, order_status, payment_method, delivery_type) "
                + "VALUES (?, ?, 'Processing', ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setDouble(2, totalAmount);
            stmt.setString(3, paymentMethod);
            stmt.setString(4, deliveryType);
            return stmt.executeUpdate() > 0;
        }
    }
}
