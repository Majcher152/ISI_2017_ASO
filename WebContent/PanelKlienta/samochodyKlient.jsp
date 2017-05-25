<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<p>Model</p>

<select name="model" id="model">
    <c:forEach items="${modele}" var="model">
        <option value="${model}"><c:out value="${model}" /></option>
    </c:forEach>
</select>



<script type="text/javascript">
        $model = $('#model');
        $rocznik = $('#rocznik');
        $typ = $('#typ');
        
        $(model).on('change',  function() {
                $.ajax({
                    type: "GET",
                    url: "Samochody2Servlet?method=methodA",
                    data: {model: $model.val() },
                    success: function(ret){
                        $("#rocznik").html(ret); 
                        $.ajax({
                            type: "GET",
                            url: "Samochody2Servlet?method=methodB",
                            data: {model: $model.val(), rocznik: $rocznik.val() },
                            success: function(ret){
                                $("#typ").html(ret);   
                                $.ajax({
                                    type: "GET",
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
    
   <p>Rocznik</p>
<select name="rocznik" id="rocznik">
</select>

<script type="text/javascript">
        $rocznik = $('#rocznik');
        $typ = $('#typ');
        
        $(rocznik).on('change', function() {
                $.ajax({
                    type: "GET",
                    url: "Samochody2Servlet?method=methodB",
                    data: {model: $model.val(), rocznik: $rocznik.val() },
                    success: function(ret){
                        $("#typ").html(ret);  
                        $.ajax({
                            type: "GET",
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
    
    <p>Typ</p>
<select name="typ" id="typ">
</select>

<script type="text/javascript">
        $typ = $('#typ');
        
        $(typ).on('change', function() {
                $.ajax({
                    type: "GET",
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
    
    <p>Silnik</p>
<select name="silnik" id="silnik">
</select>
</body>
</html>