<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="pl.komp.aso.dto.Uzytkownik"%>

<%
	Uzytkownik uzytkownik = (Uzytkownik) session.getAttribute("uzytkownik");
%>
<jsp:include page="headerKlient.jsp" />

<div class="container marketing">
	<div class="row main">

		<div class="panel-heading">
			<div class="panel-title text-center">
				<h2 class="title">Usuń konto:</h2>
			</div>
		</div>

		<div class="main-login main-center">
			<form class="form-horizontal" method="post"
				action="/ISI_2017_ASO/UsunUzytkownikPath">
				<div class="form-group ">
					<h3 align="center">Czy na pewno chcesz usunąć swoje konto?</h3>
					<br>
					<div class="col-xs-3">
						<br> <label> <input type="checkbox"
							onchange="document.getElementById('usun').disabled = !this.checked;">
							Tak
						</label>
					</div>

					<div class="col-xs-7 col-xs-offset-2">
						<button type="submit" name="usun" id="usun"
							class="btn btn-danger btn-lg btn-block" disabled="disabled">Usun</button>
					</div>

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
			</form>
		</div>
	</div>



</div>
<hr class="featurette-divider">

<jsp:include page="footerKlient.jsp" />