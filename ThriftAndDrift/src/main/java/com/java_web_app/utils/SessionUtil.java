package com.java_web_app.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import com.java_web_app.model.UserModel;

public class SessionUtil {

   

    // Store full user object in session called after successful user login
    public static void createUserSession(HttpServletRequest request, UserModel user, int seconds) {
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        session.setMaxInactiveInterval(seconds);
    }

 
    // Get the full user object from session
    public static UserModel getUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (UserModel) session.getAttribute("user");
    }

    // Get any attribute from session by key
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(key) : null;
    }

    // Set any attribute in session 
    public static void setAttribute(HttpServletRequest request, String key, Object value, int seconds) {
        HttpSession session = request.getSession(true);
        session.setAttribute(key, value);
        session.setMaxInactiveInterval(seconds);
    }

  

    // Check if a regular user is logged in
    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("user") != null;
    }

 

    // Remove one specific attribute 
    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) session.removeAttribute(key);
    }

    // Destroy entire session  called on logout
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) session.invalidate();
    }
}