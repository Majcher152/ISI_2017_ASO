<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
			<h1 class="page-header">Historia zamówień</h1>

						
	<table class="table table-hover table-striped table-condensed table-bordered" id="zamowienie">
		<tr>
			<td><b>Data</b></td>
			<td><b>Koszt</b></td>
			<td><b>Szczegóły</b></td>
		</tr>
		<c:forEach var="zamowienie" items="${zamowienia}">
			<tr>
				<td><c:out value="${zamowienie.data} " /></td>
				<td><c:out value="${zamowienie.koszt} zł" /></td>
				<td><a href="KsiegowyHistoriaServlet?metoda=zaladujZamowieniaSzczegoly&id=${zamowienie.id}">Zobacz</a></td>
			</tr>
		</c:forEach>
	</table>	
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />