package com.java_web_app.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    private static final int COST = 10;

    // Call this when registering a user
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(COST));
    }

    // Call this when logging in — compares plain text against stored hash
    public static boolean checkPassword(String plainPassword, String storedHash) {
        return BCrypt.checkpw(plainPassword, storedHash);
    }
}