

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
					<h2 class="title">Szczegóły:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				
				<!-- Table -->
				<table class="table table-hover table-striped table-condensed">
				
					<tr>
						<td><b>Data oddania</b></td>
						<td><b>Data odebrania</b></td>
						<td><b>Opis</b></td>
						<td><b>Koszt</b></td>
							
					</tr>
					

						<tr>
							<td><c:out value='${param.dataOddania}' /></td>
							<td><c:out value='${param.dataOdebrania} ' /></td>
							<td><c:out value='${param.opis} ' /></td>
							<td><c:out value='${param.koszt} ' /></td>
							

						</tr>
					
				</table>

			</div>
		</div>



		<hr class="featurette-divider">




		<jsp:include page="footerKlient.jsp" />