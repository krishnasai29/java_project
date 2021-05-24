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

<%
        try {
			String title = request.getParameter("title");
			String des = request.getParameter("des");
			String user = (String)session.getAttribute("un");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"ep","ep123");
			 String sql = "insert into survey values (seq_survey.nextval,?,?,?)";
			 PreparedStatement pst = con.prepareStatement(sql);
			    pst.setString(1, title);
			    pst.setString(2, des);
			    pst.setString(3, user);
			    int c = pst.executeUpdate();
			    System.out.println("Survey added");
			    if(c > 0) {
			    	response.sendRedirect("add-question.jsp");
			    }else {
			    	System.out.println("Unsucessfull");
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