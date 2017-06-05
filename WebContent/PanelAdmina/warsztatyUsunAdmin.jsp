<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String emailWarsztat = request.getParameter("email");
	%>
SELECT * FROM `warsztat` where email = '<%=emailWarsztat%>';
</sql:query>


<jsp:include page="headerAdmin.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="warsztat" items="${result.rows}">
			<h1 class="page-header">Usun warsztat</h1>

			<form action="/ISI_2017_ASO/AdminUsuwaniePath" method="post">
				<div class="main-login main-center">

					<h3>
						Czy na pewno chcesz usunąć warsztat na ulicy <b><c:out
								value="${warsztat.adres}" /></b> w mieście <b><c:out
								value="${warsztat.miasto}" /></b>? <input type="hidden" name="adres"
							id="adres" value="<c:out value="${warsztat.adres}" />" /> <input
							type="hidden" name="miasto" id="miasto"
							value="<c:out value="${warsztat.miasto}" />" /> <input
							type="hidden" name="id_warsztatu" id="id_warsztatu"
							value="<c:out value="${warsztat.id}" />" />
					</h3>

					<br>

					<div class="form-group-last">
						<button type="submit" id="btn_usun_warsztat"
							class="btn_usun_warsztat btn-danger btn-sm col-sm-2  col-md-1 ">Usuń</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelAdmina/warsztatyAdmin.jsp">Powrót</a>
						</button>
					</div>


				</div>

			</form>
		</c:forEach>
	</div>
</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerAdmin.jsp" />
