package com.java_web_app.dao;

import com.java_web_app.model.OrderModel;
import com.java_web_app.model.SellerSubmissionModel;
import com.java_web_app.model.UserModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public int countRows(String tableName) throws SQLException {
        String sql = "SELECT COUNT(*) FROM " + tableName;
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public int countSubmissionsByStatus(String status) throws SQLException {
        String sql = "SELECT COUNT(*) FROM seller_submissions WHERE status = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public List<SellerSubmissionModel> getAllSubmissions() throws SQLException {
        List<SellerSubmissionModel> submissions = new ArrayList<>();
        String sql = "SELECT s.*, u.name AS seller_name "
                + "FROM seller_submissions s "
                + "LEFT JOIN users u ON s.user_id = u.user_id "
                + "ORDER BY s.id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                submissions.add(mapSubmission(rs));
            }
        }
        return submissions;
    }

    public SellerSubmissionModel getSubmissionById(int id) throws SQLException {
        String sql = "SELECT s.*, u.name AS seller_name "
                + "FROM seller_submissions s "
                + "LEFT JOIN users u ON s.user_id = u.user_id "
                + "WHERE s.id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapSubmission(rs);
            }
        }
        return null;
    }

    public boolean approveSubmission(int id, double finalPrice, String adminNote) throws SQLException {
        String sql = "UPDATE seller_submissions SET status = 'Approved', final_price = ?, admin_note = ? WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, finalPrice);
            stmt.setString(2, adminNote);
            stmt.setInt(3, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean rejectSubmission(int id, String adminNote) throws SQLException {
        String sql = "UPDATE seller_submissions SET status = 'Rejected', admin_note = ? WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, adminNote);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean listSubmissionInShop(int id) throws SQLException {
        SellerSubmissionModel submission = getSubmissionById(id);
        if (submission == null || submission.getFinalPrice() <= 0) {
            return false;
        }

        String insertProduct = "INSERT INTO products "
                + "(name, category, size, price, status) "
                + "VALUES (?, ?, ?, ?, 'Listed')";
        String updateSubmission = "UPDATE seller_submissions SET status = 'Listed' WHERE id = ?";

        try (Connection conn = DBConfig.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement productStmt = conn.prepareStatement(insertProduct);
                 PreparedStatement submissionStmt = conn.prepareStatement(updateSubmission)) {

                productStmt.setString(1, submission.getItemName());
                productStmt.setString(2, submission.getCategory());
                productStmt.setString(3, submission.getSize());
                productStmt.setDouble(4, submission.getFinalPrice());
                productStmt.executeUpdate();

                submissionStmt.setInt(1, id);
                submissionStmt.executeUpdate();

                conn.commit();
                return true;
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        }
    }

    public List<UserModel> getAllUsers() throws SQLException {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY user_id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        }
        return users;
    }

    public boolean updateUserRole(int userId, String role) throws SQLException {
        String sql = "UPDATE users SET role = ? WHERE user_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, role);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        }
    }

    public List<OrderModel> getAllOrders() throws SQLException {
        List<OrderModel> orders = new ArrayList<>();
        String sql = "SELECT o.*, u.name AS customer_name "
                + "FROM orders o "
                + "LEFT JOIN users u ON o.user_id = u.user_id "
                + "ORDER BY o.id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setDeliveryType(rs.getString("delivery_type"));
                order.setCreatedAt(rs.getString("created_at"));
                orders.add(order);
            }
        }
        return orders;
    }

    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        String sql = "UPDATE orders SET order_status = ? WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            return stmt.executeUpdate() > 0;
        }
    }

    private SellerSubmissionModel mapSubmission(ResultSet rs) throws SQLException {
        SellerSubmissionModel submission = new SellerSubmissionModel();
        submission.setId(rs.getInt("id"));
        submission.setUserId(rs.getInt("user_id"));
        submission.setSellerName(rs.getString("seller_name"));
        submission.setItemName(rs.getString("item_name"));
        submission.setCategory(rs.getString("category"));
        submission.setCondition(rs.getString("item_condition"));
        submission.setSize(rs.getString("size"));
        submission.setEstimatedPrice(rs.getDouble("estimated_price"));
        submission.setFinalPrice(rs.getDouble("final_price"));
        submission.setDropoffDate(rs.getString("dropoff_date"));
        submission.setDropoffTimeSlot(rs.getString("dropoff_time_slot"));
        submission.setPayoutInfo(rs.getString("payout_info"));
        submission.setStatus(rs.getString("status"));
        submission.setAdminNote(rs.getString("admin_note"));
        submission.setCreatedAt(rs.getString("created_at"));
        return submission;
    }
}
