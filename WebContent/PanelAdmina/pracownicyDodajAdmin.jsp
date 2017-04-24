<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<jsp:include page="headerAdmin.jsp" />
<jsp:include page="../walidacjaRejestracji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Dodaj pracownika</h1>

		<form action="/ISI_2017_ASO/AdminServletPath" method="post">
		
			<div class="main-login main-center">
				<div class="form-group1">
					<label for="name" class="cols-sm-2 control-label">Imię
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="imie" id="imie" placeholder="Podaj imię pracownika."
								data-toggle="popover"
								data-content="Imię musi składać się z 3 do 30 liter." /> <span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="name" class="cols-sm-2 control-label">Nazwisko
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="nazwisko" id="nazwisko"
								placeholder="Podaj nazwisko pracownika." data-toggle="popover"
								data-content="Nazwisko musi składać się z 3 do 30 liter." /> <span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="rodzaj_konta" class="cols-sm-2 control-label">Rodzaj
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa"
								aria-hidden="true"></i></span> <select name="rodzaj_konta" id="rodzaj_konta"
								class="form-control" data-toggle="popover"
								data-content="Wybierz jedną z opcji.">
								<option>Wybierz jedną z opcji.</option>
								<option>Mechanik</option>
								<option>Księgowy</option>
								<option>Administrator</option>
							</select> <span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="username" class="cols-sm-2 control-label">Login
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="login" id="login" placeholder="Podaj login pracownika."
								data-toggle="popover"
								data-content="Login musi składać się z 4 do 16 liter lub cyfr." />
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="password" class="cols-sm-2 control-label">Hasło
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
								type="password" class="form-control" name="haslo" id="haslo"
								placeholder="Podaj hasło pracownika." data-toggle="popover"
								data-content="Hasło musi mieć długość od 8 do 18 znaków oraz musi zawierać conajmniej 1 małą literę, 1 wielką literę oraz cyfrę." />
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="confirm" class="cols-sm-2 control-label">Powtórz
						hasło:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
								type="password" class="form-control" name="haslo2" id="haslo2"
								placeholder="Ponownie wpisz hasło pracownika."
								data-toggle="popover"
								data-content="Podane hasła muszą być takie same." /> <span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="email" class="cols-sm-2 control-label">E-mail
						pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
								type="email" class="form-control" name="email" id="email"
								placeholder="Podaj e-mail pracownika." data-toggle="popover"
								data-content="Adres e-mail musi być w formacie email@przyklad.pl." />
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>

				<div class="form-group321">
					<label for="email" class="cols-sm-2 control-label">Numer
						telefonu pracownika:</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-phone"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="numer_telefonu" id="numer_telefonu"
								placeholder="Podaj numer telefonu pracownika."
								data-toggle="popover"
								data-content="Numer telefonu musi składać się z 9 cyfr." /> <span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</div>


				<div class="form-group-last">
					<button type="submit" id="btn_rej"
						class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Rejestruj</button>
					<button type="button" id="powrot"
						class="button col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
						<a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Powrót</a>
					</button>
				</div>


			</div>
		</form>
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerAdmin.jsp" />
