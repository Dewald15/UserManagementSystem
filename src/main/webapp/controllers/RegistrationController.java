package main.webapp.controllers;

import main.webapp.services.UserService;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobilenumber");
        String domain = request.getParameter("domain");

        UserService userService = new UserService();
        String result = userService.registerUser(name, email, mobileNumber, domain);

        if (result.equals("success")) {
            response.sendRedirect(request.getContextPath() + "/views/registration.jsp?msg=valid&email="+ email + "&name=" + name + "&mobilenumber=" + mobileNumber + "&domain=" + domain);
        } else if (result.equals("invalidEmail")) {
            response.sendRedirect("views/registration.jsp?msg=invalidEmail&email="+ email + "&name=" + name + "&mobilenumber=" + mobileNumber + "&domain=" + domain);
        } else {
            response.sendRedirect("views/registration.jsp?msg=invalid&email="+ email + "&name=" + name + "&mobilenumber=" + mobileNumber + "&domain=" + domain);
        }
    }
}