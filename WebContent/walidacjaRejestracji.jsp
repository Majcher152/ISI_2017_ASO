<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>

<script>
$(document).ready(function() {
	 
	//Walidacja nazwy
	$('#imie').on('blur', function() {
		var input = $(this);
		var name_length = input.val().length;
		if(name_length >= 5 && name_length <= 15){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("Wprowadzono poprawną nazwę.").removeClass("blad").addClass("ok");
		}
		else{
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Nazwa musi mieć więcej niż 4 i mniej niż 16 znaków!").removeClass("ok").addClass("blad");
			
		}
	});
		
	//Walidacja email
	$('#email').on('blur', function() {
		var input = $(this);
		var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("Wprowadzono poprawny email.").removeClass("blad").addClass("ok");
		}
		else{
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Wprowadź poprawny email!").removeClass("ok").addClass("blad");
		}
	});	
	
	//Walidacja wiadomości
	$('#message').on('blur', function() {
		var input = $(this);
		var message = $(this).val();
		if(message){
			input.removeClass("invalid").addClass("valid");
			input.next('.komunikat').text("Wprowadzono poprawną wiadomość.").removeClass("blad").addClass("ok");
		}
		else{
			input.removeClass("valid").addClass("invalid");
			input.next('.komunikat').text("Wiadomość nie może być pusta!").removeClass("ok").addClass("blad");
		}   
	});
	
	//Po próbie wysłania formularza
		$('#submit button').click(function(event){
			var name = $('#name');
			var email = $('#email');
			var message = $('#message');
			
			if(name.hasClass('valid') && email.hasClass('valid') && message.hasClass('valid')){
				alert("Pomyślnie wysłano formularz.");	
			}
			else {
				event.preventDefault();
				alert("Uzupełnij wszystkie pola!");	
			}
		});
});
</script>