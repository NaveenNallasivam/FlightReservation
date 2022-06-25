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
<title>Flight Details</title>
</head>
<style>
table{
width:70%;
  		text-align:center;
  		background-color:#99bbff;
  		opacity:0.5;
  		border-radius:5%;
}
td{
width:50%;
padding-top:50px;
padding-bottom:50px;
}
.container{
padding:100px 100px 100px 100px;
}
body{
		background-color:#ebebe0;
		background-image: url("bg.jpg");
		background-size: cover;
		
	}
</style>
<body>
<%String flightNo=(String)request.getAttribute("flightNo"); %>
<%String sourceCity=(String)request.getAttribute("sourceCity"); %>
<%String destCity=(String)request.getAttribute("destCity"); %>
<%String timings=(String)request.getAttribute("timings"); %>
<div class="container" style="text-align:center">
	<div class="row" style="text-align:center">
		<div class="col-sm-12" style="text-align:center">
			<table>
				<tr>
					<td><b>Flight No</b></td>
					<td><i><%out.print(flightNo);%></i></td>
				</tr>
				<tr>
					<td><b>Depart From</b></td>
					<td><i><%out.print(sourceCity);%></i></td>
				</tr>
				<tr>
					<td><b>Destination</b></td>
					<td><i><%out.print(destCity);%></i></td>
				</tr>
				<tr>
					<td><b>Timings</b></td>
					<td><i><%out.print(timings);%></i></td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>