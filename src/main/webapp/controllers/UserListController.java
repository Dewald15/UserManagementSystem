package main.webapp.controllers;

import main.webapp.models.User;
import main.webapp.services.UserService;
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
        UserService userService = new UserService();
        request.setAttribute("userList", userService.getAllUsers());
        request.getRequestDispatcher("views/userlist.jsp").forward(request, response);
    }
}

