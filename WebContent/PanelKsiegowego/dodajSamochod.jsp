<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<jsp:include page="headerKsiegowy.jsp" />
<jsp:include page="walidacjaDodaniaSamochodu.jsp" />

<div class="container marketing">
	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
			<h1 class="page-header">Dodaj samochód</h1>

			<form action="/ISI_2017_ASO/DodanieSamochoduServlet" method="post">

					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Model</label>
						
							<div class="input-group col-xs-5">
								 <input type="text" class="form-control"
									name="model" id="model"
									data-toggle="popover"
									data-content="Model musi składać się z 2 do 50 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Rocznik</label>
						<div class="cols-sm-10">
							<div class="input-group col-xs-5">
							 <input type="text" class="form-control"
									name="rocznik" id="rocznik"
									data-toggle="popover"
									data-content="Rocznik musi składać się z 4 cyfr" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Typ</label>
						<div class="cols-sm-10">
							<div class="input-group col-xs-5">
							 <input type="text" class="form-control"
									name="typ" id="typ"
									data-toggle="popover"
									data-content="Typ samochodu musi składać się z 2 do 50 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Silnik</label>
						<div class="cols-sm-10">
							<div class="input-group col-xs-5">
							 <input type="text" class="form-control"
									name="silnik" id="silnik"
									data-toggle="popover"
									data-content="Rodzaj silnika musi składać się z 2 do 50 znaków" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
					</div>

					<br>
					<div class="form-group-last">
						<button type="submit" id="btn_dod_sam"
							class="btn_rej btn-primary btn-sm col-sm-2  col-md-1 ">Zapisz</button>
						<button type="button" id="powrot"
							class="button23 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10">
							<a href="/ISI_2017_ASO/PanelKsiegowego/ksiegowy.jsp">Powrót</a>
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
						if (blad != null && blad.equals("Dodano samochód.")) {
					%>
					<div class="alert alert-success">
						<p style="text-align:center"><%=blad%></p>
					</div>
					<%
						}
					else if (blad != null && !blad.equals("")) { 
					%>
					<div class="alert alert-danger">
						<p style="text-align:center"><%=blad%></p>
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