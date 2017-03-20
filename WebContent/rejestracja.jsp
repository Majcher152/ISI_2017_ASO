<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="pl-PL">

<head>

<title>Projekt ISI - ASO Samochodowe</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
	<div class="kontener">
		<div class="naglowek">
			<h1></h1>
		</div>
		<div class="menu">
			<div class="odnosnik"><a href="index.jsp">Strona główna</a></div>
			<div class="odnosnik"><a href="">Podstawowy cennik</a></div>
			<div class="odnosnik"><a href="">Lokalizacja serwisów</a></div>
			<div class="odnosnik"><a href="logowanie.jsp">Logowanie</a></div> 
		</div>
		<div class="srodek">
			<div class="lewy">
				<div class="informacje">
				informacje
				</div>
				<div class="wiadomosc">
				wiadomosc
				</div>
				<div class="fb">
				facebook
				</div>
			</div>
			
			<!-- prawa glowna czesc strony zawierajaca tresc-->
			<div class="trescRejestracja">
				<form action="rej" method="post">
					Login: <input type="text" name="login" maxlength="20"></br></br></br>
					Hasło: <input type="password" name="haslo" maxlength="20"></br></br></br>
					Powtórz hasło: <input type="password" name="haslo2" maxlength="20"></br></br></br>
					Imię: <input type="text" name="imie" maxlength="20"></br></br></br>
					Nazwisko: <input type="text" name="nazwisko" maxlength="20"></br></br></br>
					Nr telefonu: <input type="text" name="telefon" maxlength="10"></br></br></br>
					<input type="submit" name="zarejestruj" value="Zarejestruj się"></br></br>
					
				</form>
			</div>	
		</div>
		<div class="stopka">
			&copy;2017 Stopka
		</div>
	</div>
</body>
</html>