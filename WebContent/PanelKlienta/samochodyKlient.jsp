<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="headerKlient.jsp" />
<jsp:include page="walidacjaDodawaniaSamochodow.jsp" />

<script type="text/javascript">
			$( document ).ready(function() {
				$.ajax({
                    type: "POST",
                    url: "Samochody2Servlet?method=methodA",
                    data: {model: $model.val() },
                    success: function(ret){
                        $("#rocznik").html(ret); 
                        $.ajax({
                            type: "POST",
                            url: "Samochody2Servlet?method=methodB",
                            data: {model: $model.val(), rocznik: $rocznik.val() },
                            success: function(ret){
                                $("#typ").html(ret);   
                                $.ajax({
                                    type: "POST",
                                    url: "Samochody2Servlet?method=methodC",
                                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
                                    success: function(ret){
                                        $("#silnik").html(ret);   
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
    
});</script>
<div class="container marketing">

	
	<div class="container marketing">
		<div class="row main">

			<div class="panel-heading">
				<div class="panel-title text-center">
					<h2 class="title" >Dodaj swój samochód:</h2>
				</div>
			</div>

			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="Samochody2Servlet?method=dodaj">
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Model</label>
						
					<select name="model" id="model" class="form-control">
					    <c:forEach items="${modele}" var="model">
					        <option value="${model}"><c:out value="${model}" /></option>
					    </c:forEach>
					</select>
				
					</div>
					
					
					
					<script type="text/javascript">
					        $model = $('#model');
					        $rocznik = $('#rocznik');
					        $typ = $('#typ');
					        
					        $(model).on('change',  function() {
					                $.ajax({
					                    type: "POST",
					                    url: "Samochody2Servlet?method=methodA",
					                    data: {model: $model.val() },
					                    success: function(ret){
					                        $("#rocznik").html(ret); 
					                        $.ajax({
					                            type: "POST",
					                            url: "Samochody2Servlet?method=methodB",
					                            data: {model: $model.val(), rocznik: $rocznik.val() },
					                            success: function(ret){
					                                $("#typ").html(ret);   
					                                $.ajax({
					                                    type: "POST",
					                                    url: "Samochody2Servlet?method=methodC",
					                                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                                    success: function(ret){
					                                        $("#silnik").html(ret);   
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
						<label for="name" class="cols-sm-2 control-label">Rocznik</label>
						<select name="rocznik" id="rocznik" class="form-control">
						</select>
					</div>
					<script type="text/javascript">
					        $rocznik = $('#rocznik');
					        $typ = $('#typ');
					        
					        $(rocznik).on('change', function() {
					                $.ajax({
					                    type: "POST",
					                    url: "Samochody2Servlet?method=methodB",
					                    data: {model: $model.val(), rocznik: $rocznik.val() },
					                    success: function(ret){
					                        $("#typ").html(ret);  
					                        $.ajax({
					                            type: "POST",
					                            url: "Samochody2Servlet?method=methodC",
					                            data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                            success: function(ret){
					                                $("#silnik").html(ret);   
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
					                       // alert( ret);
					                        console.log(blad); /*Funkcja wyświetlająca informacje 
					                        o ewentualnym błędzie w konsoli przeglądarki*/
					                    }
					                });
					               
					               
					            }
					        );
					    </script>
					    
					    <div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Typ</label>
					<select name="typ" id="typ" class="form-control">
					</select>
					</div>
					<script type="text/javascript">
					        $typ = $('#typ');
					        
					        $(typ).on('change', function() {
					                $.ajax({
					                    type: "POST",
					                    url: "Samochody2Servlet?method=methodC",
					                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                    success: function(ret){
					                        $("#silnik").html(ret);   
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
						<label for="name" class="cols-sm-2 control-label">Silnik</label>
					   
						<select name="silnik" id="silnik" class="form-control">
						</select>
						</div>
	
					<div class="form-group ">
						<label for="name" class="cols-sm-2 control-label">VIN</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-car"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="vin" id="vin" placeholder="Wpisz nr VIN samochodu." 
									data-toggle="popover" data-content="VIN musi składać się z 17 znaków alfanumerycznych."/>
									<span class="glyphicon form-control-feedback"></span>
							</div>
							
						</div>
					</div>

					<div class="form-group ">
						<button type="submit" id="btn_dodaj_sam"
							class="btn btn-primary btn-lg btn-block login-button">Dodaj samochód</button>
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