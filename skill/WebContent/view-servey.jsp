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
<form method='post' action='SurveyAttempt.jsp'>
                        <%
                        try {
                        	String sid = request.getParameter("surveyid");
                        	String user = (String)session.getAttribute("un");
                			
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"ep","ep123");
                			System.out.println("Connected to database");
                			String sql = "select * from survey where username = ? and surveyid = ?";
                			 PreparedStatement ps = con.prepareStatement(sql) ;
                			 ps.setString(1,user);
                			 ps.setString(2,sid);
                			 ResultSet resultset =ps.executeQuery() ;
                			 
                		       while(resultset.next()){
                		        
                		        	%>
                		        	<center>
                		        	<h3><%= resultset.getString(2) %></h3>
                		        	<h4><%= resultset.getString(3) %></h4>
                		        	</center>
                		      <% }  
                        } catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
                        <hr>
                        
                         <%
                        try {
                        	int counter = 1;
                        	String sid = request.getParameter("surveyid");
                        	String user = (String)session.getAttribute("un");
                			
                        	session.setAttribute("sid", sid);
                        	
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"ep","ep123");
                			System.out.println("Connected to database");
                			String sql = "select * from question where username = ? and sid = ?";
                			 PreparedStatement ps = con.prepareStatement(sql) ;
                			 ps.setString(1,user);
                			 ps.setString(2,sid);
                			 ResultSet resultset =ps.executeQuery() ;
                			 
                		       while(resultset.next()){
                		        session.setAttribute("qid", resultset.getString(1));
                		        	%>
                		        	
                		        	<center>
                		        	<h3><%= resultset.getString(2) %></h3>

									<input type="radio" name="option<%= counter %>" value=" <%= resultset.getString(3) %>" >
									<label > <%= resultset.getString(3) %> </label>
									<input type="radio" name="option<%= counter %>" value=" <%= resultset.getString(4) %>" >
									<label > <%= resultset.getString(4) %> </label>
									<input type="radio" name="option<%= counter %>" value=" <%= resultset.getString(5) %>" >
									<label > <%= resultset.getString(5) %> </label>
									<input type="radio" name="option<%= counter %>" value=" <%= resultset.getString(6) %>">
									<label > <%= resultset.getString(6) %> </label>
									
									
                		      <% counter++;}  
                        } catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
                        <br/><br/>
                <input type="submit" value="Save">
									</center>
                </form>          
                        
</div>

</body>
</html>