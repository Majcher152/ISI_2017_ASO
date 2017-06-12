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
<jsp:include page="walidacjaFormularzaMechanik.jsp" />

<div class="container marketing">

<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
	
			<h1 class="page-header">
				Formularz naprawy: <c:out value="${formularz.samochod.vin}" />
			</h1>

			<form action="/ISI_2017_ASO/MechanikNaprawaServlet?metoda=zakoncz" method="post">

				<div class="main-login main-center">
					
					<%String blad =(String) request.getAttribute("blad"); %>
						<%if(blad!=null && !blad.equals("")){ %>
						<div class="alert alert-danger"> <%=blad %> 
						</div>
						<%} %>
					<div class="blad"></div>
					
					
					
					<div class="form-group">
 						<label class="control-label">Data odebrania</label>
	 					<div class="form-group">
	 						<input class="form-control" type="text" name="dataodebrania" id="dataodebrania" data-toggle="popover" data-content="Data w formacie dd/MM/yyyy">
						</div>
					</div>
					
					<div class="form-group">
 						<label class="control-label">Koszt naprawy</label>
	 					<div class="form-group">
	 						<input class="form-control" type="text" name="koszt" id="koszt" data-toggle="popover" data-content="Liczba z maksymalnie jedną kropką.">
						</div>
					</div>
					
					<div class="form-group">
 						<label class="control-label">Opis</label>
	 					<div class="form-group">
	 						<textarea  id="opis" name="opis" class="form-control" maxlength="200" rows="4" style="width:100%;overflow:auto;resize:none" data-toggle="popover" data-content="Makymalnie 200 znaków."></textarea>
						</div>
					</div>
					<input type="hidden" name="id" value="${formularz.id}">
					<div class="form-group-last">
						<button type="submit" id="btn_zakoncz"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zakończ</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/MechanikNaprawaServlet?metoda=zaladujZadaniaWTrakcie">Powrót</a>
						</button>
					</div>

					
				</div>


			</form>

		
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerMechanik.jsp" />
