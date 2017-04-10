<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<jsp:include page="header.jsp" />
<jsp:include page="walidacjaRejestracji.jsp" />



	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Wypełnij formularz:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="rej">

					<div class="form-group ">
						<label for="name" class="cols-sm-2 control-label">Twoje
							Imię</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="imie" id="imie" placeholder="Wpisz swoje imię." 
									data-toggle="popover" data-content="Imię musi składać 3 do 30 liter."/>
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
									placeholder="Wpisz swoje nazwisko." 
									data-toggle="popover" data-content="Nazwisko musi składać 3 do 30 liter."/>
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
									placeholder="Wpisz twój email." 
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
									placeholder="Wpisz twój numer telefonu." 
									data-toggle="popover" data-content="Numer telefonu musi składać się z 9 cyfr."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Login</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="login" id="login" placeholder="Wpisz twój login"
									data-toggle="popover" data-content="Login musi składać się z 4 do 16 liter lub cyfr."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Hasło</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="haslo" id="haslo"
									placeholder="Wpisz twoje hasło." 
									data-toggle="popover" data-content="Hasło musi mieć długość od 8 do 18 znaków oraz musi zawierać conajmniej 1 małą literę, 1 wielką literę oraz cyfrę."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="confirm" class="cols-sm-2 control-label">Powtórz
							Hasło</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="haslo2" id="haslo2"
									placeholder="Ponownie wpisz hasło." 
									data-toggle="popover" data-content="Podane hasła muszą być takie same."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit" id="btn_loguj"
							class="btn btn-primary btn-lg btn-block login-button">Zarejestruj</button>
					</div>
					
						<%String blad =(String) request.getAttribute("blad"); %>
						<%if(blad!=null && !blad.equals("")){ %>
						<div class="alert alert-danger"> <%=blad %> 
						</div>
						<%} %>
					
					<div class="login-register">
						<a href="logowanie.jsp">Zaloguj się</a>
					</div>
				</form>
			</div>
		</div>

		<hr class="featurette-divider">

<jsp:include page="footer.jsp" />	