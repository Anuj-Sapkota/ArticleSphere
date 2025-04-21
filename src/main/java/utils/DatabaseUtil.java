package utils;

import java.sql.*;

public class DatabaseUtil {
    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3306/articlesphere";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Failed to load MySQL driver", e);
        }
    }

    // Method to get a connection using the predefined credentials
    public static Connection getConnection() throws SQLException {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new SQLException("Failed to connect to the database: " + e.getMessage(), e);
        }
    }

    // Optional: Getter methods for URL, USER, PASSWORD if needed elsewhere
    public static String getUrl() {
        return URL;
    }

    public static String getUser() {
        return USER;
    }

    public static String getPassword() {
        return PASSWORD;
    }
}