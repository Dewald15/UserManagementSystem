<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = request.getParameter("email");
    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        st.executeUpdate("delete from user where email = '" + email + "'");
        response.sendRedirect("userlist.jsp");
    } catch (Exception e) {
        System.out.println(e);
    }
%>