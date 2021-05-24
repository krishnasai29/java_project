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
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
  
  body{
    background-color:white;
  }
.klu .col-container {
  display: flex;
  width: 100%;
}
.klu .col {
  flex: 1;
  padding: 16px;
}


.mySlides {display: none;}
.slideshow-container {
   width:100%;
  
  position: relative;
  margin: auto;
  
    
}

.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 10px;
  width: 100%;
  text-align: left;
}
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 10px;
}
.picture img{
  width: 100%;
  padding-bottom: 0px;
  padding-top: 100px;
}

.c img{
  width: 500px;
  border-radius: 50%;
}
.c{
  padding-right: 160px;
}
.c .button{
  background-color: green;
  border:none;
  color:white;
  padding:10px 15px;
  text-decoration: none;
  display:flex;
  text-align: center;
  font-size: 16px;
  margin:4px 2px;
 

}

.kl .flip-card {
  background-color: transparent;
  width: 300px;
  height: 300px;
  perspective: 1000px;
}

.kl .flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
  
}

.kl .flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

.kl .flip-card-front, .flip-card-back {
  position:absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.kl .flip-card-front {
  background-color: #bbb;
  color: black;
}

.kl .flip-card-back {
  
  color: black;
  transform: rotateY(180deg);
}

.klu .col{
  display:inline-block;
}
.even .column {
  float: left;
  width: 32%;
  margin-bottom: 16px;
  padding: 8px 8px;
}

@media screen and (max-width: 650px) {
  .even .column {
    width: 100%;
    display: block;
  }
}

.even .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.even .container {
  padding: 0 16px;
}

.even .container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.even .button {
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

.even .button:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

.abcd .button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 4px 2px;
  cursor: pointer;
}
.abcd .button:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}


.zoom {
  padding: 30px;
  
  transition: transform .2s;
  width: 250px;
  height: 70px;
  margin: 7px auto;
}

.zoom:hover {
  -ms-transform: scale(1); /* IE 9 */
  -webkit-transform: scale(0.5); /* Safari 3-8 */
  transform: scale(1.2); 
}
.right{
	float:right;
}
.oracle .column {
  float:left;
  width: 35%;
  margin-bottom: 20px;
  padding: 100px 25px;
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
      <a href="add-question.jsp">Add Questions</a>
      <a href="user-survey.jsp">Your Survey's</a>
    </div>
  </li>
  <li><a href="#">About</a></li>
  <li><a   href="contact.jsp">Contact</a></li>
  <li class='right'><a   href="Logout">Logout</a></li>
   <li class='right'><a   href="profile.jsp">Profile</a></li>
  </b>
</ul>

<br/><br/>
<div class="hello" style="float:center;padding-left:275px;">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 4</div>
  <img src="s21.jpg" style="width:80%;height:70vh;">
  <div class="text">one</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 4</div>
  <img src="s25.jpg" style="width:80%;height:70vh;">
  <div class="text">Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 4</div>
  <img src="https://images.yourstory.com/cs/1/6c0e8ed06e3b11e9aa8461568b4ab999/BestOnlineSurveyToolsforBetterandFasterSales-1583909698878.png?fm=png&auto=format&ar=2:1&mode=crop&crop=face" style="width:80%;height:70vh;">
  <div class="text">three</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 4</div>
  <img src="s23.jpg" style="width:80%;height:70vh;">
  <div class="text">four</div>
</div>




</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
 <span class="dot"></span> 
 <span class="dot"></span> 
</div>


</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 5000); 
}
</script>






<div class="oracle">
  <div class="row">
    <div class="column">
       <img src="i8.png">
     </div>
    <div class="column" style="float: right;padding-top: 225px;">
      <h4>Know the score with your customers<p>
      Keep a competitive edge by truly understanding</p> the voice of your customers. <p>Customer satisfaction surveys help you</p> connect at multiple  touchpoints to find out exactly<p> what your customers want, need, and expect.</h4></p>
      <div class="abcd">
<a href="#" class="button">create survey</a>
</div>
    </div>
  </div>
</div>
<br/>
<br/>

<br/>

<div class="even">
<div class="row">
  <div class="column">
    <div class="zoom">
    <div class="card">
      <img src="c2.png" alt="Jane" style="width:100%">
      <div class="container">
        <h2>employee survey</h2>
        <p class="title">CEO & Founder</p>
         <p>Whatever your role in your company, at some point you’re going to have to give feedback.
        </p>
        <p><button class="button" >more</button></p>
      </div>
    </div>
  </div>
  </div>

  <div class="column">
    <div class="zoom">
    <div class="card">
      <img src="c3.png" alt="Mike" style="width:100%">
      <div class="container">
        <h2>customer satisfaction</h2>
        <p class="title">customer</p>
        <p>Whatever your role in your company, at some point you’re going to have to give feedback.
        </p>
        <p><button class="button">more</button></p>
      </div>
    </div>
  </div>
  </div>
  
  <div class="column">
    <div class="zoom">
    <div class="card">
      <img src="c4.jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>market research</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>example@example.com</p>
        <p><button class="button">more</button></p>
      </div>
    </div>
  </div>
</div>
</div>
</div>







<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/>
<center>
<div class="kl">
 <div class="flip-card">
  <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <div class="flip-card-inner">
    
    <div class="flip-card-front">
      
       <img src="i9.jpg" style="width:300px;height: 300px;border-radius: 50%;">
       
    </div>
   <div class="flip-card-back">
     <h2>Learn what is working and what is not directly from your employees.<p> Measure employee satisfaction, conduct 360 reviews, or even send out compliance quizzes.</p> </h2>
   </div>
  </div>
 </div>
</div>
</center>
<br/>




<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<div class="klu">
<div class="col-container">
  <div class="col" style="background:dimgray">
    <h2>about</h2>
    <p></p>
  </div>

  <div class="col" style="background:dimgray">
    <a  style="color: tomato;" href="file:///C:/Users/KRISHNA%20SAI/Desktop/own/contact.html">Contact</a>

    <p>contact1</p>
    <p>contact1</p>
    <p>contact1</p>
    
  </div>

  <div class="col" style="background:dimgray">
    <h2>feedback</h2>
    <p></p>
    <p></p>
  </div>
</div>
</div>






</body>
</html>