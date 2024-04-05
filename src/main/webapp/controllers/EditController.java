package main.webapp.controllers;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import main.webapp.services.UserService;

@WebServlet("/EditController")
public class EditController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobilenumber");
        String domain = request.getParameter("domain");

        UserService userService = new UserService();
        boolean success = userService.updateUser(name, email, mobile, domain);

        if (success) {
            response.sendRedirect("views/edit.jsp?msg=valid&email=" + email);
        } else {
            response.sendRedirect("views/edit.jsp?msg=invalid&email=" + email);
        }
    }
}