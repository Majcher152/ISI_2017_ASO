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

<sql:query dataSource="jdbc/aso" var="resultPracownik">
SELECT COUNT(*) as liczba ,
 (SELECT COUNT(*) FROM `uzytkownik` where rodzaj_konta = 'Administrator') as liczbaAdmin,
 (SELECT COUNT(*) as liczba FROM `uzytkownik` where rodzaj_konta = 'Uzytkownik') as liczbaUzytkownik,
 (SELECT COUNT(*) FROM `uzytkownik` where rodzaj_konta = 'Ksiegowy') as liczbaKsiegowy,
 (SELECT COUNT(*) FROM `uzytkownik` where rodzaj_konta = 'Mechanik') as liczbaMechanik,
 (SELECT COUNT(*) FROM `warsztat`) as liczbaWarsztat
    FROM `uzytkownik` where rodzaj_konta != 'Uzytkownik';

</sql:query>


<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Statystyka</h1>
		<div class="row main">
			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">

					<c:forEach var="row" items="${resultPracownik.rows}">
						<tr>
							<td>Ilość pracowników:</td>
							<td><c:out value="${row.liczba}"></c:out></td>
						</tr>
						<tr>
							<td>Ilość administratorów:</td>
							<td><c:out value="${row.liczbaAdmin}"></c:out></td>
						</tr>
						<tr>
							<td>Ilość księgowych:</td>
							<td><c:out value="${row.liczbaKsiegowy}"></c:out></td>
						</tr>
						<tr>
							<td>Ilość mechaników:</td>
							<td><c:out value="${row.liczbaMechanik}"></c:out></td>
						</tr>
						<tr>
							<td>Ilość użytkowników:</td>
							<td><c:out value="${row.liczbaUzytkownik}"></c:out></td>
						</tr>
						<tr>
							<td>Ilość warsztatów:</td>
							<td><c:out value="${row.liczbaWarsztat}"></c:out></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>


</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />

