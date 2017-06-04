<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:query dataSource="jdbc/aso" var="result">
SELECT * FROM `cennik_podstawowy`;
</sql:query>

<jsp:include page="header.jsp" />
	<div class="container marketing">
		<div class="row main">
			<div class="main main-center">
			
			<!-- Table -->
				<table style="text-align: center" class="col-lg-3 table table-hover table-striped table-condensed table-bordered">
				<tr>
				<td colspan="2"><b>Cennik</b></td>
				</tr>
					<c:forEach var="cennik" items="${result.rows}">
						<tr>
							<td><c:out value="${cennik.nazwa} " /></td>
							<td><c:out value="${cennik.cena} " /></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>

		<hr class="featurette-divider">

<jsp:include page="footer.jsp" />	