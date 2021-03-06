<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<style>
.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: #f0f0f0;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #46b8da;
}
</style>




<jsp:include page="headerKsiegowy.jsp" />


<div class="container marketing">


	<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main">
		
		<h1 class="page-header">Stan Warsztatu</h1>
		<%
		String blad = (String) request.getAttribute("blad");
	%>
	<%
		if (blad != null && ((blad.equals("Zaktualizowano.")))) {
	%>
	<div class="alert alert-success">
		<p style="text-align: center"><%=blad%></p>
	</div>
	<%
		} else if (blad != null && !blad.equals("")) {
	%>
	<div class="alert alert-danger">
		<p style="text-align: center"><%=blad%></p>
	</div>
	<%
		}
	%>
		<div
			class="form-group-last col-sm-6 col-sm-offset-4 col-md-8 col-md-offset-2">
			
		</div>
		<div class="blad"></div>
		<script type="text/javascript">
			$( document ).ready(function() {
				 $model = $('#model');
			        $rocznik = $('#rocznik');
			        $typ = $('#typ');
			        $silnik=$('#silnik');
			        $id_warsztat=$('#warsztat');
				$.ajax({
                    type: "POST",
                    url: "KsiegowyWarsztatServlet?metoda=zaladujRoczniki",
                    data: {model: $model.val() },
                    success: function(ret){
                        $("#rocznik").html(ret); 
                        $.ajax({
                            type: "POST",
                            url: "KsiegowyWarsztatServlet?metoda=zaladujTypy",
                            data: {model: $model.val(), rocznik: $rocznik.val() },
                            success: function(ret){
                                $("#typ").html(ret);   
                                $.ajax({
                                    type: "POST",
                                    url: "KsiegowyWarsztatServlet?metoda=zaladujSilniki",
                                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
                                    success: function(ret){
                                    	
                                        $("#silnik").html(ret); 
                                        $.ajax({
						                    type: "POST",
						                    url: "KsiegowyWarsztatServlet?metoda=zaladujCzesci",
						                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val(),silnik: $silnik.val(),id_warsztat:$id_warsztat.val() },
						                    success: function(ret){
						                    	
						                        $("#czesc").html(ret);   
						                    },
						                    /*Działania wykonywane w przypadku błędu*/
						                    error: function(blad) {
						                        alert( ret);
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
		<div class="row main">

			<div class="panel panel-default">
					<b>Warsztat</b>
					    <select name="warsztat" id="warsztat" class="form-control">
					    <c:forEach items="${warsztaty}" var="warsztat">
					        <option value="${warsztat.id}"><c:out value="${warsztat.adres} , ${warsztat.miasto}" /></option>
					    </c:forEach>
					</select>
				<b>Model</b>
				
				<select name="model" id="model" class="form-control">
					    <c:forEach items="${modele}" var="model">
					        <option value="${model}"><c:out value="${model}" /></option>
					    </c:forEach>
					</select>
					
					
					<script type="text/javascript">
					        $model = $('#model');
					        $rocznik = $('#rocznik');
					        $typ = $('#typ');
					        $silnik=$('#silnik');
					        
					        $(model).on('change',  function() {
					                $.ajax({
					                    type: "POST",
					                    url: "KsiegowyWarsztatServlet?metoda=zaladujRoczniki",
					                    data: {model: $model.val() },
					                    success: function(ret){
					                        $("#rocznik").html(ret); 
					                        $.ajax({
					                            type: "POST",
					                            url: "KsiegowyWarsztatServlet?metoda=zaladujTypy",
					                            data: {model: $model.val(), rocznik: $rocznik.val() },
					                            success: function(ret){
					                                $("#typ").html(ret);   
					                                $.ajax({
					                                    type: "POST",
					                                    url: "KsiegowyWarsztatServlet?metoda=zaladujSilniki",
					                                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                                    success: function(ret){
					                                        $("#silnik").html(ret); 
					                                        $.ajax({
											                    type: "POST",
											                    url: "KsiegowyWarsztatServlet?metoda=zaladujCzesci",
											                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val(),silnik: $silnik.val() ,id_warsztat:$id_warsztat.val()},
											                    success: function(ret){
											                        $("#czesc").html(ret);   
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
				<b>Rocznik</b>
				<select name="rocznik" id="rocznik" class="form-control">
						</select>
					<script type="text/javascript">
					        $rocznik = $('#rocznik');
					        $typ = $('#typ');
					        
					        $(rocznik).on('change', function() {
					                $.ajax({
					                    type: "POST",
					                    url: "KsiegowyWarsztatServlet?metoda=zaladujTypy",
					                    data: {model: $model.val(), rocznik: $rocznik.val() },
					                    success: function(ret){
					                        $("#typ").html(ret);  
					                        $.ajax({
					                            type: "POST",
					                            url: "KsiegowyWarsztatServlet?metoda=zaladujSilniki",
					                            data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                            success: function(ret){
					                                $("#silnik").html(ret); 
					                                $.ajax({
									                    type: "POST",
									                    url: "KsiegowyWarsztatServlet?metoda=zaladujCzesci",
									                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val(),silnik: $silnik.val(),id_warsztat:$id_warsztat.val() },
									                    success: function(ret){
									                        $("#czesc").html(ret);   
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
					                       // alert( ret);
					                        console.log(blad); /*Funkcja wyświetlająca informacje 
					                        o ewentualnym błędzie w konsoli przeglądarki*/
					                    }
					                });
					               
					               
					            }
					        );
					    </script>
					    <b>Typ</b>
					    <select name="typ" id="typ" class="form-control">
					</select>
					<script type="text/javascript">
					        $typ = $('#typ');
					        
					        $(typ).on('change', function() {
					                $.ajax({
					                    type: "POST",
					                    url: "KsiegowyWarsztatServlet?metoda=zaladujSilniki",
					                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val() },
					                    success: function(ret){
					                        $("#silnik").html(ret);  
					                        $.ajax({
							                    type: "POST",
							                    url: "KsiegowyWarsztatServlet?metoda=zaladujCzesci",
							                    data: {model: $model.val(), rocznik: $rocznik.val(), typ: $typ.val(),silnik: $silnik.val(),id_warsztat:$id_warsztat.val() },
							                    success: function(ret){
							                    	
							                        $("#czesc").html(ret);   
							                    },
							                    /*Działania wykonywane w przypadku błędu*/
							                    error: function(blad) {
							                        alert( ret);
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
						<b>Silnik</b>
						<select name="silnik" id="silnik" class="form-control">
						</select>
						</div>
				<!-- Table -->
				
				<table class="table table-hover table-striped table-condensed"  id="czesc">
				</table>
				
			
			</div>
			
		</div>
		
	</div>
</div>

</div>

<hr class="featurette-divider">

  
<jsp:include page="footerKsiegowy.jsp" />
