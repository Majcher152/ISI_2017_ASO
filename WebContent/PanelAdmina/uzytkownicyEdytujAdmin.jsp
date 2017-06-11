<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String emailUzytkownika = request.getParameter("email");
	%>
SELECT * FROM `uzytkownik` where email = '<%=emailUzytkownika%>';
</sql:query>


<jsp:include page="headerAdmin.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="uzytkownik" items="${result.rows}">
			<h1 class="page-header">Edytuj użytkownika</h1>
			<div
				class="form-group-first col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
				<%
					String blad = (String) request.getAttribute("blad");
				%>
				<%
					if (blad != null && !blad.equals("")) {
				%>
				<div class="alert alert-success">
					<p style="text-align:center"><%=blad%></p>
				</div>

				<%
					}
				%>
			</div>
			<%
				if (blad != null && !blad.equals("")) {
			%>
			<br><br><br>
			<%
				}
			%>
			<form action="/ISI_2017_ASO/AdminEdycjaInformacjiPath" method="post">

				<div class="main-login main-center">

					<div class="form-group">
						<br> <label for="name" class="cols-sm-2 control-label">Imię
							pracownika:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="imie" id="imie"
									value="<c:out value="${uzytkownik.imie}" />"
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
									value="<c:out value="${uzytkownik.nazwisko}" />"
									data-toggle="popover"
									data-content="Nazwisko musi składać się z 3 do 30 liter." /> <span
									class="glyphicon form-control-feedback"></span>
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
									name="login" id="login"
									value="<c:out value="${uzytkownik.login}" />"
									data-toggle="popover"
									data-content="Login musi składać się z 4 do 16 liter lub cyfr." />
								<span class="glyphicon form-control-feedback"></span>
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
									value="<c:out value="${uzytkownik.email}" />"
									data-toggle="popover"
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
									value="<c:out value="${uzytkownik.numer_telefonu}" />"
									data-toggle="popover"
									data-content="Numer telefonu musi składać się z 9 cyfr." /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<br>
					<div class="form-group-last">
						<button type="submit" id="btn_edytuj_dane"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zapisz</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelAdmina/uzytkownicyAdmin.jsp">Powrót</a>
						</button>
					</div>


				</div>


			</form>
		</c:forEach>


	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerAdmin.jsp" />
