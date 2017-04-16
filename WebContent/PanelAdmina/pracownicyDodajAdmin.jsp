<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>


<jsp:include page="headerAdmin.jsp" />
<jsp:include page="waliAdmin.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Dodaj pracownika</h1>

		<div class="main-login main-center">
			   <form class="form-horizontal" method="post" action="rej"> 
		
		
								<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Nazwa pracownika:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="login" id="login" placeholder="Podaj login pracownika"
									data-toggle="popover" data-content="Login musi składać się z 4 do 16 liter lub cyfr."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
			<!--  	Nazwa pracownika:</br>
				<div class="form-group"> <span class="col-sm-2 col-sm-offset-0 col-md-12 col-md-offset-0 input-group-addon" aria-label="Left Align"><i
					class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
					
					 <input type="text"	class="form-control" name="login" id="login"
					placeholder="Wpisz twój login" data-toggle="popover"
					data-content="Login musi składać się z 4 do 16 liter lub cyfr." />
								<span class="glyphicon form-control-feedback"></span>  -->
				
				Hasło
				pracownika:</br>
				<div class="inputForm">
					<input name="haslo" class="form-control" type="password"
						placeholder="Haslo">
				</div>

				Imie pracownika:</br>
				<div class="inputForm">
					<input name="imie" class="form-control" type="text"
						placeholder="Imie">
				</div>

				Nazwisko pracownika:</br>
				<div class="inputForm">
					<input name="nazwisko" class="form-control" type="text"
						placeholder="Nazwisko">
				</div>

				Email pracownika:</br>
				<div class="inputForm">
					<input name="email" class="form-control" type="email"
						placeholder="Email@przyklad.pl">
				</div>

				Numer telefonu pracownika:</br>
				<div class="inputForm">
					<input name="nrtel" class="form-control" type="number"
						placeholder="123456789">
				</div>
				Rodzaj konta:</br>
				<div class="inputForm">
					<select name="rodzaj" class="form-control">
						<option>Mechanik</option>
						<option>Ksiêgowy</option>
						<option>Administrator</option>
					</select>
				</div>
				<div>
					<input type="submit">
				</div>
				
													<%String blad =(String) request.getAttribute("blad"); %>
						<%if(blad!=null && !blad.equals("")){ %>
						<div class="alert alert-danger"> <%=blad %> 
						</div>
						<%} %>
			</form>
			

						
			<button type="button" class="button">
				<a href="panelAdminaPracownicy.html">Powrót</a>
			</button>
		</div>

	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerAdmin.jsp" />
