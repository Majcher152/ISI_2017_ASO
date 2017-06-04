<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ page import="pl.komp.aso.dto.Uzytkownik"%>			

<jsp:include page="headerKlient.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />

<%
	Uzytkownik uzytkownik =(Uzytkownik) session.getAttribute("uzytkownik");
%>

	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Edytuj dane:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="/ISI_2017_ASO/UstawieniaServlet">

					<div class="form-group ">
						<label for="name" class="cols-sm-2 control-label">Twoje
							Imię</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="imie" id="imie"  
									value="<%=uzytkownik.getImie()%>"
									data-toggle="popover" data-content="Imię musi składać się z 3 do 30 liter."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
							
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Twoje
							Nazwisko</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="nazwisko" id="nazwisko"
									value="<%=uzytkownik.getNazwisko()%>" 
									data-toggle="popover" data-content="Nazwisko musi składać się z 3 do 30 liter."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Twój
							Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="email" id="email"
									value="<%=uzytkownik.getEmail()%>"
									data-toggle="popover" data-content="Adres email musi być w formacie przyklad@przyklad.pl."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Twój
							Numer Telefonu</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="numer_telefonu" id="numer_telefonu"
									value="<%=uzytkownik.getNrTelefonu()%>"
									data-toggle="popover" data-content="Numer telefonu musi składać się z 9 cyfr."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit" id="btn_edytuj_dane"
							class="btn btn-primary btn-lg btn-block login-button">Zapisz dane</button>
					</div>
					
						<%
						String blad = (String) request.getAttribute("blad");
					%>
					<%
						if (blad != null && blad.equals("Zmieniono ustawienia pomyślnie.")) {
					%>
					<div class="alert alert-success">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
						}
					else if (blad != null && !blad.equals("")) { 
					%>
					<div class="alert alert-danger">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
					}
					%>
					
				</form>
			</div>
		</div>
		
		<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Edytuj hasło:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="/ISI_2017_ASO/UstawieniaHasloServlet">
				
					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Stare hasło</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="stareHaslo" id="stareHaslo"
									placeholder="Wpisz twoje obecne hasło." 
									data-toggle="popover" data-content="Hasło musi mieć długość od 8 do 18 znaków oraz musi zawierać conajmniej 1 małą literę, 1 wielką literę oraz cyfrę."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Nowe hasło</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="noweHaslo" id="noweHaslo"
									placeholder="Wpisz twoje nowe hasło." 
									data-toggle="popover" data-content="Hasło musi mieć długość od 8 do 18 znaków oraz musi zawierać conajmniej 1 małą literę, 1 wielką literę oraz cyfrę."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="confirm" class="cols-sm-2 control-label">Powtórz nowe
							hasło</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="noweHaslo2" id="noweHaslo2"
									placeholder="Ponownie wpisz nowe hasło." 
									data-toggle="popover" data-content="Podane hasła muszą być takie same."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					
					<div class="form-group ">
						<button type="submit" id="btn_edytuj_haslo"
							class="btn btn-primary btn-lg btn-block login-button">Zapisz hasło</button>
					</div>
					
						<%
						String bladHaslo = (String) request.getAttribute("bladHaslo");
					%>
					<%
						if (bladHaslo != null && bladHaslo.equals("Zmieniono hasło pomyślnie.")) {
					%>
					<div class="alert alert-success">
						<p style="text-align:center"><%=bladHaslo%></p>
					</div>
					<%
						}
					else if (bladHaslo != null && !bladHaslo.equals("")) { 
					%>
					<div class="alert alert-danger">
						<p style="text-align:center"><%=bladHaslo%></p>
					</div>
					<%
					}
					%>
					
				</form>
			</div>
		</div>

		<hr class="featurette-divider">

<jsp:include page="footerKlient.jsp" />	