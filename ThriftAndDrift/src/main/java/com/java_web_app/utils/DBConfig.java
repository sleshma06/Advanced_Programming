package com.java_web_app.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

    private static final String DEFAULT_DB_URL_3307 = "jdbc:mysql://localhost:3307/thriftanddrift?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DEFAULT_DB_URL_3306 = "jdbc:mysql://localhost:3306/thriftanddrift?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DB_URL = setting("THRIFTANDDRIFT_DB_URL", DEFAULT_DB_URL_3307);
    private static final String DB_USER = setting("THRIFTANDDRIFT_DB_USER", "root");
    private static final String DB_PASS = setting("THRIFTANDDRIFT_DB_PASS", "");

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver was not found. Check Maven dependencies.", e);
        }

        try {
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (SQLException firstError) {
            if (!DEFAULT_DB_URL_3307.equals(DB_URL)) {
                throw firstError;
            }

            try {
                return DriverManager.getConnection(DEFAULT_DB_URL_3306, DB_USER, DB_PASS);
            } catch (SQLException secondError) {
                firstError.addSuppressed(secondError);
                throw firstError;
            }
        }
    }

    private static String setting(String name, String fallback) {
        String systemValue = System.getProperty(name);
        if (systemValue != null && !systemValue.trim().isEmpty()) {
            return systemValue.trim();
        }

        String envValue = System.getenv(name);
        if (envValue != null && !envValue.trim().isEmpty()) {
            return envValue.trim();
        }

        return fallback;
    }
}
