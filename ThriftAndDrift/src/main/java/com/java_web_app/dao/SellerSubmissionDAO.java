package com.java_web_app.dao;

import com.java_web_app.model.SellerSubmissionModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SellerSubmissionDAO {

    public boolean addSubmission(SellerSubmissionModel submission) throws SQLException {
        String sql = "INSERT INTO seller_submissions "
                + "(user_id, item_name, category, item_condition, size, estimated_price, "
                + "dropoff_date, dropoff_time_slot, payout_info, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, submission.getUserId());
            stmt.setString(2, submission.getItemName());
            stmt.setString(3, submission.getCategory());
            stmt.setString(4, submission.getCondition());
            stmt.setString(5, submission.getSize());
            stmt.setDouble(6, submission.getEstimatedPrice());
            stmt.setString(7, emptyToNull(submission.getDropoffDate()));
            stmt.setString(8, submission.getDropoffTimeSlot());
            stmt.setString(9, submission.getPayoutInfo());
            stmt.setString(10, "Submitted");
            return stmt.executeUpdate() > 0;
        }
    }

    private String emptyToNull(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value;
    }
}
