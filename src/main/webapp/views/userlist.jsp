<%@ page import="main.webapp.models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.webapp.utils.ConnectionProvider" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <title>User List</title>
        <!-- Link to Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/userlist.css" rel="stylesheet">
    </head>
    <body>
    <div id="wrapper">
        <div style="text-align: center; font-size: 30px; color: #585861;">
            USER LIST
        </div>
        <table class="table table-bordered table-hover table-responsive-sm">
            <thead>
            <tr>
                <th class="tableHeadings">NAME</th>
                <th class="tableHeadings">EMAIL</th>
                <th class="tableHeadings">CONTACT</th>
                <th class="tableHeadings">DOMAIN</th>
                <th class="actions-column"></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td class="align-middle">${user.getName()}</td>
                        <td class="align-middle">${user.getEmail()}</td>
                        <td class="align-middle">${user.getContact()}</td>
                        <td class="align-middle">${user.getDomain()}</td>
                        <td class="actions-column">
                            <a href="<%= request.getContextPath() %>/RemoveUserController?email=${user.getEmail()}">Remove</a>
                            <a href="<%= request.getContextPath() %>/views/edit.jsp?email=${user.getEmail()}">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="add-user-link">
        <a href="<%= request.getContextPath() %>/views/registration.jsp" class="btn btn-primary">Add User</a>
    </div>
    <!-- Link to Bootstrap JS and Popper.js (if needed) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>