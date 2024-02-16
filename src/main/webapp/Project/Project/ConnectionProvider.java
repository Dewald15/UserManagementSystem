package Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
//            String url = "jdbc:mysql://localhost:3306/uuu"; // Establish a connection to the MySQL database
//            String username = "root";
//            String password = "160991";
            String url = "jdbc:mysql://sql8.freesqldatabase.com:3306/sql8684532"; // Establish a connection to the MySQL database
            String username = "sql8684532";
            String password = "vRNNaS4tDw";
            Connection connection = DriverManager.getConnection(url, username, password); // Perform database operations using the 'connection' object
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
