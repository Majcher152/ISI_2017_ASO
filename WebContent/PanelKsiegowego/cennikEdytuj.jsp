<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String idCennika = request.getParameter("id");
	%>
SELECT * FROM `cennik_podstawowy` where id = '<%=idCennika%>';
</sql:query>


<jsp:include page="headerKsiegowy.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="cennik" items="${result.rows}">
			<h1 class="page-header">Edytuj cennik</h1>

			<form action="/ISI_2017_ASO/EdycjaCennikaServlet" method="post">

					
					<input type="hidden" name="id" value="<c:out value="${cennik.id}" />">
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Nazwa usługi</label>
						
							<div class="input-group col-xs-5">
								 <input type="text" class="form-control"
									name="nazwa" id="nazwa"
									value="<c:out value="${cennik.nazwa}" />"
									data-toggle="popover"
									data-content="Nazwa może się składać z maksymalnie 80 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Cena</label>
						<div class="cols-sm-10">
							<div class="input-group col-xs-5">
							 <input type="text" class="form-control"
									name="cena" id="cena"
									value="<c:out value="${cennik.cena}" />"
									data-toggle="popover"
									data-content="Cena może się składać z maksymalnie 15 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<br>
					<div class="form-group-last">
						<button type="submit" id="btn_rej"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zapisz</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelKsiegowego/aktualizujCennikPodstawowy.jsp">Powrót</a>
						</button>
					</div>


			</form>
		</c:forEach>

		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
			<%
				String blad = (String) request.getAttribute("blad");
			%>
			<%
				if (blad != null && !blad.equals("")) {
			%>
			<div class="alert alert-danger">
				<%=blad%>
			</div>
			<%
				}
			%>
		</div>
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />
