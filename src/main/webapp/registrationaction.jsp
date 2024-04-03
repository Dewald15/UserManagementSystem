<%@page import="main.webapp.Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobilenumber = request.getParameter("mobilenumber");
    String domain = request.getParameter("domain");
    boolean emailExists = false;
    Connection connection = null;

    try {
        connection = ConnectionProvider.getConnection();

        // Check if the email already exists
        PreparedStatement checkEmailPs = connection.prepareStatement("SELECT * FROM user WHERE email = ?");
        checkEmailPs.setString(1, email);
        ResultSet resultSet = checkEmailPs.executeQuery();

        if (resultSet.next()) {
            emailExists = true;
            throw new SQLException("Email already exists");
        }

        PreparedStatement ps = connection.prepareStatement("insert into user value(?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobilenumber);
        ps.setString(4, domain);
        ps.executeUpdate();

        connection.close();
        response.sendRedirect("registration.jsp?msg=valid&email="+ email + "&name=" + name + "&mobilenumber=" + mobilenumber + "&domain=" + domain);
    }
    catch (Exception e) {
        if(emailExists) {
            System.out.println(e);
            connection.close();
            response.sendRedirect("registration.jsp?msg=invalidEmail&email="+ email + "&name=" + name + "&mobilenumber=" + mobilenumber + "&domain=" + domain);
        } else {
            System.out.println(e);
            connection.close();
            response.sendRedirect("registration.jsp?msg=invalid&email="+ email + "&name=" + name + "&mobilenumber=" + mobilenumber + "&domain=" + domain);
        }
    }
%>