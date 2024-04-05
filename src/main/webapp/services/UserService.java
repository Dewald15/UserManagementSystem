package main.webapp.services;

import main.webapp.models.User;
import main.webapp.utils.ConnectionProvider;

import java.sql.*;

public class UserService {
    public String registerUser(String name, String email, String mobileNumber, String domain) {
        Connection connection = null;

        try {
            connection = ConnectionProvider.getConnection();

            PreparedStatement checkEmailPs = connection.prepareStatement("SELECT * FROM user WHERE email = ?");
            checkEmailPs.setString(1, email);
            ResultSet resultSet = checkEmailPs.executeQuery();

            if (resultSet.next()) {
                return "invalidEmail";
            }

            PreparedStatement ps = connection.prepareStatement("INSERT INTO user VALUES (?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobileNumber);
            ps.setString(4, domain);
            ps.executeUpdate();

            connection.close();
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public User getUserByEmail(String email) {
        Connection connection = null;

        try {
            connection = ConnectionProvider.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email = ?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                System.out.println(resultSet.getString("name"));
                User user = new User();
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setContact(resultSet.getString("mobile"));
                user.setDomain(resultSet.getString("domain"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return null; // Return null if no user found with the given email
    }

    public boolean updateUser(String name, String email, String mobile, String domain) {
        Connection connection = null;

        try {
            connection = ConnectionProvider.getConnection();
            Statement st = connection.createStatement();
            st.executeUpdate("update user set name='" + name + "', mobile='" + mobile + "', domain='" + domain + "' where email='" + email + "'");
            connection.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
            return false;
        }
    }
}