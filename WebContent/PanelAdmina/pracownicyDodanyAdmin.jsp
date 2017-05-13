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

<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">

		<div class="row main">
			<div class="alert alert-success">
				Zarejestrowano pomyślnie pracownika:
				<%
				String message = (String) request.getAttribute("msg");
				out.println(" " + message);
			%>
				<%
					// Odswiezanie strony po 5 sekundach 
					// i powrot do listy pracownikow
					response.addHeader("Refresh", "5; http://localhost:8080/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp");
				%>
			</div>
			<button type="button" id="Kontynuuj"
				class="button col-sm-2 col-sm-offset-8 col-md-2 col-md-offset-9">
				<a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Kontynuuj</a>
			</button>
		</div>

	</div>


</div>

</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />

