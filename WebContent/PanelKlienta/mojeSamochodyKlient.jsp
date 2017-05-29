<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="headerKlient.jsp" />
<jsp:include page="walidacjaDodawaniaSamochodow.jsp" />


<div class="container marketing">

	
	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Twoje samochody:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
				<tr>
				<td><b>Model</b></td>
				<td><b>Typ</b></td>
				<td><b>Silnik</b></td>
				<td><b>Rocznik</b></td>
				<td><b>Vin</b></td>
				<td><b>Czy w warsztacie?</b></td>
				<td><b>Usunąć?</b></td>
				</tr>
					<c:forEach var="samochod" items="${samochody}">
						<tr>
							<td><c:out value="${samochod.model} " /></td>
							<td><c:out value="${samochod.typ} " /></td>
							<td><c:out value="${samochod.silnik} " /></td>
							<td><c:out value="${samochod.rocznik} " /></td>
							<td><c:out value="${samochod.vin} " /></td>
							<td><c:out value="${samochod.warsztat} " /></td>
							<td><a
								href="Samochody2Servlet?method=usun&vin=${samochod.vin}">Usuń</a></td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
		</div>
	
	
	
	<hr class="featurette-divider">




<jsp:include page="footerKlient.jsp" />