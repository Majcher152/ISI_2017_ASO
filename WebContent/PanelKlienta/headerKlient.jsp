<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="pl-PL">
<head>

<link rel="icon" href="/ISI_2017_ASO/favico.ico" >
<link rel="shortcut icon" href="/ISI_2017_ASO/favico.ico" > 

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ASO-Klient</title>

<!-- Bootstrap core CSS -->
<link href="/ISI_2017_ASO/css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="/ISI_2017_ASO/PanelKlienta/styleKlient.css?1" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

</head>

<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper">
		<div class="container">
			<nav class="navbar navbar-inverse navbar-static-top">
				<h1>Autoryzowany Serwis - KOŚKA</h1>
				<div class="container">
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="/ISI_2017_ASO/PanelKlienta/indexKlient.jsp">Strona główna</a></li>
							
							<li class="dropdown"><a href="/ISI_2017_ASO/index.jsp"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">Cennik<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/ISI_2017_ASO/PanelKlienta/cennikKlient.jsp">Cennik podstawowy</a></li>
									<li><a href="/ISI_2017_ASO/PanelKlienta/cennikKlientRozsz.jsp">Cennik rozszerzony</a></li>
								</ul></li>

								
								<li class="dropdown"><a href="/ISI_2017_ASO/index.jsp"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">Rezerwacja<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/ISI_2017_ASO/PrzegladServlet?metoda=zaladujPrzeglad">Przeglad</a></li>
									<li><a href="/ISI_2017_ASO/NaprawaServlet?metoda=zaladujNaprawe">Naprawa</a></li>
								</ul></li>
								
								<li><a href="/ISI_2017_ASO/HistoriaSerwisowaniaServlet?metoda=zaladujHistorie">Historia Serwisowania</a></li>
							<li><a href="/ISI_2017_ASO/PanelKlienta/oNasKlient.jsp">O nas</a></li>
							<li><a href="/ISI_2017_ASO/PanelKlienta/kontaktKlient.jsp">Kontakt</a></li>

							<li class="dropdown"><a href="/ISI_2017_ASO/index.jsp"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">Moje Konto<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/ISI_2017_ASO/PanelKlienta/edytujDaneKlient.jsp">Edytuj dane</a></li>
									<li><a href="/ISI_2017_ASO/PanelKlienta/usunKontoKlient.jsp">Usuń konto</a></li>
									<li><a href="/ISI_2017_ASO/Samochody2Servlet?method=zaladujDodajSamochod">Dodaj samochód</a></li>
									<li><a href="/ISI_2017_ASO/Samochody2Servlet?method=zaladujUsunSamochod">Usuń samochód</a></li>
									<li><a href="/ISI_2017_ASO/index.jsp">Wyloguj</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide" src="/ISI_2017_ASO/PanelKlienta/vwb.jpg" alt="First slide">
			</div>
		</div>
