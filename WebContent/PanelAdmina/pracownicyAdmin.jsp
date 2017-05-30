<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<style>
.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: #f0f0f0;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #46b8da;
}
</style>

<sql:query dataSource="jdbc/aso" var="result">
SELECT * FROM `uzytkownik` where rodzaj_konta != 'Uzytkownik';
</sql:query>



<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Pracownicy</h1>

		<div class="row main">
			<!--  request get parameter  -->

			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
					<c:forEach var="uzytkownik" items="${result.rows}">
						<tr>
							<td><c:out
									value="${uzytkownik.imie}  ${uzytkownik.nazwisko}" /></td>
							<td><form method="post"
									action="/ISI_2017_ASO/PanelAdmina/pracownicyWyswietlAdmin.jsp"
									class="inline">
									<input type="hidden" name="email" value="${uzytkownik.email} ">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Wyświetl</button>
								</form></td>
							<td><form method="post"
									action="/ISI_2017_ASO/PanelAdmina/pracownicyEdytujAdmin.jsp"
									class="inline">
									<input type="hidden" name="email" value="${uzytkownik.email} ">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Edytuj</button>
								</form></td>
							<td><form method="post"
									action="/ISI_2017_ASO/PanelAdmina/pracownicyUsunAdmin.jsp"
									class="inline">
									<input type="hidden" name="email" value="${uzytkownik.email} ">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Usuń</button>
								</form></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
		<div class=" bottom">
			<p>
				<a href="/ISI_2017_ASO/PanelAdmina/pracownicyDodajAdmin.jsp">Nowy
					pracownik</a>
			</p>
		</div>
	</div>


</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />

