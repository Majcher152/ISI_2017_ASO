<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="jdbc/aso" var="result">

	<%
		String emailUzytkownika = request.getParameter("email");
	%>
SELECT * FROM `uzytkownik` where email = '<%=emailUzytkownika%>';
</sql:query>


<jsp:include page="headerAdmin.jsp" />
<jsp:include page="walidacjaEdycji.jsp" />


<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		<c:forEach var="uzytkownik" items="${result.rows}">
			<h1 class="page-header">Usun pracownika</h1>

			<form action="/ISI_2017_ASO/AdminUsuwaniePath" method="post">
				<div class="main-login main-center">

					<h3>
						Czy na pewno chcesz usunąć pracownika <b><c:out
								value="${uzytkownik.imie}  ${uzytkownik.nazwisko}" /></b>? <input
							type="hidden" name="imie" id="imie"
							value="<c:out value="${uzytkownik.imie}" />" /> <input
							type="hidden" name="nazwisko" id="nazwisko"
							value="<c:out value="${uzytkownik.nazwisko}" />" /> <input
							type="hidden" name="email" id="email"
							value="<c:out value="${uzytkownik.email}" />" /> <input
							type="hidden" name="rodzaj_konta" id="rodzaj_konta"
							value="<c:out value="${uzytkownik.rodzaj_konta}" />" /> <input
							type="hidden" name="login" id="login"
							value="<c:out value="${uzytkownik.login}" />" />
					</h3>

					<br>

					<div class="form-group-last">
						<button type="submit" id="btn_rej"
							class="btn_rej btn-danger btn-sm col-sm-2  col-md-1 ">Usuń</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelAdmina/pracownicyAdmin.jsp">Powrót</a>
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
