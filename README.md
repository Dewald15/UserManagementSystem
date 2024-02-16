User Managerment System (Java, JDBC, MySQL, Servlet)

First step: Implementing the JDBC JAR file and database connection

	-Create a java connection class (ConnectionProvider.java)
	-Create static Connection method:
		- Load and initialize a JDBC driver to register with the DriverManager (for mySQL): 		Class.forName("com.mysql.cj.jdbc.Driver");
		- Create a Connection class object that will contain the object of the database: 		Connection con = DriverManager.getConnection(url, username, password);
		- Add mySQL JAR file to project library (download mysql-connector-j-8.3.0) 
			- JAR file is the MySQL JDBC driver for Java. When you add this JAR file to 
			your project, it provides the necessary classes and functionality to connect 
			your Java application to a MySQL database.
	
	-Create mySQL Database:
		create database uuu;
		use uuu;
		create table user
		(name varchar(50), email varchar(50), mobile int(10), domain varchar(50));

	- Create registration.jsp where a user can be added to the database and displays the user list.
	- The add user form submit action redirects to registrationaction.jsp
	- Create registrationaction.jsp to execute the SQL query to add a user to the database.
		- Get form parameters:										String name = request.getParameter("name");
		- Call getConnection() method from ConnectionProvider class to create Connection object		Connection connection = ConnectionProvider.getConnection();
		- Create a PreparedStatement object for sending parameterized SQL statements to the database	PreparedStatement ps = connection.prepareStatement("insert into user value(?,?,?,?)");
		- use PreparedStatement object to set the designated parameter to the given Java String value	ps.setString(1, name);
		- execute the query: 										ps.executeUpdate();
		- redirect to registration.jsp:									response.sendRedirect("registration.jsp?msg=valid");
	- in registration.jsp, add functionality to get the "msg" parameter value:				String msg = request.getParameter("msg");
		- check if valid or invalid to display appropriate message: 					<%
                    													String msg = request.getParameter("msg");
                    													if ("valid".equals(msg)) {
                												%>
                												<h1>Successfully Registered !</h1>

                												<%}%>
                												<%

                    													if ("invalid".equals(msg)) {
                												%>
														<h1>Something Went Wrong! Try Again !</h1>
                												<%}%>
	- 


	
