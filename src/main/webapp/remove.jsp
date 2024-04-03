<%@page import="main.webapp.Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = request.getParameter("email");
    Connection connection = null;
    try {
        connection = ConnectionProvider.getConnection();
        Statement st = connection.createStatement();
        st.executeUpdate("delete from user where email = '" + email + "'");
        connection.close();
        response.sendRedirect("userlist.jsp");

    } catch (Exception e) {
        System.out.println(e);
        connection.close();
        response.sendRedirect("userlist.jsp");
    }
%>