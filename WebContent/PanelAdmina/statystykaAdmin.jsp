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
SELECT * FROM `uzytkownik` where rodzaj_konta != 'Uzytkownik';
</sql:query>
<sql:query dataSource="jdbc/aso" var="resultUzytkownik">
SELECT * FROM `uzytkownik` where rodzaj_konta = 'Uzytkownik';
</sql:query>


<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Statystyka</h1>
		<div class="row main">
			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
						<tr>
							<td>Ilość pracowników:</td>
							<td><c:out value="resultPracownik.imie"></c:out></td>
							
						</tr>
												<tr>
							<td>Ilość uzytkowników:</td>
							<td><c:out value="${resultUzytkownik.rows.}"></c:out></td>
							
						</tr>
				</table>
			</div>

		</div>
	</div>


</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />

