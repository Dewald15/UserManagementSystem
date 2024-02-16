<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobilenumber");
    String domain = request.getParameter("domain");

    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='" + email + "'");
         // email should be unique so no need for while loop
         // while (rs.next()) {
            st.executeUpdate("update user set name='" + name + "', mobile='" + mobile + "', domain='" + domain + "' where email='" + email + "'");
            response.sendRedirect("edit.jsp?msg=valid&email="+ email);
         // }

    } catch (Exception e) {
        System.out.println("editaction exception");
        response.sendRedirect("edit.jsp?msg=invalid&email="+ email);
        System.out.println(e);
    }
%>