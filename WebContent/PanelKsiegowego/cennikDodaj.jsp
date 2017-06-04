<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<jsp:include page="headerKsiegowy.jsp" />
<jsp:include page="walidacjaDodaniaCennika.jsp" />

<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
			<h1 class="page-header">Dodaj do cennika</h1>

			<form action="/ISI_2017_ASO/DodanieCennikaServlet" method="post">

					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Nazwa usługi</label>
						
							<div class="input-group col-xs-5">
								 <input type="text" class="form-control"
									name="nazwa" id="nazwa"
									data-toggle="popover"
									data-content="Nazwa musi się składać z 3 do 80 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Cena</label>
						<div class="cols-sm-10">
							<div class="input-group col-xs-5">
							 <input type="text" class="form-control"
									name="cena" id="cena"
									data-toggle="popover"
									data-content="Cena musi się składać z 3 do 15 znaków" /> <span
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
	<br><br><br>
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
			
			<div class="blad"></div>
		</div>
	</div>
</div>
</div>

<hr class="featurette-divider">


<jsp:include page="footerKsiegowy.jsp" />
