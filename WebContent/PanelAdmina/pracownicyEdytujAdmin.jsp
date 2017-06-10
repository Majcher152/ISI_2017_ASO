<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:query dataSource="jdbc/aso" var="resultWarsztat">
SELECT * FROM `warsztat`;
</sql:query>
<%
	String emailUzytkownika = request.getParameter("email");
%>
<sql:query dataSource="jdbc/aso" var="result">

SELECT * FROM `uzytkownik` where email = '<%=emailUzytkownika%>';
</sql:query>

<sql:query dataSource="jdbc/aso" var="resultMechanikWarsztat">
SELECT id_warsztatu_fk FROM `mechanik_warsztat`
 join uzytkownik on uzytkownik.login = mechanik_warsztat.mechanik_login_fk 
 where email = '<%=emailUzytkownika%>'  
 and uzytkownik.login = mechanik_warsztat.mechanik_login_fk ;
</sql:query>

<jsp:include page="headerAdmin.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="uzytkownik" items="${result.rows}">
			<h1 class="page-header">Edytuj pracownika</h1>

			<form action="/ISI_2017_ASO/AdminEdycjaInformacjiPath" method="post">

				<div class="main-login main-center">
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Imię
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
						<label for="rodzaj_konta" class="cols-sm-2 control-label">Rodzaj
							pracownika:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <select name="rodzaj_konta"
									id="rodzaj_konta" class="form-control" data-toggle="popover"
									data-content="Wybierz jedną z opcji.">
									<c:choose>
										<c:when test="${uzytkownik.rodzaj_konta=='Administrator'}">
											<option>Mechanik</option>
											<option>Ksiegowy</option>
											<option selected>Administrator</option>
											<br />
										</c:when>
										<c:when test="${uzytkownik.rodzaj_konta=='Mechanik'}">
											<option selected>Mechanik</option>
											<option>Ksiegowy</option>
											<option>Administrator</option>
											<br />
										</c:when>
										<c:when test="${uzytkownik.rodzaj_konta=='Ksiegowy'}">
											<option>Mechanik</option>
											<option selected>Ksiegowy</option>
											<option>Administrator</option>
											<br />
										</c:when>
									</c:choose>
								</select> <span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="ktory_warsztat" class="cols-sm-2 control-label">Który
							warsztat:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <select name="warsztat" id="warsztat"
									class="form-control" data-toggle="popover"
									data-content="Wybierz jedną z opcji.">
									<c:forEach var="warsztatID"
										items="${resultMechanikWarsztat.rows}">
										<c:set var="numRows" value="${warsztatID.id_warsztatu_fk}" />
									</c:forEach>
									<c:forEach var="warsztat" items="${resultWarsztat.rows}">
										<c:choose>
											<c:when test="${warsztat.id==numRows}">
												<option selected>
													<c:out
														value="${warsztat.id}. ${warsztat.adres}, ${warsztat.miasto}" />
												</option>
											</c:when>


											<c:otherwise>
												<option>
													<c:out
														value="${warsztat.id}. ${warsztat.adres}, ${warsztat.miasto}" />
												</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
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
						<button type="submit" id="btn_rej"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zapisz</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Powrót</a>
						</button>
					</div>


				</div>

			</form>
		</c:forEach>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8
			col-md-offset-2">
			<%
				String blad = (String) request.getAttribute("blad");
			%>
			<%
				if (blad != null && !blad.equals("")) {
			%>
			<div class="alert alert-danger">
				<%=blad%>
			</div>
			<%
				}
			%>
		</div>
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerAdmin.jsp" />
