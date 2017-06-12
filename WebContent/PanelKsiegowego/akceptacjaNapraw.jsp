<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

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
SELECT * FROM `formularz_naprawy` where status = 'oczekiwanie';
</sql:query>


<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Akceptacja terminów napraw</h1>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
			<%
						String blad = (String) request.getAttribute("blad");
					%>
					<%
						if (blad != null && blad.equals("Zaakceptowano termin rezerwacji.")) {
					%>
					<div class="alert alert-success">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
						}
					else if (blad != null && !blad.equals("")) { 
					%>
					<div class="alert alert-danger">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
					}
					%>
		</div>
		<div class="row main">

			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
				<tr>
				<td><b>Login</b></td>
				<td><b>VIN</b></td>
				<td><b>Wyświetl</b></td>
				</tr>
					<c:forEach var="do_realizacji" items="${result.rows}">
						<tr>
							<td><c:out
									value="${do_realizacji.uzytkownik_login_fk}" /></td>
							<td><c:out
									value="${do_realizacji.vin_fk}" /></td>
							<td><form method="post"
									action="/ISI_2017_ASO/PanelKsiegowego/akceptacjaWyswietl.jsp"
									class="inline">
									<input type="hidden" name="id_formularza" value="${do_realizacji.id} ">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Wyświetl</button>
								</form></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerKsiegowy.jsp" />
