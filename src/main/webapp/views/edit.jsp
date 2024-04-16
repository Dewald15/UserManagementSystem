<%@ page import="main.webapp.models.User" %>
<%@ page import="services.UserService" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit User Details</title>
        <!-- Link to Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/css/edit.css" rel="stylesheet">
    </head>
    <body>
        <div class="main-container">
            <div style="text-align: center; font-size: 30px; color: #585861;">
                EDIT USER
            </div>
            <div id="container">
                <%
                    String email = request.getParameter("email");
                    UserService userService = new UserService();
                    User user = userService.getUserByEmail(email);
                %>
                <div class='signup'>
                    <form action="<%= request.getContextPath() %>/EditController?email=<%= user.getEmail() %>" method="post">
                    <div class='editEmail'>Email: <%out.println(email);%></div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="name" placeholder="Enter Name" value="<%= user.getName() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="mobilenumber">Mobile Number</label>
                            <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" value="<%= user.getContact() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="domain">Domain</label>
                            <input type="text" name="domain" placeholder="Enter Domain" value="<%= user.getDomain() %>" required>
                        </div>
                        <div class="buttons-container">
                            <input type="submit" value="Submit" class="btn btn-primary">
                            <a href="<%= request.getContextPath() %>/UserListController" class="btn btn-primary">User List</a>
                        </div>
                    </form>
                </div>
                <div class='whysign'>
                    <%
                        String msg = request.getParameter("msg");
                        if ("valid".equals(msg)) {
                    %>
                        <h3 class="valid">Successfully Changed!</h3>
                    <%}%>
                    <% if ("invalid".equals(msg)) { %>
                        <h3 class="invalid">Something Went Wrong!</h3>
                    <%}%>
                </div>
            </div>
        </div>
        <!-- Link to Bootstrap JS and Popper.js (if needed) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>