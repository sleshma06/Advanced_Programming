package com.java_web_app.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

    private static final String DB_URL  = "jdbc:mysql://localhost:3307/thriftanddrift?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver was not found. Check Maven dependencies.", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }
}
