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

	<%
		String emailWarsztatu = request.getParameter("email");
	%>
SELECT * FROM `warsztat` where email = '<%=emailWarsztatu%>';
</sql:query>

<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">

	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="warsztat" items="${result.rows}">
			<h1 class="page-header">
				<c:out value="Warsztat ${warsztat.id}" />
			</h1>

			<div class="row main">
				<div class="panel panel-default">
					<!-- Table -->
					<table class="table table-hover table-striped table-condensed">

						<tr>
							<td>Adres:</td>
							<td><c:out value="${warsztat.adres}" /></td>
						</tr>
						<tr>
							<td>Miasto:</td>
							<td><c:out value="${warsztat.miasto}" /></td>
						</tr>
						<tr>
							<td>Numer telefonu:</td>
							<td><c:out value="${warsztat.numer_telefonu}" /></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><c:out value="${warsztat.email}" /></td>
						</tr>
						<tr>
							<td>Ilość stanowisk:</td>
							<td><c:out value="${warsztat.ilosc_stanowisk}" /></td>
						</tr>
						<tr>
							<td>Godzina otwarcia:</td>
							<td><c:out value="${warsztat.godzina_otwarcia}" /></td>
						</tr>
						<tr>
							<td>Godzina zamkniecia:</td>
							<td><c:out value="${warsztat.godzina_zamkniecia}" /></td>
						</tr>

					</table>
				</div>

			</div>

			<div class="form-group-last">
				<form method="post"
					action="/ISI_2017_ASO/PanelAdmina/warsztatyEdytujAdmin.jsp"
					class="inline">
					<input type="hidden" name="email" value="${warsztat.email} ">
					<button type="submit" id="buttonEdytuj"
						class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Edytuj</button>
				</form>


				<button type="button" id="powrot"
					class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
					<a href="/ISI_2017_ASO/PanelAdmina/warsztatyAdmin.jsp">Powrót</a>
				</button>
			</div>



		</c:forEach>
	</div>
</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />
