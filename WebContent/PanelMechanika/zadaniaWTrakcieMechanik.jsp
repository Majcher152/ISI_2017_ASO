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




<jsp:include page="headerMechanik.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Zadania w trakcie realizacji</h1>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
					<%
		String blad = (String) request.getAttribute("blad");
	%>
	<%
		if (blad != null && ((blad.equals("Zakończono zadanie. Wysłano wiadomość email do klienta.") ) )) {
	%>
	<div class="alert alert-success">
		<p style="text-align: center"><%=blad%></p>
	</div>
	<%
		} else if (blad != null && !blad.equals("")) {
	%>
	<div class="alert alert-danger">
		<p style="text-align: center"><%=blad%></p>
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
				<td><b>VIN</b></td>
				<td><b>Data</b></td>
				<td><b>Uzupełnij formularz</b></td>
				</tr>
					<c:forEach var="formularz" items="${formularze}">
						<tr>
							<td><c:out
									value="${formularz.samochod.vin}" /></td>
							<td><c:out
									value="${formularz.dataOddania}" /></td>
									
								<td><form method="post"
									action="MechanikNaprawaServlet?metoda=zaladujUzupelnij"
									class="inline">
									<input type="hidden" name="id" value="${formularz.id}">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Uzupełnij</button>
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

  
<jsp:include page="footerMechanik.jsp" />
