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
<%@ page import="Main.profileDetails" %>
<%@ page import="Main.apiCall" %>
<%@ page import="Main.RetrieveProfileInfo" %>
<title>My profile</title>
<style>
	.container{
			height:25%;
			width:75%;
	}
</style>
</head>
<body>
<%String name=RetrieveProfileInfo.getFirstName();
 
%>
<%String emailId=RetrieveProfileInfo.getEmailid(); %>
	<div class="container" style="background-color:#7094db;border-radius:10px">
		<div id="myProfile" class="w3-modal" style="display:block">
		    <div class="w3-modal-content">
		      <div class="w3-container">
		        <span onclick="document.getElementById('myProfile').style.display='none'" class="w3-button w3-display-topright">&times;</span>
		        	<div class="row" style="text-align:center">
						<div class="glyphicon glyphicon-user"><br><%out.println(name); %></div>
					</div>
					<div class="row" style="text-align:center">
						<div class="col-sm-3">Registered EmailId:</div>
						<div class="col-sm-9"><%out.println(emailId); %></div>
					</div>
		      </div>
		    </div>
		 </div>
	</div>
</body>
</html>