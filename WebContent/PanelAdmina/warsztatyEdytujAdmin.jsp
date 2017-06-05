<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String emailWarsztatu = request.getParameter("email");
	%>
SELECT * FROM `warsztat` where email = '<%=emailWarsztatu%>';
</sql:query>


<jsp:include page="headerAdmin.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="warsztat" items="${result.rows}">
			<h1 class="page-header">Edytuj warsztat</h1>
			<form action="/ISI_2017_ASO/AdminEdycjaInformacjiPath" method="post">

				<div class="main-login main-center">
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Adres:</label>
						<div class="cols-sm-10">
							<input type="hidden" class="form-control" name="id_warsztatu"
								id="id_warsztatu" value="<c:out value="${warsztat.id}" />" />
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="adres" id="adres"
									value="<c:out value="${warsztat.adres}" />"
									placeholder="Podaj nazwe ulicy." data-toggle="popover"
									data-content="Adres musi składać się z 3 do 40 liter lub liczb" />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Nazwa
							miasta:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="miasto" id="miasto"
									value="<c:out value="${warsztat.miasto}" />"
									placeholder="Podaj nazwe ulicy." data-toggle="popover"
									data-content="Nazwa miasta musi składać się z 3 do 15 liter." />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Numer
							kontaktowy:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="numer_telefonu" id="numer_telefonu"
									value="<c:out value="${warsztat.numer_telefonu}" />"
									placeholder="Podaj numer telefonu warsztatu."
									data-toggle="popover"
									data-content="Numer telefonu musi składać się z 9 cyfr." /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">E-mail
							warsztatu:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="email" class="form-control" name="email" id="email"
									value="<c:out value="${warsztat.email}" />"
									placeholder="Podaj e-mail warsztatu" data-toggle="popover"
									data-content="Adres e-mail musi być w formacie email@przyklad.pl." />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Godziny
							otwarcia:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="godzina_otwarcia"
									id="godzina_otwarcia"
									value="<c:out value="${warsztat.godzina_otwarcia}" />"
									placeholder="Podaj godzinę otwarcia warsztatu."
									data-toggle="popover"
									data-content="Godzina otwarcia musi być liczbą z przedziału 00:00-23:59." />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Godziny
							zamknięcia:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="godzina_zamkniecia"
									id="godzina_zamkniecia"
									value="<c:out value="${warsztat.godzina_zamkniecia}" />"
									placeholder="Podaj godzinę otwarcia warsztatu."
									data-toggle="popover"
									data-content="Godzina otwarcia musi być liczbą z przedziału 00:00-23:59." />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="form-group321">
						<label for="email" class="cols-sm-2 control-label">Ilość
							stanowisk:</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="ilosc_stanowisk" id="ilosc_stanowisk"
									value="<c:out value="${warsztat.ilosc_stanowisk}" />"
									placeholder="Podaj ilość stanowisk." data-toggle="popover"
									data-content="Ilość stanowisk musi posiadać od 1 do 4 cyfr." />
								<span class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					<br>
					<div class="form-group-last">
						<button type="submit" id="btn_edytuj_warsztat"
							class="btn_edytuj_warsztat btn-primary btn-sm col-sm-2  col-md-1 ">Edytuj</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelAdmina/warsztatyAdmin.jsp">Powrót</a>
						</button>
					</div>


				</div>

			</form>
		</c:forEach>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
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
