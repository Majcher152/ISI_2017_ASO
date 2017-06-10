<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
			<h1 class="page-header">Zamówienie z dnia ${zamowienie.data}, łączny koszt ${zamowienie.koszt} zł</h1>

		
	<table class="table table-hover table-striped table-condensed table-bordered" id="zamowienie">
		<tr>
			<td><b>Nazwa</b></td>
			<td><b>Cena</b></td>
			<td><b>Ilość</b></td>
		</tr>
		<c:forEach var="czesc" items="${zamowienie.czesci}">
			<tr>
				<td><c:out value="${czesc.nazwa} " /></td>
				<td><c:out value="${czesc.cena} zł" /></td>
				<td><c:out value="${czesc.ilosc} " /></td>	
			</tr>
		</c:forEach>
	</table>	
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />