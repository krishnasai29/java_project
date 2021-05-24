<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
background-color:gainsboro; 
   background-image: url('hh2.jpg');
	background-size: cover;
	height: 93vh;}
	.right{
		float : right;
		}
		
		
	.content form{
	 width: 370px;
    position: absolute;
    top: 40%;
  left: 50%;
  transform: translate(-50%,-50%);
  color:mistyrose;
	}
	.content input[type="text"]{
  border: none;
  outline: none;
  background: none;
   color: white;
  font-size: 18px;
  width: 80%;
  float: left;
  margin: 0 10px;
   border-bottom: 2px solid dodgerblue;
}
textarea
{
  width:100%;
  box-sizing: border-box;
  box-shadow: none;
    outline: none;
    border: none;
    background:none;
    border-bottom: 2px solid dodgerblue;
}
.btn{
  width: 40%;
 background:none;
  border: 2px solid cyan;
  color: brown;
  padding: 5px;
  font-size: 13px;
  cursor: pointer;
  margin: 12px 0;
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
	<form action="create-suvey-dba.jsp" method="post">
	<div class="login-box"><br/>
		<label for="title"> Survey Title</label><br/><br/>
		<input type="text" name="title" id="title" placeholder="Enter Title"><br/><br/><br/><br/>
		<label for="des">Enter Survey Description</label>
		<textarea name="des" id="des" rows="7" columns="35">
		</textarea><br/><br/><br/>
		<input type="submit" class="btn" value="Create Survey">
		</div>
	</form>



</div>

</body>
</html>