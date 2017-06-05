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
		
		<script type="text/javascript">
			$( document ).ready(function() {
				$.ajax({
                    type: "POST",
                    url: "MagazynMechanikServlet?metoda=zaladujRoczniki",
                    data: {model: $model.val() },
                    success: function(ret){
                        $("#rocznik").html(ret); 
                        $.ajax({
                            type: "POST",
                            url: "MagazynMechanikServlet?metoda=zaladujTypy",
                            data: {model: $model.val(), rocznik: $rocznik.val() },
                            success: function(ret){
                                $("#typ").html(ret);   
                                $.ajax({
                                    type: "POST",
                                    url: "MagazynMechanikServlet?metoda=zaladujSilniki",
                                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
                                    success: function(ret){
                                        $("#silnik").html(ret);   
                                    },
                                    /*Działania wykonywane w przypadku błędu*/
                                    error: function(blad) {
                                       // alert( ret);
                                        console.log(blad); /*Funkcja wyświetlająca informacje 
                                        o ewentualnym błędzie w konsoli przeglądarki*/
                                    }
                                });
                            },
                            /*Działania wykonywane w przypadku błędu*/
                            error: function(blad) {
                               // alert( ret);
                                console.log(blad); /*Funkcja wyświetlająca informacje 
                                o ewentualnym błędzie w konsoli przeglądarki*/
                            }
                        });
                    },
                    /*Działania wykonywane w przypadku błędu*/
                    error: function(blad) {
                       // alert( "Wystąpił błąd");
                        console.log(blad); /*Funkcja wyświetlająca informacje 
                        o ewentualnym błędzie w konsoli przeglądarki*/
                    }
                });
    
});</script>
		<div class="row main">

			<div class="panel panel-default">
				<b>Model</b>
				
				<select name="model" id="model" class="form-control">
					    <c:forEach items="${modele}" var="model">
					        <option value="${model}"><c:out value="${model}" /></option>
					    </c:forEach>
					</select>
			
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
				<tr>
				<td><b>Nazwa</b></td>
				<td><b>Ilość</b></td>
				<td><b></b></td>
				</tr>
					<c:forEach var="czesc" items="${czesci}">
						<tr>
							<td><c:out
									value="${czesc.samochod.vin}" /></td>
							<td><c:out
									value="${formularz.dataOddania}" /></td>
									
							<c:choose>
								<c:when test="${formularz.zmien==true}">			
									<td><form method="post"
									action="MechanikNaprawaServlet?metoda=zmienStatusNaprawy"
									class="inline">
									<input type="hidden" name="id" value="${formularz.id}">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Zmień</button>
								</form></td>
  								</c:when>
								<c:otherwise>
    									<td><c:out value="" /></td>
  								</c:otherwise>
							</c:choose>		
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerMechanik.jsp" />
