<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Details</title>
        <!-- Link to Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/registration.css" rel="stylesheet">
        <link href="../resources/css/registration.css" rel="stylesheet">
    </head>
    <body>
        <div class="main-container">
            <div style="text-align: center; font-size: 30px; color: #585861;">
                ADD USER
            </div>
            <div id='container'>
                <div class='signup'>
                    <form action="<%= request.getContextPath() %>/RegistrationController" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" placeholder="Enter Name" value="<c:out value="${user.name}" />" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email" placeholder="Enter Email" value="<c:out value="${user.email}" />" required>
                        </div>
                        <div class="form-group">
                            <label for="mobilenumber">Mobile Number</label>
                            <input type="text" id="mobilenumber" name="mobilenumber" placeholder="Enter Mobile Number" value="<c:out value="${user.contact}" />" required>
                        </div>
                        <div class="form-group">
                            <label for="domain">Domain</label>
                            <input type="text" id="domain" name="domain" placeholder="Enter Domain" value="<c:out value="${user.domain}" />" required>
                        </div>
                        <div class="buttons-container">
                            <input type="submit" value="Submit" class="btn btn-primary">
                            <a href="<%= request.getContextPath() %>/UserListController" class="btn btn-primary">User List</a>
                        </div>
                    </form>
                </div>
                <div class='whysign'>
                    <% String msg = request.getParameter("msg");
                    if ("valid".equals(msg)) { %>
                    <h3 class="valid">Successfully Registered!</h3>
                    <% } if ("invalid".equals(msg)) { %>
                    <h3 class="invalid">Something Went Wrong!</h3>
                    <% } if ("invalidEmail".equals(msg)) { %>
                    <h3 class="invalid">Email already exists!</h3>
                    <% } %>
                </div>
            </div>
        </div>
        <!-- Link to Bootstrap JS and Popper.js (if needed) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
