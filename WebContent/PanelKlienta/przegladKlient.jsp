<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="headerKlient.jsp" />

<div class="container marketing">

	
	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Zarezerwuj termin przeglądu:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="PrzegladServlet?metoda=zarezerwuj">
					
					
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
					
					
					
					<script type="text/javascript">
					        $adres = $('#adres');
					        $dzien = $('#dzien');
					        $godzina = $('#godzina');
					        
					        $(adres).on('change',  function() {
					                $.ajax({
					                    type: "POST",
					                    url: "PrzegladServlet?metoda=zmianaWarsztatu",
					                    data: {adres: $adres.val() },
					                    success: function(ret){
					                        $("#data").html(ret); 
					                        $.ajax({
					                            type: "POST",
					                            url: "PrzegladServlet?metoda=zmianaDnia",
					                            data: {adres: $adres.val(), dzien: $dzien.val() },
					                            success: function(ret){
					                                $("#godzina").html(ret);   
					                            },
					                            /*Działania wykonywane w przypadku błędu*/
					                            error: function(blad) {
					                               // alert( ret);
					                                console.log(blad); /*Funkcja wyświetlająca informacje 
					                                o ewentualnym błędzie w konsoli przeglądarki*/
					                            }
					                        });
					                    },
					                    /*Działania wykonywane w przypadku błędu*/
					                    error: function(blad) {
					                       // alert( "Wystąpił błąd");
					                        console.log(blad); /*Funkcja wyświetlająca informacje 
					                        o ewentualnym błędzie w konsoli przeglądarki*/
					                    }
					                });
					                
					              
					            }
					        );
					    </script>
					    
					   <div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Dzień</label>
						<select name="dzien" id="dzien" class="form-control">
						</select>
					</div>
					<script type="text/javascript">
					        $dzien = $('#dzien');
					        $godzina = $('#godzina');
					        
					        $(dzien).on('change', function() {
					                $.ajax({
					                    type: "POST",
					                    url: "PrzegladServlet?metoda=zmianaDnia",
					                    data: {adres: $adres.val(), dzien: $dzien.val() },
					                    success: function(ret){
					                        $("#godzina").html(ret);  
					                    },
					                    /*Działania wykonywane w przypadku błędu*/
					                    error: function(blad) {
					                       // alert( ret);
					                        console.log(blad); /*Funkcja wyświetlająca informacje 
					                        o ewentualnym błędzie w konsoli przeglądarki*/
					                    }
					                });
					               
					               
					            }
					        );
					    </script>
					    
					    <div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Godzina</label>
					<select name="godzina" id="godzina" class="form-control">
					</select>
					</div>
			
					<div class="form-group ">
						<button type="submit" id="btn_zarezerwuj_termin"
							class="btn btn-primary btn-lg btn-block login-button">Zarezerwuj termin</button>
					</div>
					
						<%String blad =(String) request.getAttribute("blad"); %>
						<%if(blad!=null && !blad.equals("")){ %>
						<div class="alert alert-danger"> <%=blad %> 
						</div>
						<%} %>
					
					<div class="blad"></div>
				</form>
			</div>
		</div>
	
	
	
	<hr class="featurette-divider">




<jsp:include page="footerKlient.jsp" />