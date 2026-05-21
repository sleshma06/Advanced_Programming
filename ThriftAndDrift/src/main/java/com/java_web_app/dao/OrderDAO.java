package com.java_web_app.dao;

import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OrderDAO {

    public boolean createOrder(int userId, double totalAmount, String paymentMethod, String deliveryType)
            throws SQLException {
        ensureOrdersTable();

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

    private void ensureOrdersTable() throws SQLException {
        String createSql = "CREATE TABLE IF NOT EXISTS orders ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "user_id INT NOT NULL, "
                + "total_amount DECIMAL(10,2) DEFAULT 0, "
                + "order_status VARCHAR(50) DEFAULT 'Processing', "
                + "payment_method VARCHAR(50), "
                + "delivery_type VARCHAR(50), "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                + ")";

        try (Connection conn = DBConfig.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(createSql);

            addColumnIfMissing(conn, stmt, "total_amount", "DECIMAL(10,2) DEFAULT 0");
            addColumnIfMissing(conn, stmt, "order_status", "VARCHAR(50) DEFAULT 'Processing'");
            addColumnIfMissing(conn, stmt, "payment_method", "VARCHAR(50)");
            addColumnIfMissing(conn, stmt, "delivery_type", "VARCHAR(50)");
            addColumnIfMissing(conn, stmt, "created_at", "TIMESTAMP DEFAULT CURRENT_TIMESTAMP");
        }
    }

    private void addColumnIfMissing(Connection conn, Statement stmt, String columnName, String columnDefinition)
            throws SQLException {
        if (!hasColumn(conn, columnName)) {
            stmt.executeUpdate("ALTER TABLE orders ADD COLUMN " + columnName + " " + columnDefinition);
        }
    }

    private boolean hasColumn(Connection conn, String columnName) throws SQLException {
        DatabaseMetaData metaData = conn.getMetaData();
        try (ResultSet rs = metaData.getColumns(conn.getCatalog(), null, "orders", columnName)) {
            return rs.next();
        }
    }
}
