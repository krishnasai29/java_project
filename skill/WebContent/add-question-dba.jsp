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
			String question = request.getParameter("question");
			String option1 = request.getParameter("option1");
			String option2 = request.getParameter("option2");
			String option3 = request.getParameter("option3");
			String option4 = request.getParameter("option4");
			String sid = (String)session.getAttribute("sid");
			String user = (String)session.getAttribute("un");
			String ans = " ";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"ep","ep123");
			 String sql = "insert into question values (seq_question.nextval,?,?,?,?,?,?,?,?)";
			 PreparedStatement pst = con.prepareStatement(sql);
			    pst.setString(1, question);
			    pst.setString(2, option1);
			    pst.setString(3, option2);
			    pst.setString(4, option3);
			    pst.setString(5, option4);
			    pst.setString(6, ans);
			    pst.setString(7, sid);
			    pst.setString(8, user);
			    int c = pst.executeUpdate();
			    System.out.println("Question added");
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