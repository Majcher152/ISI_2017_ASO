<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<script>

$(document).ready(function() {
	//wyswietlanie dymku z informacja
	$('#imie').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#nazwisko').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#email').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#numer_telefonu').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#haslo').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#haslo2').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#rodzaj_konta').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$(document).ready(function() {
		$('#imie').addClass("valid");
		$('#imie').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#imie').parent().removeClass("has-error").addClass("has-success");
		
		$('#nazwisko').addClass("valid");
		$('#nazwisko').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#nazwisko').parent().removeClass("has-error").addClass("has-success");
		
		$('#email').addClass("valid");
		$('#email').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#email').parent().removeClass("has-error").addClass("has-success");
		
		$('#numer_telefonu').addClass("valid");
		$('#numer_telefonu').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#numer_telefonu').parent().removeClass("has-error").addClass("has-success");
	});
	
	//Walidacja imienia
	$('#imie').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćśńĘŹĆŻŁÓĄŚŃ-\s]{3,30}$/;
		var is_name = pattern.test(input.val());
		if(is_name){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//Walidacja nazwiska
	$('#nazwisko').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćśńĘŹĆŻŁÓĄŚŃ-]{3,30}$/;
		var is_name = pattern.test(input.val());
		if(is_name){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else {
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
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
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
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
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//Walidacja stareg hasla
	$('#stareHaslo').on('blur', function() {
		var input = $(this);
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,18}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//Walidacja nowego hasla
	$('#noweHaslo').on('blur', function() {
		var input = $(this);
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,18}$/;
		var is_email = pattern.test(input.val());
		if(is_email){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//Walidacja powtorzonego nowego hasla
	$('#noweHaslo2').on('blur', function() {
		var input = $(this);
		if(input.val() == $('#noweHaslo').val() && $('#noweHaslo').hasClass('valid')){
			input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else{
			input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	

	var warning = false;
	
	$('#btn_edytuj_dane').click(function(event){
		var imie = $('#imie');
		var nazwisko = $('#nazwisko');
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var login = $('#login');
		
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') )){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".login-register");
				warning = true;
			}
		}
		
		
	});
	$('#btn_edytuj_haslo').click(function(event){
		var stareHaslo = $('#stareHaslo');
		var noweHaslo = $('#noweHaslo');
		var noweHaslo2 = $('#noweHaslo2');
		
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".login-register");
				warning = true;
			}
		}
	});
});
</script>