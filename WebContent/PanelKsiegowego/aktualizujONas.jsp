<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:query dataSource="jdbc/aso" var="result">
SELECT tresc FROM `informacje` where typ_informacji='o_nas';
</sql:query>
<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Aktualizacja strony "O nas"</h1>
		
		<form method="post" action="/ISI_2017_ASO/AktualizacjaONasServlet" class="inline" id="o_nas">
	 <div class="form-group">
  		<label for="tresc">Treść strony:</label>
  		<textarea form="o_nas" class="form-control" rows="5" id="tresc" name="tresc" style="resize:none"><c:forEach var="o_nas" items="${result.rows}"><c:out value="${o_nas.tresc}" /></c:forEach></textarea>
	</div> 	
	
	<div class="form-group-last">
						<button type="submit" id="btn_aktualizuj"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zaakceptuj</button>
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
	</div>
	

</div>



</div>


<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />
