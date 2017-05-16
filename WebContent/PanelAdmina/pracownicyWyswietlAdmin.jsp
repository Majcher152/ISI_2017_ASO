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

<% String emailUzytkownika = request.getParameter("email"); %>
SELECT * FROM `uzytkownik` where email = '<%= emailUzytkownika %>';
</sql:query>

<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">

	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
	<c:forEach var="uzytkownik" items="${result.rows}">
		<h1 class="page-header"><c:out value="${uzytkownik.imie} ${uzytkownik.nazwisko}" /></h1>

		<div class="row main">
			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
					
						<tr>
							<td>Login:</td>
							<td><c:out value="${uzytkownik.login}" /></td>
						</tr>
						<tr>
							<td>Haslo:</td>
							<td><c:out value="${uzytkownik.haslo}" /></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><c:out value="${uzytkownik.email}" /></td>
						</tr>
						<tr>
							<td>Numer telefonu:</td>
							<td><c:out value="${uzytkownik.numer_telefonu}" /></td>
						</tr>
						<tr>
							<td>Rodzaj konta:</td>
							<td><c:out value="${uzytkownik.rodzaj_konta}" /></td>
						</tr>
					
				</table>
			</div>

		</div>
		</c:forEach>
				<div class="form-group-last">
					<button type="button" id="buttonEdytuj"
						class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">
						<a href="/ISI_2017_ASO/PanelAdmina/pracownicyEdytujAdmin.jsp">Edytuj</a></button>
					<button type="button" id="powrot"
						class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
						<a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Powrót</a>
					</button>
				</div>




	</div>
</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />
