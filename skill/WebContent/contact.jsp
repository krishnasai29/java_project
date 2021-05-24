<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
 <style type="text/css">
   body{
    background-color:gainsboro; 
   background-image: url('a2.jpg');
	background-size: cover;
	height: 93vh;
    background-size: cover;
   }
.box{
  position: absolute;
  top:55%;
  left:50%;
  transform: translate(-50%,-50%);
  width: 380px;
  background: url(call.jpg);
  padding:60px;
  box-sizing: border-box;
  border:1px solid rgba(0,0,0,.1);
  box-shadow: 0 5px 10px rgba(0,0,0,.2); 
}
.box h2
{
  margin: 0 0 40px;
  padding: 0;
  color:#f7497d;
  text-transform: uppercase;
}
.box textarea
{
  height: 80px;
  padding: 10px 0;
  margin-bottom: 40px;
  
}
.box input,
.box textarea
{
  width:100%;
  box-sizing: border-box;
  box-shadow: none;
    outline: none;
    border: none;
    background:none;
    border-bottom: 2px solid #999;
}
.box textarea{
  margin-bottom: 20px;
}



.button {
  background-color:#f7497d ; 
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 2px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s;
  transition-duration: 0.4s;
}

image{
  width: 100%;
}

.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
.right{
	float:right;
}
 </style>
</head>
<body>
<ul>
  <b>
  <li><a href="home.jsp">Home</a></li>
  <li><a href="#news">News</a></li>
  <li class="dropdown">
    <a href="" class="dropbtn">Survey</a>
    <div class="dropdown-content">
      <a href="">Create survey</a>
      <a href="">view survey</a>
    </div>
  </li>
  <li><a  href="Contact">Contact</a></li>
  <li class='right'><a   href="Logout">Logout</a></li>
   <li class='right'><a   href="profile.jsp">Profile</a></li>
</ul></b>
<br/>
<br/>
<br/><br/><br/><br/><br/><br/><br/><br/>
  <div class="box">
    <h2>contact</h2>
    <form method="post" action="Contact"/>
      <div class="inputBox">
        <input type="text" name="name" placeholder="name" required="">
      </div>
      <br/>
      <div class="inputBox">
        <input type="email" name="email" placeholder="email " required="">
      </div>
      <br/>
      <div class="inputBox">
        <input type="text" name="subject" placeholder="subject" required="">
      </div>
      <br/>
      <div>
        <textarea  name="message" required="" > </textarea>
        <h5>write message</h5>
      </div>
      <div>
     <button class="button button2">Submit</button>
    </div>
    </form>
  </div>
  
		
</body>
</html>
