<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Promocje</h1>
		
		<form method="post" action="/ISI_2017_ASO/KsiegowyPromocjeServlet" class="inline" id="email">
	 <div class="form-group">
  		<label for="tresc">Treść e-maila:</label>
  		<textarea form="email" class="form-control" rows="10" id="tresc" name="tresc" style="resize:none"></textarea>
	</div> 	
	
	<div class="form-group-last">
						<button type="submit" id="btn_aktualizuj"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Wyślij</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelKsiegowego/aktualizujTresc.jsp">Powrót</a>
						</button>
	</div>
	</form>
		

	<br>
	<br>
	<%
		String blad = (String) request.getAttribute("blad");
	%>
	<%
		if (blad != null && ((blad.equals("Wysłano wiadomości do wszystkich klientów.")))) {
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
	

</div>



</div>


<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />
