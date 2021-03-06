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

<title>ASO</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="/ISI_2017_ASO/style.css" rel="stylesheet">

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
							<li><a href="index.jsp">Strona główna</a></li>
							<li><a href="cennik.jsp">Cennik</a></li>
							<li><a href="oNas.jsp">O nas</a></li>
							<li><a href="kontakt.jsp">Kontakt</a></li>

							<li class="dropdown"><a href="index.jsp"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">Moje Konto<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="logowanie.jsp">Logowanie</a></li>
									<li><a href="rejestracja.jsp">Rejestracja</a></li>
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

		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide" src="vw1.jpg" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Dlaczego warto wybrać Autoryzowany Serwis?</h1>
						<p>Profesjonalna obsługa, naprawa z gwarancją, jakość za
							uczciwą cenę, zyskasz przy sprzedaży, odpowiedzialna naprawa,
							bezpieczeństwo gratis.</p>
						<br> <br> <br>
						<p>
							<a class="btn btn-lg btn-primary" href="rejestracja.jsp"
								role="button">Dołącz już dzisiaj!</a>
						</p>
					</div>
				</div>
			</div>

			<div class="item">
				<img class="second-slide" src="vw3.jpg" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Masz już konto?</h1>
						<p>Posiadając konto na naszej stronie dostajesz dostęp do
							wielu możliwości np. rezerwacji terminu przeglądu, sprawdzanie
							historii serwisowania swojego pojazdu itp.</p>
						<br> <br> <br>
						<p>
							<a class="btn btn-lg btn-primary" href="logowanie.jsp"
								role="button">Zaloguj się!</a>
						</p>
					</div>
				</div>
			</div>

			<div class="item">
				<img class="third-slide" src="vw4.jpg" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Szukasz dobrych cen? Dobrze trafiłeś!</h1>
						<p>Jako porofesjonalny serwis świadczymy usługi już ponad 10
							lat, dlatego posiadamy konkurencyjne ceny w porównaniu do innych
							warsztatów. Na nas na pewno się nie zawiedziesz!</p>
						<br> <br>
						<p>
							<a class="btn btn-lg btn-primary" href="cennik.jsp" role="button">Sprawdź
								cennik!</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>