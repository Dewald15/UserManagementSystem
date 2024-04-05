package main.webapp.controllers;

import main.webapp.utils.ConnectionProvider;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/RemoveUserController")
public class RemoveUserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        try (Connection connection = ConnectionProvider.getConnection();
             Statement st = connection.createStatement()) {
            st.executeUpdate("delete from user where email = '" + email + "'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("UserListController");
    }
}
