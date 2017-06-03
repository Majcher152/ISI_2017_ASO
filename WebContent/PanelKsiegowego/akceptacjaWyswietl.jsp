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

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String vin = request.getParameter("vin");
	%>
SELECT * FROM `formularz_naprawy` where vin_fk = '<%=vin%>';
</sql:query>

<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">

<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
	<c:forEach var="vin" items="${result.rows}">
			<h1 class="page-header">
				Akceptacja naprawy: <c:out value="${vin.vin_fk}" />
			</h1>

			<form action="/ISI_2017_ASO/AdminEdycjaInformacjiPath" method="post">

				<div class="main-login main-center">
					<fieldset disabled>
					<div class="form-group">
    					<label class="control-label">Login użytkownika</label>
    					<div>
    						<input class="form-control" type="text" name="login" value="<c:out value="${vin.uzytkownik_login_fk}" />">
    					</div>
 					</div>
 					
 					<sql:query dataSource="jdbc/aso" var="uzytkownik">
						SELECT * FROM `uzytkownik` where login = '${vin.uzytkownik_login_fk}';
						</sql:query>
						<c:forEach var="uzytkownik" items="${uzytkownik.rows}">
 					<div class="form-group">
    					<label class="control-label">Imie i nazwisko użytkownika</label>
    					<div>
      						<input class="form-control" type="text" name="uzytkownik" value="<c:out value="${uzytkownik.imie}" /> <c:out value="${uzytkownik.nazwisko}" />">
    					</div>
    					
 					</div>
 					
 					<div class="form-group">
    					<label class="control-label">Numer telefonu</label>
    					<div>
      						<input class="form-control" type="text" name="nr_tel" value="<c:out value="${uzytkownik.numer_telefonu}" />">
    					</div>
    					
 					</div>
 					
 					</c:forEach>
 					
 					<div class="form-group">
    					<label class="control-label">VIN samochodu</label>
    					<div>
      						<input class="form-control" type="text" name="vin" value="<c:out value="${vin.vin_fk}" />">
    					</div>
 					</div>
 					
 					<div class="form-group">
    					<label class="control-label">Warsztat</label>
    					<sql:query dataSource="jdbc/aso" var="warsztat">
						SELECT * FROM `warsztat` where id = '${vin.warsztat_id_fk}';
						</sql:query>
						<c:forEach var="warsztat" items="${warsztat.rows}">
    					<div>
      						<input class="form-control" type="text" name="adres" value="<c:out value="${warsztat.miasto}" />, <c:out value="${warsztat.adres}" />">
    					</div>
    					</c:forEach>
 					</div>
 					
 					<div class="form-group">
 						<label class="control-label">Opis usterki</label>
	 					<div class="form-group">
	 						<input class="form-control" type="text" name="opis" value="<c:out value="${vin.opis}" />">
						</div>
					</div>
					
					</fieldset>
					
					<div class="form-group">
 						<label class="control-label">Data oddania</label>
	 					<div class="form-group">
	 						<input class="form-control" type="text" name="opis" value="<c:out value="${vin.dataoddania}" />">
						</div>
					</div>
					
					<div class="form-group">
 						<label class="control-label">Przewidywany czas trwania naprawy</label>
	 					<div class="form-group">
	 						<input class="form-control" type="text" name="opis">
						</div>
					</div>
					
					<div class="form-group-last">
						<button type="submit" id="btn_rej"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zaakceptuj</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelKsiegowego/akceptacjaNapraw.jsp">Powrót</a>
						</button>
					</div>

					
				</div>


			</form>

		</c:forEach>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerKsiegowy.jsp" />
