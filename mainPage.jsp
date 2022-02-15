<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page import="Main.signup"%>
<%@ page import="Main.databaseConnector"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="Main.firstPage"%>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			<div class="col-sm-7" style="padding-top:50px;text-align:center">
				<button class="btn btn-small"><a href="#">Flights</a></button>
				<button class="btn btn-small"><a href="#">Trains</a></button>
				<button class="btn btn-small"><a href="#">Cabs</a></button>
				<button class="btn btn-small"><a href="#">My Account</a></button>
			</div>
			<div class="col-sm-2">
				<h5>Copyrights-Naveen</h5>
			</div>
		</div>
	</div>
</body>
</html>