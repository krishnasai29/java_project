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
<% 
try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("loaded");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",	"ep","ep123");
			System.out.println("connecteded");
			String user = (String)session.getAttribute("un");
			String ans = request.getParameter("option");
			String qid =  (String)session.getAttribute("qid");
			String sid =  (String)session.getAttribute("sid");
			
			String sql = "update question set answer = ? where qid = ? and sid = ? and username = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, ans);
			ps.setString(2, qid);
			ps.setString(3, sid);
			ps.setString(4, user);
			
			 ps.executeUpdate();
			
			
			response.sendRedirect("user-survey.jsp");
				
			
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