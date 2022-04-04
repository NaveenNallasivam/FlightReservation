<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page import="Main.signup"%>
<%@ page import="Main.databaseConnector"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="Main.firstPage"%>
<%@ page import="Main.apiCall" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<body>
	<%Connection con= databaseConnector.initializeDatabase(); 
	  PreparedStatement sp= con.prepareStatement("select firstName from customerRecords where customerId=(?);");
	  long customerId;
	  if(signup.customerId>0){
		customerId=firstPage.customerId;
		System.out.println(customerId);
	  }
	  else{
		  customerId=firstPage.customerId;
	  }
	  sp.setLong(1,customerId);
	  ResultSet rs= sp.executeQuery();
	%>
	<%
	String name="unknown";
	if(rs.next()){
		name=rs.getString(1);
	}
	 %>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<h3>Welcome <%out.println(name); %> to tickets app</h3>
				
			</div>
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