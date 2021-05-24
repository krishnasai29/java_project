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
<title>Update Profile</title>
<link rel='stylesheet' href='style.css'>
<style>
body{
background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('a2.jpg');
background-size: cover;
height: 93vh;
}
	.right{
	float:right;
}
a{
		text-decoration:none;
	}
</style>
</head>
<body>
<b>
<ul>
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
   
        <% 
 
		try {
			String  username = request.getParameter("uname");
		     String password = request.getParameter("pword");
		     String email = request.getParameter("email");
		     String phnum = request.getParameter("phnum");
		    
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","ep","ep123");
			
			String sql = "update registerr set email = ?, mobile = ?, password = ? where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, phnum);
			pstmt.setString(3, password);
			pstmt.setString(4, username);
	
			int count = pstmt.executeUpdate();
				
				if(count>0){
					out.println("<h3>Successfully updated Profile</h3>");
					out.println("<h3>View Profile <a href='profile.jsp'>here.</a></h3>");
				} else {
					out.println("<h3>update failed</h3>");
				}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		%>
</body>
</html>