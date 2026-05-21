package com.java_web_app.dao;

import com.java_web_app.model.ContactMessageModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ContactMessageDAO {

    public boolean saveMessage(ContactMessageModel message) throws SQLException {
        ensureTable();
        String sql = "INSERT INTO contact_messages (name, email, phone, message) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, message.getName());
            stmt.setString(2, message.getEmail());
            stmt.setString(3, message.getPhone());
            stmt.setString(4, message.getMessage());
            return stmt.executeUpdate() > 0;
        }
    }

    public List<ContactMessageModel> getAllMessages() throws SQLException {
        ensureTable();
        List<ContactMessageModel> messages = new ArrayList<>();
        String sql = "SELECT * FROM contact_messages ORDER BY id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                messages.add(mapMessage(rs));
            }
        }
        return messages;
    }

    public int countMessages() throws SQLException {
        ensureTable();
        String sql = "SELECT COUNT(*) FROM contact_messages";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    private void ensureTable() throws SQLException {
        String sql = "CREATE TABLE IF NOT EXISTS contact_messages ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "name VARCHAR(100) NOT NULL, "
                + "email VARCHAR(150) NOT NULL, "
                + "phone VARCHAR(30), "
                + "message TEXT NOT NULL, "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                + ")";

        try (Connection conn = DBConfig.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }

    private ContactMessageModel mapMessage(ResultSet rs) throws SQLException {
        ContactMessageModel message = new ContactMessageModel();
        message.setId(rs.getInt("id"));
        message.setName(rs.getString("name"));
        message.setEmail(rs.getString("email"));
        message.setPhone(rs.getString("phone"));
        message.setMessage(rs.getString("message"));
        message.setCreatedAt(rs.getString("created_at"));
        return message;
    }
}
