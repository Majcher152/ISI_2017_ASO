<%@page import="pl.komp.aso.dto.Uzytkownik"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
Uzytkownik user = (Uzytkownik) session.getAttribute("uzytkownik"); 
String login = user.getLogin();
%>


<sql:query dataSource="jdbc/aso" var="result">
select * from czesc join samochod_czesc on czesc.id=samochod_czesc.czesc_id_fk join uzytkownik_samochod on samochod_czesc.samochod_id_fk=uzytkownik_samochod.Samochod_if_fk join samochod on samochod.samochod_id=uzytkownik_samochod.Samochod_if_fk where uzytkownik_samochod.Uzytkownik_login_fk="<%=login %>"  ;
</sql:query>

<jsp:include page="headerKlient.jsp" />
	<div class="container marketing">
		<div class="row main">
			<div class="main main-center">
			<br><br>
			<!-- Table -->
				<table style="text-align: center" class="col-lg-3 table table-hover table-striped table-condensed table-bordered">
				<tr>
				<td colspan="3"><b>Cennik rozszerzony</b></td>
				</tr>
				<tr>
				<td><b>Model</b></td>
				<td><b>Część</b></td>
				<td><b>Cena</b></td>
				</tr>
					<c:forEach var="cennik" items="${result.rows}">
						<tr>
							<td><c:out value="${cennik.model} " /></td>
							<td><c:out value="${cennik.nazwa} " /></td>
							<td><c:out value="${cennik.cena_za_sztuke} zł" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>

		<hr class="featurette-divider">

<jsp:include page="footerKlient.jsp" />	