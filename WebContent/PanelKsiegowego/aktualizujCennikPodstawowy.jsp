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
		<h1 class="page-header">Aktualizacja cennika podstawowego -
			księgowy</h1>
		<!-- Table -->
		<table style="text-align: center"
			class="col-lg-3 table table-hover table-striped table-condensed table-bordered">
			<tr>
				<td colspan="3"><b>Cennik</b></td>
			</tr>
			<c:forEach var="cennik" items="${result.rows}">
				<tr>
					<td><c:out value="${cennik.nazwa} " /></td>
					<td><c:out value="${cennik.cena} " /></td>
					<td><form method="post"
									action="/ISI_2017_ASO/PanelKsiegowego/cennikEdytuj.jsp"
									class="inline">
									<input type="hidden" name="id" value="${cennik.id} ">
									<button type="submit" name="submit_param" value="submit_value"
										class="link-button">Edytuj</button>
								</form></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<a href="">Dodaj do cennika</a>

	</div>
</div>

</div>


<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />
