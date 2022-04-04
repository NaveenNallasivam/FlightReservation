<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>My profile</title>
</head>
<body>
<%Connection con=databaseConnector.initializeDatabase();
PreparedStatement sp= con.prepareStatement("select firstName from customerRecords where customerId=(?);");
	  long customerId;
	  String name="";
	  String emailId="";
	  if(signup.customerId>0){
		customerId=firstPage.customerId;
		System.out.println(customerId);
	  }
	  else{
		  customerId=firstPage.customerId;
	  }
	  sp.setLong(1,customerId);
	  ResultSet rs= sp.executeQuery();
	 
	  if(rs.next()){
		name=rs.getString(1);
	  }
	sp=con.prepareStatement("select emailId from customerRecords where customerId=(?);");
	sp.setLong(1,customerId);
	rs=sp.executeQuery();
	if(rs.next()){
		emailId=rs.getString(1);
	}
	%>
	<div class="container">
		<div class="row" style="text-align:center">
			<div class="glyphicon glyphicon-user"><br><%out.println(name); %></div>
		</div>
		<div class="row" style="text-align:center">
			<div class="col-sm-3">Registered EmailId:</div>
			<div class="col-sm-9"><%out.println(emailId); %></div>
		</div>
	</div>
</body>
</html>