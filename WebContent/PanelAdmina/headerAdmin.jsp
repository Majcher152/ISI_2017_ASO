<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ASO Admin</title>

<!-- Bootstrap core CSS -->
<link href="/ISI_2017_ASO/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="/ISI_2017_ASO/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="/ISI_2017_ASO/js/ie-emulation-modes-warning.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<!-- Custom styles for this template -->
<link href="/ISI_2017_ASO/PanelAdmina/styleAdmin.css" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<h2>Panel admina - ASO</h2>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="/ISI_2017_ASO/PanelAdmina/admin.jsp">Strona główna</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Pracownicy</a></li>
					<li><a href="/ISI_2017_ASO/PanelAdmina/uzytkownicyAdmin.jsp">Użytkownicy</a></li>
					<li><a href="/ISI_2017_ASO/PanelAdmina/warsztatyAdmin.jsp">Warsztaty</a></li>
					<li><a href="/ISI_2017_ASO/PanelAdmina/statystykaAdmin.jsp">Statystyki</a></li>
					<br>
					<li><a href="/ISI_2017_ASO/index.jsp">Wyloguj się</a></li>

					
				</ul>
			</div>