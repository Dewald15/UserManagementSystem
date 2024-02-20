<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobilenumber");
    String domain = request.getParameter("domain");
    Connection connection = null;

    try {
        connection = ConnectionProvider.getConnection();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='" + email + "'");
        st.executeUpdate("update user set name='" + name + "', mobile='" + mobile + "', domain='" + domain + "' where email='" + email + "'");
        response.sendRedirect("edit.jsp?msg=valid&email="+ email + "&name=" + name + "&mobilenumber=" + mobile + "&domain=" + domain);
        connection.close();
    } catch (Exception e) {
        response.sendRedirect("edit.jsp?msg=invalid&email="+ email + "&name=" + name + "&mobilenumber=" + mobile + "&domain=" + domain);
        System.out.println(e);
        connection.close();
    }
%>