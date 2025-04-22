package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
   
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            return DriverManager.getConnection(
                PropertyUtil.getProperty("url"),
                PropertyUtil.getProperty("username"),
                PropertyUtil.getProperty("password")
            );
        } catch (ClassNotFoundException | SQLException ex) {
            throw new RuntimeException("Database connection failed", ex);
        }
    }
    
    public static void closeConnection(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }
}