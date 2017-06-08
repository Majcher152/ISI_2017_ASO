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
<jsp:include page="walidacjaAktualizacjiMechanik.jsp" />


<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Stan magazynu</h1>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
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
		<div class="blad"></div>
		
		
		<div class="row main">

			<div class="panel panel-default">
				<label class="control-label">Model samochodu</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="model" value="${samochod.model}" />
    					</div>
    			<label class="control-label">Typ samochodu</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="typ" value="${samochod.typ}" />
    					</div>
    			<label class="control-label">Rocznik samochodu</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="rocznik" value="${samochod.rocznik}" />
    					</div>
    			<label class="control-label">Silnik samochodu</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="silnik" value="${samochod.silnik}" />
    					</div>
    					
    			<label class="control-label">Nazwa części</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="nazwa" value="${czesc.nazwa}" />
    					</div>
    			<label class="control-label">Aktualna ilość</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="ilosc" value="${czesc.ilosc}" />
    					</div>
    			<form method="post" action="MagazynMechanikServlet?metoda=aktualizuj" class="inline">
    			<label class="control-label">Ile użyto</label>
    					<div>
      						<input  class="form-control" type="text" name="ile"  id="ile" data-toggle="popover" data-content="ilość użytych części."/>
    					</div>
    					<input type="hidden" name="id" id="id" value="${czesc.id}"/>
    			<button type="submit" id="btn_aktualizuj" name="submit_param" value="submit_value" class="link-button">Aktualizuj</button> 
    			</form>
    					
			</div>

		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerMechanik.jsp" />
