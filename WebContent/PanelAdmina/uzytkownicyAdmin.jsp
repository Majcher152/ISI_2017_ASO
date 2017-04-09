<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<style>
.table-striped > tbody > tr:nth-child(odd) >td,
.table-striped > tbody > tr:nth-child(odd)>th{
background-color: #f0f0f0;
}

.table-hover > tbody > tr:hover >td,
.table-hover > tbody > tr:hover >th{
background-color: #46b8da;
}


</style>

<jsp:include page="headerAdmin.jsp" />

<div class="container marketing">


<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
				<h1 class="page-header">Użytkownicy</h1>

<div class="row main">

			<div class="panel panel-default">
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
				<% for ( int i = 0; i < 3; i++ ) { %>
					<tr>
						<td>Kamil Płaczek4</td>
						<td><a href="uzytkownicyWyswietlAdmin.jsp">Wyświetl</a></td>
						<td><a href="uzytkownicyEdytujAdmin.jsp">Edytuj</a></td>
						<td><a href="uzytkownicyUsunAdmin.jsp">Usuń</a></td>
					</tr>
  				<% } %>
				</table>
			</div>

		</div>
				<div class=" bottom">
		<p><a href="uzytkownicyDodajAdmin.jsp">Nowy użytkownik</a></p>
	</div>
			</div>
		</div>

	</div>

<hr class="featurette-divider">

<jsp:include page="footerAdmin.jsp" />