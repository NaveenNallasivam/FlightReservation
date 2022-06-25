<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page import="Main.signup"%>
<%@ page import="Main.databaseConnector"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="Main.firstPage"%>
<%@ page import="Main.RetrieveProfileInfo"%>
<%@ page import="Main.apiCall" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="weatherApi.js"></script>
<style>
#mainBody{
	background-color:grey;
	/*opacity:0.7;*/
	width:102%;
	position:fixed;
}
#display{
	transition:0.3s;
	align:center;
	padding:175px;
}
body{
		background-color:#ebebe0;
		background-image: url("bg.jpg");
		background-size: cover;
		
	}
	.sidebar {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidebar a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.sidebar .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #111;
  color: white;
  padding: 10px 15px;
  border: none;
}

.openbtn:hover {
  background-color: #444;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
  text-align:left;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
  <!-- ajax call -->
  <script>
  function validate(var1,var2) {
		if(var1==null || var1==0 ){
			alert('please enter the no of passengers');
			return false;
		}
		var today = new Date();
		var date= new Date(var2);
		//alert(today);
		//alert(dd);
		if(date.getTime() <= today.getTime()|| date=='Invalid Date'){
			alert('date cannot be in the past');
			return false;
		}
	
	} 
  function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	  document.getElementById("display").style.marginLeft = "250px";
	  //document.getElementById("mainBody").style.marginLeft = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	  //document.getElementById("display").style.marginLeft = "0";
	  //document.getElementById("mainBody").style.marginLeft = "0";
	}
function loadDetails(modeofTransport) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("display").innerHTML =
      this.responseText;
    }
  };
  if(modeofTransport=="flight"){
	  xhttp.open("GET", "flightDetails.html", true);  
  }
  if(modeofTransport=="train"){
	  xhttp.open("GET", "trainDetails.jsp", true);  
  }
  if(modeofTransport=="cabs"){
	  xhttp.open("GET", "cabDetails.jsp",true);
  }
  xhttp.send();
}
  //function to load user profile//
 function displayProfile(){
	 var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("display").innerHTML =
	      this.responseText;
	    }
	  };
	  xhttp.open("GET", "myProfile.jsp", true);
	  xhttp.send();
  }
  function signout(){
	  document.getElementById("signout").style.display="block";
	  document.getElementById("display").style.display="disabled";
	  
  }
  function loadFlightDetails(){
	  alert("hai");
	  httpRequest = new XMLHttpRequest();
	  
	  if (!httpRequest) {
	  console.log('Unable to create XMLHTTP instance');
	  return false;
	  }
	  httpRequest.open('POST','http://localhost:8080/cricketScorer/displayFlightDetails',true);
	  httpRequest.responseType = 'json';
	  httpRequest.send();
	  httpRequest.onreadystatechange = function() {
	  if (httpRequest.readyState === XMLHttpRequest.DONE) {
	   
	  document.getElementById('display').innerHTML = "";
	   
	  if (httpRequest.status === 200) {
	   
	  var array = httpRequest.response;
	  alert(array);
	  document.getElementById('display').innerHTML =this.httpRequest.response;
	  }
	  };
	  }
	  
  }
</script>
<title>Insert title here</title>
</head>
<body onload="getWeather()">
	
	<%
	String name="unknown";
		name=RetrieveProfileInfo.getFirstName();
	 %>
		<div class="row" id="mainBody">
			<div class="col-sm-2" style="text-align:left">
				<div id="main">
				  <button class="openbtn" onclick="openNav()" ><div class="glyphicon glyphicon-th" ></div></button>  
				</div>
				<div id="mySidebar" class="sidebar">
 					 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 					 <div class="row">
 					 	<a class="container" onclick="loadDetails('flight')">Flights</a>
 					 </div>
 					 <div class="row">
 					 	<a class="container" onclick="loadDetails('train')">Trains</a>
 					 </div>
 					 <div class="row">
 					 	<a class="container" onclick="loadDetails('cabs')">Cabs</a>
 					 </div>
 					 <div class="row">
 					 	<a class="btn btn-small" onclick="displayProfile()">My Account</a>
 					 </div>	
				</div>
			</div>
			<div class="col-sm-4"style="text-align:center">
				<h3 style="color:#ff0000">Welcome <%out.println(name); %> to tickets app</h3>
			</div>
			<div class="col-sm-2"style="text-align:right;padding-top:16px">
				<div class="glyphicon glyphicon-certificate" style="background-color:yellow"></div>
			</div>
			<div class="col-sm-2" style="text-align:left;padding-top:16px">
				<p id="temp" style= "color:white"></p>
			</div>
			<div class="col-sm-2"style="text-align:right;padding-top:16px">
				<a href="#" onclick="signout()"><div class="glyphicon glyphicon-off" style="color:black"></div></a>
			</div>
		</div>
	<div class="container" style="text-align:center">
		<div class="row" id="display">
			<div class="col-sm-9" id="bookingInfo"style=";text-align:left">
				<!-- content loaded through ajax call -->
			</div>
			<div class="col-sm-3" id="profileInfo">
				<!-- content loaded through ajax call -->
			</div>
		</div>
		<div id="signout" class="w3-modal" style="display:none;position:center">
		    <div class="w3-modal-content">
		      <div class="w3-container">
		        <span onclick="document.getElementById('signout').style.display='none'" class="w3-button w3-display-topright">&times;</span>
		        <p>Do you really want to signout?</p>
		        <button class="btn btn-small">Yes</p>
		      </div>
		    </div>
		 </div>
	</div>
</body>
</html>