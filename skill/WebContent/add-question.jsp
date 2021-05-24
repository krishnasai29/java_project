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
<title>Create Survey</title>
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
	<form method="post"  action='add-question-dba.jsp'>
<hr>
						<center>
                      <label for="title"> Select Title  </label></center>
                    <div>
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
                			 %>
                			 <center>
                			 <br/><br/>
                			 <select name="title" id="title">
                			 		<option>Select Survey</option>
                		        <%  while(resultset.next()){
                		        
                		        	String sid = resultset.getString(2);
                		        	session.setAttribute("sid", sid); 
                		        	%>
                		            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
                		        <% } %>
                		        </select>
                		        </center>
   						<% 
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
                    </div>
                    <center>
                    <div class="questions" >
                    <br/>
                    <label id="question">Enter Question</label><br/>
                    <textarea name="question" id="quesion" rows="4" columns="10"></textarea>
                    <br/>
                    Option 1 : <input type="text" name="option1" id="option1"><br/><br/>
                     Option 2 : <input type="text" name="option2" id="option2"><br/><br/>
                      Option 3 : <input type="text" name="option3" id="option3"><br/><br/>
                       Option 4 : <input type="text" name="option4" id="option4"><br/><br/>
                    
                    </div>
 
                    <input type="submit" value="Add">
					</center>
                </form>



</div>

</body>
</html>