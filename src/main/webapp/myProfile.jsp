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
</head>
<body>
<%String name=RetrieveProfileInfo.getFirstName();
 
%>
<%String emailId=RetrieveProfileInfo.getEmailid(); %>
	<div class="container" style="background-color:#9999ff;padding-top:20px;border-radius:20px">
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