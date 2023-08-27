package com.faithfunds;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Raofin
 */
public class DatabaseConnection {

    // Database credentials
    private static final String database = "FaithFunds";
    private static final String username = "zzz";
    private static final String password = "zzz";

    // JDBC URL for SQL Server connection
    private static final String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=" + database + ";encrypt=true;trustServerCertificate=true;";

    // Connection instance
    private static Connection connection;

    // Static initializer block - executed when the class is loaded
    static {
        try {
            // Load the SQL Server JDBC driver class
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns the established database connection.
     *
     * @return The database connection.
     */
    public static Connection getConnection() {
        return connection;
    }

    /**
     * Closes the database connection.
     */
    public static void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
