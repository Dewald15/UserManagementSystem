<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobilenumber = request.getParameter("mobilenumber");
    String domain = request.getParameter("domain");

    try {
        Connection connection = ConnectionProvider.getConnection();
        PreparedStatement ps = connection.prepareStatement("insert into user value(?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobilenumber);
        ps.setString(4, domain);
        ps.executeUpdate();

        response.sendRedirect("registration.jsp?msg=valid");

    } catch (Exception e) {
        System.out.println("registeraction exception");
        System.out.println(e);
        response.sendRedirect("registration.jsp?msg=invalid");
    }
%>