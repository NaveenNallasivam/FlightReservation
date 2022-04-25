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
body{
		background-color:#ebebe0;
		background-image: url("bg.jpg");
		background-size: cover;
		
	}
</style>
  <!-- ajax call -->
  <script>
function loadDetails(modeofTransport) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("display").innerHTML =
      this.responseText;
    }
  };
  if(modeofTransport=="flight"){
	  xhttp.open("GET", "flightDetails.jsp", true);  
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
</script>
<title>Insert title here</title>
</head>
<body onload="getWeather()">
	
	<%
	String name="unknown";
		name=RetrieveProfileInfo.getFirstName();
	 %>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3 style="color:#ff0000">Welcome <%out.println(name); %> to tickets app</h3>
			</div>
			<div class="col-sm-6">
				<div id="temp" style= "text-align:right;color:white"></div>
			</div>
		</div>
		<div class="row">
					<div class="col-sm-9" style="padding-top:50px;text-align:center">
				<button class="btn btn-small" onclick="loadDetails('flight')">Flights</button>
				<button class="btn btn-small" onclick="loadDetails('train')">Trains</button>
				<button class="btn btn-small" onclick="loadDetails('cabs')">Cabs</button>
				<button class="btn btn-small" onclick="displayProfile()">My Account</button>
			</div>
		</div>
		<div class="row" id="display">
			<div class="col-sm-9" id="bookingInfo">
				<!-- content loaded through ajax call -->
			</div>
			<div class="col-sm-3" id="profileInfo">
				<!-- content loaded through ajax call -->
			</div>
		</div>
	</div>
</body>
</html>