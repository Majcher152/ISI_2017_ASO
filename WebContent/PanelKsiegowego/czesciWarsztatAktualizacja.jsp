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
<jsp:include page="../PanelMechanika/walidacjaAktualizacjiMechanik.jsp" />


<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Stan warsztatu</h1>
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
			<label class="control-label">Warsztat</label>
    					<div>
      						<input readonly="readonly" class="form-control" type="text" name="warsztat" value="${warsztat.adres}, ${warsztat.miasto}" />
    					</div>
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
    			<form method="post" action="KsiegowyWarsztatServlet?metoda=aktualizuj" class="inline">
    			<label class="control-label">Ile dostarczono</label>
    					<div>
      						<input  class="form-control" type="text" name="ile"  id="ile" data-toggle="popover" data-content="ilość użytych części."/>
    					</div>
    					<input type="hidden" name="id_czesc" id="id_czesc" value="${czesc.id}"/>
    					<input type="hidden" name="id_warsztat" id="id_warsztat" value="${warsztat.id}"/>
    			<button type="submit" id="btn_aktualizuj" name="submit_param" value="submit_value" class="link-button">Aktualizuj</button> 
    			</form>
    			<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/KsiegowyWarsztatServlet?metoda=zaladujWarsztat">Powrót</a>
						</button>
    					
			</div>

		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerKsiegowy.jsp" />
