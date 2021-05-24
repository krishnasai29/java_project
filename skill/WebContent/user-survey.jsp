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
<title>User Survey's</title>
<link rel="stylesheet" href="style.css">
<style>
body{
background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('hh2.jpg');
	background-size: cover;
	height: 93vh;
}
.right{
		float : right;
		}
</style>
</head>
<body>
<ul >
  <b>
  <li><a href="home.jsp">Home</a></li>
  <li><a href="#">News</a></li>
  <li class="dropdown">
    <a href="" class="dropbtn">Survey</a>
    <div class="dropdown-content">
      <a href="create-survey.jsp">Create Survey</a>
      <a href="#">View Survey</a>
    </div>
  </li>
  <li><a href="#">About</a></li>
  <li><a   href="contact.jsp">Contact</a></li>
  <li class='right'><a   href="Logout">Logout</a></li>
   <li class='right'><a   href="profile.jsp">Profile</a></li>
  </b>
</ul>

<div class="content" >
<h3 style="color:whitesmoke">Your Survey's</h3>
                        <%
                        try {
                        	String user = (String)session.getAttribute("un");
                			
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"ep","ep123");
                			System.out.println("Connected to database");
                			String sql = "select surveytitle,surveyid from survey where username = ?";
                			 PreparedStatement ps = con.prepareStatement(sql) ;
                			 
                			 ps.setString(1,user);
                			 ResultSet resultset =ps.executeQuery() ;
                			 
                		       while(resultset.next()){
                		        
                		        	String sid = resultset.getString(2);
                		        	session.setAttribute("sid", sid); 
                		        	
                		        	%>
                		        	
                		        	<h3><a href="view-servey.jsp?surveyid=<%= resultset.getString(2) %>"><%= resultset.getString(1) %></a></h3>
                		        	
                		      <% }  
                		       
                        } catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
</div>

</body>
</html>