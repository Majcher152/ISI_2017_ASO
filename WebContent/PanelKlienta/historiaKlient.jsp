<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="headerKlient.jsp" />
<jsp:include page="walidacjaDodawaniaSamochodow.jsp" />


<div class="container marketing">


	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title">Twoje samochody:</h2>
				</div>
			</div>

			<div class="main-login main-center">

				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
					<tr>
						<td><b>Model</b></td>
						<td><b>Vin</b></td>
						<td><b>Status</b></td>
						<td><b>Przewidywany czas naprawy</b></td>
						<td><b>Szczegóły</b></td>
					</tr>
					<c:forEach var="formularz" items="${formularze}">


						<tr>
							<td><c:out value="${formularz.samochod.model} " /></td>
							<td><c:out value="${formularz.samochod.vin} " /></td>
							<td><c:out value="${formularz.status} " /></td>
							<td><c:out value="${formularz.przewidywany_czas} " /></td>
				
							<c:choose>
								<c:when test="${samochod.status=='zakonczone'}">			
									<td><a href="HistoriaSzczegolyKlient?formularze=${formularze}">Zobacz</a></td>
  								</c:when>
								<c:otherwise>
    									<td><c:out value="${'brak'} " /></td>
  								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>
				</table>

			</div>
		</div>



		<hr class="featurette-divider">




		<jsp:include page="footerKlient.jsp" />