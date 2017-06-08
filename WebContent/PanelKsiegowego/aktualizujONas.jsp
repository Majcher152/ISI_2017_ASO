<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:query dataSource="jdbc/aso" var="result">
SELECT * FROM `cennik_podstawowy`;
</sql:query>
<jsp:include page="headerKsiegowy.jsp" />

<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<h1 class="page-header">Aktualizacja strony "O nas"</h1>
		


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
