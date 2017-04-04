<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<jsp:include page="header.jsp" />

<script>
$(document).ready(function() {
 
	//Walidacja imienia
	$('#imie').on('blur', function() {
		var input = $(this);
		var name_length = input.val().length;
		if(name_length <= 29){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("OK.").removeClass("blad").addClass("ok");
		}
		else{
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Imie nie może być dłuższe niż 30 znaków!").removeClass("ok").addClass("blad");
			
		}
	});
	
	//Walidacja nazwiska
	$('#nazwisko').on('blur', function() {
		var input = $(this);
		var name_length = input.val().length;
		var pattern = /^[a-zA-Z ]+$/;
		var is_name = pattern.test(input.val());
		if(name_length <= 29){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("OK.").removeClass("blad").addClass("ok");
		}
		else {
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Nazwisko nie może być dłuższe niż 30 znaków!").removeClass("ok").addClass("blad");
			
		}
	});
		
	//Walidacja email
	$('#email').on('blur', function() {
		var input = $(this);
		var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("OK.").removeClass("blad").addClass("ok");
		}
		else{
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Wprowadź poprawny email!").removeClass("ok").addClass("blad");
		}
	});	
});
</script>

	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Wypełnij formularz:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="rej">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Twoje
							Imię</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="imie" id="imie" placeholder="Wpisz swoje imię." />
									<span class="komunikat"></span>
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
									placeholder="Wpisz swoje nazwisko." />
									<span class="komunikat"></span>
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
									placeholder="Wpisz twój email." />
									<span class="komunikat"></span>
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
									placeholder="Wpisz twój numer telefonu." />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Login</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="login" id="login" placeholder="Wpisz twój login" />
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
									placeholder="Wpisz twoje hasło." />
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
									placeholder="Ponownie wpisz hasło." />
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit"
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
</html>
