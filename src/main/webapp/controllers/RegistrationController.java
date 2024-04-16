package controllers;

import main.webapp.models.User;
import services.UserService;
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

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setContact(mobileNumber);
        user.setDomain(domain);
        request.setAttribute("user", user);

        if (result.equals("success")) {
            request.getRequestDispatcher("/views/registration.jsp?msg=valid").forward(request, response);
        } else if (result.equals("invalidEmail")) {
            request.getRequestDispatcher("/views/registration.jsp?msg=invalidEmail").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/registration.jsp?msg=invalid").forward(request, response);
        }
    }
}
