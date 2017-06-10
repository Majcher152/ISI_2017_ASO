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




<jsp:include page="headerKsiegowy.jsp" />


<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		
		<h1 class="page-header">Zamówienie</h1>
		<%
		String blad = (String) request.getAttribute("blad");
	%>
	<%
		if (blad != null && ((blad.equals("Zaktualizowano.")))) {
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
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
			
		</div>
		<div class="blad"></div>
		
				<!-- Table -->
						</div>
    			<label class="control-label">Całkowity koszt</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="koszt" value="${koszt}" />
    					</div>
    					</br>
				<table class="table table-hover table-striped table-condensed"  id="zamowienie">
				<tr>
				<td><b>Nazwa</b></td>
				<td><b>Cena</b></td>
				<td><b>Ilość</b></td>
				<td><b>Usuń z zamówienia</b></td>	
				</tr>
				<c:forEach var="czesc" items="${czesci}">
						<tr>
							<td><c:out value="${czesc.nazwa} " /></td>
							<td><c:out value="${czesc.cena} " /></td>
							<td><c:out value="${czesc.ilosc} " /></td>
							
							<td><a
								href="KsiegowyMagazynServlet?metoda=usun&id_czesc=${czesc.id}">Usuń</a></td>
						</tr>
					</c:forEach>
				</table>
				</br>
				<a href="KsiegowyMagazynServlet?metoda=zamow&koszt=${koszt}">Złóż zamówienie</a>
				
			
			</div>
			
		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerKsiegowy.jsp" />
