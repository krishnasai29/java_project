<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel='stylesheet' href='style.css'>
<style>
body{
background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('a2.jpg');
	background-size: cover;
	
	
	}
	h2{
		color:green;
		font-family: monospace;
	}
	table{
		width: 50%;
		height: 100%;
	}
	table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	}
	th, td {
	padding: 5px;
	text-align: left;
	}
	a{
		text-decoration:none;
	}
	.right{
		float:right;
	}
</style>
</head>
<body>
<b>
<ul >
  <li><a href="home.jsp">Home</a></li>
  <li><a href="#">News</a></li>
  
  <li class="dropdown">
    <a href="" class="dropbtn">Survey</a>
    <div class="dropdown-content">
      <a href="#">Create Survey</a>
      <a href="#">View Survey</a>
    </div>
  </li>
  <li><a  href="contact.jsp">Contact</a></li>
  <li class='right'><a   href="Logout">Logout</a></li>
  <li class='right'><a   href="profile.jsp">Profile</a></li>
  
	
</ul>
</b>
        <h2> Profile</h2>
        <table>
        <% 
 
		try {
			String  username = (String)session.getAttribute("un");
		     
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","ep","ep123");
			
			String sql = "select * from registerr where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
        	<tr>
				<th>UserName</th>
				<td><%= rs.getString(1) %></td>
			</tr>
			<tr>
					<th>Email</th>
					<td><%= rs.getString(2) %></td>
			</tr>
			<tr>
					<th>Phone Number</th>
					<td><%= rs.getString(3) %></td>
			</tr>
			<tr>
					<th>Password</th>
					<td><%= rs.getString(4) %></td>
			</tr>
			
		<%	
			break;
			}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
	</table>
		<a href='updateProfile.jsp'>Update Profile</a>
</body>
</html>