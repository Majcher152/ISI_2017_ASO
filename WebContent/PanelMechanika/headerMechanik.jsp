<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="pl-PL">
<head>

<link rel="icon" href="/ISI_2017_ASO/favico.ico" >
<link rel="shortcut icon" href="/ISI_2017_ASO/favico.ico" > 

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ASO Mechanik</title>

<!-- Bootstrap core CSS -->
<link href="/ISI_2017_ASO/css/bootstrap.min.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<!-- Custom styles for this template -->
<link href="/ISI_2017_ASO/PanelMechanika/styleMechanik.css" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<h2>Panel mechanika - ASO</h2>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="/ISI_2017_ASO/PanelMechanika/mechanik.jsp">Strona główna</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="/ISI_2017_ASO/MechanikNaprawaServlet?metoda=zaladujZadaniaDoRealizacji">Zadania do realizacji</a></li>
					<li><a href="/ISI_2017_ASO/MechanikNaprawaServlet?metoda=zaladujZadaniaWTrakcie">Zadania w trakcie</a></li>
					<li><a href="/ISI_2017_ASO/MagazynMechanikServlet?metoda=zaladujAktualizacje">Aktualizuj stan magazynu</a></li>
					<br>
					<li><a href="/ISI_2017_ASO/index.jsp">Wyloguj się</a></li>

				</ul>
			</div>