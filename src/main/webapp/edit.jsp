<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User Details</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
            overflow-y: auto;
        }
        .main-container {
            position: absolute;
            top: 20px;
            bottom: 0;
            left: 0;
            right: 0;
            overflow: auto;
        }
        #container {
            font-size: 30px;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .editEmail {
            text-align: center;
            color: #585861;
            font-size: 23px;
            padding: 15px;
        }

        .signup form {
            font-size: 20px;
            text-align: left;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="number"] {
            font-size: 18px;
            padding: 10px;
            width: 100%;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        input[type="submit"],
        a.btn {
            font-size: 17px;
            padding: 8px 15px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #007bff;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover,
        a.btn:hover {
            background-color: #0056b3;
        }
        .whysign {
            font-size: 22px;
        }
        h3 {
            margin-bottom: 20px;
            text-align: center;
        }
        .valid {
            color: #32e352;
        }
        .invalid {
            color: #e34444 !important;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .buttons-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

    </style>
</head>
<body>
    <div class="main-container">
        <div style="text-align: center; font-size: 30px; color: #585861;">
            EDIT USER
        </div>
        <div id="container">
            <%
                String email = request.getParameter("email");
            %>
            <div class='signup'>
                <form action="editaction.jsp?email=<%= email %>" method="post">
                <div class='editEmail'>Email: <%out.println(email);%></div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" placeholder="Enter Name" required>
                    </div>
                    <div class="form-group">
                        <label for="mobilenumber">Mobile Number</label>
                        <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
                    </div>
                    <div class="form-group">
                        <label for="domain">Domain</label>
                        <input type="text" name="domain" placeholder="Enter Domain" required>
                    </div>
                    <div class="buttons-container">
                        <input type="submit" value="Submit" class="btn btn-primary">
                        <a href="userlist.jsp" class="btn btn-primary">User List</a>
                    </div>
                </form>
            </div>
            <div class='whysign'>
                <%
                    String msg = request.getParameter("msg");
                    if ("valid".equals(msg)) {
                %>
                    <h3 class="valid">Successfully Edited!</h3>
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