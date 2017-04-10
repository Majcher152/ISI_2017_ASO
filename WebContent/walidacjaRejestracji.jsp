<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<script>
$(document).ready(function() {
 
	//Walidacja imienia
	$('#imie').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćĘŹĆŻŁÓĄ-\s]{3,30}$/;
		var is_name = pattern.test(input.val());
		if(is_name){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
	
	//Walidacja nazwiska
	$('#nazwisko').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćĘŹĆŻŁÓĄ-]{3,30}$/;
		var is_name = pattern.test(input.val());
		if(is_name){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else {
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
		
	//Walidacja email
	$('#email').on('blur', function() {
		var input = $(this);
		var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});	
	
	//Walidacja numeru telefonu
	$('#numer_telefonu').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{9}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
	
	//Walidacja loginu
	$('#login').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-z0-9]{4,16}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
	
	//Walidacja hasla
	$('#haslo').on('blur', function() {
		var input = $(this);
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,18}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
	
	//Walidacja powtorzonego hasla
	$('#haslo2').on('blur', function() {
		var input = $(this);
		if(input.val() == $('#haslo').val()){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
		}
	});
});
</script>