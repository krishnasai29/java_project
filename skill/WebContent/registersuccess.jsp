<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    
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
	p{
	color: #fff;
	text-align: center;
	
	font-size: 30px;
	
	font-family:tahoma;
}

.button {
        
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
}

.btn{
	background-color: #fff;
	border: 1px solid  #fff;
	border-radius: 25px;
	padding: 10px 30px;
	color: peru;
	text-decoration: none;
}
.imgA1{
  top: 45px;
  left: 45px;
  width:250px;
  z-index: 3;
}

</style>
</head>
<body>
<ul >
  <li><a href="home.jsp">Home</a></li>
  <li><a href="#">News</a></li>
  <li><a   href="contact.jsp">Contact</a></li>
 <li><a href="#">About</a></li>
  </ul>
<h1 style="color:black;align:center;"><%
		out.println("user added succesful");
		
		%>
		</h1>


	<img class="imgA1" src="https://www.timeshighereducation.com/sites/default/files/hands-being-raised-for-survey-illustration.jpg">
		<br/><br/>
		
		<div class="button">
			
			<a href="login.html" class="btn">Click here to LOGIN</a>
		</div>


</body>
</html>