<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<jsp:include page="headerKsiegowy.jsp" />
<jsp:include page="walidacjaDodaniaSamochodu.jsp" />

<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
			<h1 class="page-header">Zamówienie</h1>

			<%
			String blad = (String) request.getAttribute("blad");
		%>
		<%
			if (blad != null && ((blad.equals("Usunięto pozycję z zamówienia.")))) {
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
		
		<div class="blad"></div>

			
		<label class="control-label">Całkowity koszt</label>
	<div>
		<input readonly="readonly" class="form-control" type="text"
			name="koszt" value="${koszt} zł" />
	</div>
	</br>
	<table class="table table-hover table-striped table-condensed table-bordered" id="zamowienie">
		<tr>
			<td><b>Nazwa</b></td>
			<td><b>Cena</b></td>
			<td><b>Ilość</b></td>
			<td><b>Usuń z zamówienia</b></td>
		</tr>
		<c:forEach var="czesc" items="${czesci}">
			<tr>
				<td><c:out value="${czesc.nazwa} " /></td>
				<td><c:out value="${czesc.cena} zł" /></td>
				<td><c:out value="${czesc.ilosc} " /></td>

				<td><a href="KsiegowyMagazynServlet?metoda=usun&id_czesc=${czesc.id}">Usuń</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form method="post" action="KsiegowyMagazynServlet?metoda=zamow" class="inline">
    			
    					
    					<input type="hidden" name="koszt" id="koszt" value="${koszt}"/>
    			<button type="submit" id="btn_aktualizuj" name="submit_param" value="submit_value" class="link-button">Złóż zamówienie</button> 
    			</form>
	
		
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />