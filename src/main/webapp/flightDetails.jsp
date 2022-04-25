<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script lang="text/javascript" src="flightApi.js"></script>
<title>Flight Detaills</title>
</head>
<body onload="loadFlightDetails()">
 <div class="row" style="text-align:center;color:#9999ff">
	<div class="col-sm-6" >
		<table class="table table-bordered" >
		 	<thead>
		 		<tr>
		 			<th style="text-align:right">Source:</th>
		 			<th style="text-align:left"> <input type="text"/></th>
		 		</tr>
		 		<tr>
		 			<th style="text-align:right">Destination:</th>
		 			<th style="text-align:left"> <input type="text"/></th>
		 		</tr>
		 		<tr>
		 			<th style="text-align:right">Date:</th>
		 			<th style="text-align:left"><input type="datetime-local"/></th>
		 		</tr>
		 		<tr>
		 			<th style="text-align:right">No of passengers:</th>
		 			<th style="text-align:left"><input type="datetime-local"/></th>
		 		</tr>
		 		<tr style="text-align:center">
		 			<th><button onclick="loadFlightDetails()">Submit</button></th>
		 		</tr>
		 	</thead>
 		</table>
	</div>
</div>
</body>
</html>