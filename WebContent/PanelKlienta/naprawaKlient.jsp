<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="headerKlient.jsp" />
<jsp:include page="walidacjaRezerwacjiNaprawy.jsp" />


<div class="container marketing">


	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title">Zarezerwuj termin naprawy:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post"
					action="NaprawaServlet?metoda=zarezerwuj">


					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Samochód</label>
						<select name="samochod" id="samochod" class="form-control">
							<c:forEach items="${samochody}" var="samochod">
								<option value="${samochod.vin}"><c:out value="${samochod.vin}" /></option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Warsztat</label>

						<select name="adres" id="adres" class="form-control">
							<c:forEach items="${adresy}" var="adres">
								<option value="${adres}"><c:out value="${adres} " /></option>
							</c:forEach>
						</select>

					</div>

	
					<div class="form-group ">
						<label for="name" class="cols-sm-2 control-label">Preferowana data</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-calendar"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="data" id="data" placeholder="dd/mm/yyyy" 
									data-toggle="popover" data-content="Wymagany format daty: dd/mm/yyyy."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
							
						</div>
					</div>

					<div class="form-horizontal">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Opis usterki</label>
								<textarea  id="opis" name="opis" class="form-control" maxlength="200" rows="5" style="width:100%;overflow:auto;resize:none" data-toggle="popover" data-content="Makymalnie 200 znaków."  
									required></textarea>
							
						</div>
					</div>


					<div class="form-group ">
						<button type="submit" id="btn_zarezerwuj_termin"
							class="btn btn-primary btn-lg btn-block login-button">Zarezerwuj
							termin</button>
					</div>

					<%
						String blad = (String) request.getAttribute("blad");
					%>
					<%
						if (blad != null && blad.equals("Zarezerwowano termin.")) {
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
				</form>
			</div>
		</div>



		<hr class="featurette-divider">




		<jsp:include page="footerKlient.jsp" />