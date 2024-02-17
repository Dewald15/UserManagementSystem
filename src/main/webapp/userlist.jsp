<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

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
        <style>
            body {
                font-size: 16px;
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #f8f9fa;
            }
            #wrapper {
                font-size: 16px;
                margin: 20px;
            }
            table {
                width: 100%;
                margin-top: 30px;
                margin-bottom: 20px;
            }
            .UserListHeading {
                font-size: 18px;
            }
            .tableHeadings {
                font-size: 16px;
            }
            th {
                text-align: center;
                font-size: 20px;
                background-color: #585861;
                color: #fff;
            }
            td {
                text-align: center;
            }
            .align-middle {
                vertical-align: middle !important; /* Important to override Bootstrap styles */
            }
            .actions-column a {
                display: inline-block;
                margin: 5px;
                padding: 8px 15px;
                text-align: center;
                text-decoration: none;
                color: #fff;
                background-color: #007bff;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .actions-column a:hover {
                background-color: #0056b3;
            }
            .add-user-link {
                text-align: center;
                margin-bottom: 50px;
            }
            .add-user-link a {
                font-size: 17px;
                padding: 8px 15px;
                text-align: center;
                text-decoration: none;
                color: #fff;
                background-color: #007bff;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .add-user-link a:hover {
                background-color: #0056b3;
            }
        </style>
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
                    <%@page import="java.sql.*" %>
                    <%@page import="Project.ConnectionProvider"%>
                    <%
                        try {
                            Connection connection = ConnectionProvider.getConnection();
                            Statement st = connection.createStatement();
                            ResultSet rs = st.executeQuery("select * from user");
                            while (rs.next()) {
                    %>
                    <tr>
                        <td class="align-middle"><%= rs.getString(1) %></td>
                        <td class="align-middle"><%= rs.getString(2) %></td>
                        <td class="align-middle"><%= rs.getString(3) %></td>
                        <td class="align-middle"><%= rs.getString(4) %></td>
                        <td class="actions-column">
                            <a href="remove.jsp?email=<%= rs.getString(2) %>">Remove</a>
                            <a href="edit.jsp?email=<%= rs.getString(2) %>&name=<%= rs.getString(1) %>&mobilenumber=<%= rs.getString(3) %>&domain=<%= rs.getString(4) %>">Edit</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="add-user-link">
            <a href="registration.jsp" class="btn btn-primary">Add User</a>
        </div>
        <!-- Link to Bootstrap JS and Popper.js (if needed) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>