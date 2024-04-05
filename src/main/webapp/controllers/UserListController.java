package main.webapp.controllers;

import main.webapp.models.User;
import main.webapp.utils.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UserListController")
public class UserListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = new ArrayList<>();
        try (Connection connection = ConnectionProvider.getConnection();
             Statement st = connection.createStatement();
             ResultSet rs = st.executeQuery("select * from user")) {
            while (rs.next()) {
                User user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setContact(rs.getString("mobile"));
                user.setDomain(rs.getString("domain"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("views/userlist.jsp").forward(request, response);
    }
}

