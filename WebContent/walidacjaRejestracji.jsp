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
	
	$('#login').popover({
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
	
	$('#rodzaj').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	//Walidacja imienia
	$('#imie').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-ZąęółżźćĘŹĆŻŁÓĄ-\s]{3,30}$/;
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
		var pattern = /^[a-zA-ZąęółżźćĘŹĆŻŁÓĄ-]{3,30}$/;
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
	
	//Walidacja loginu
	$('#login').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-z0-9]{4,16}$/;
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
	
	//Walidacja hasla
	$('#haslo').on('blur', function() {
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
	
	//Walidacja powtorzonego hasla
	$('#haslo2').on('blur', function() {
		var input = $(this);
		if(input.val() == $('#haslo').val() && $('#haslo').hasClass('valid')){
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
	
	$('#btn_loguj').click(function(event){
		var imie = $('#imie');
		var nazwisko = $('#nazwisko');
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var login = $('#login');
		var haslo = $('#haslo');
		var haslo2 = $('#haslo2');
		
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid') && haslo.hasClass('valid') && haslo2.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".login-register");
				warning = true;
			}
		}
});
	//-------------------ADMIN------------------ 
	//Walidacja rodzaju konta
	$('#rodzaj').on('blur', function() {
		var input = $(this);
		if(input.val() == 'Mechanik' || input.val() == 'Księgowy' || input.val() == 'Administrator'){
		//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
		}
		else{
		//	input.next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
			input.parent().removeClass("has-success").addClass("has-error");
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	var done = false;
	
	$('#btn_rej').click(function(event){
		var imie = $('#imie');
		var nazwisko = $('#nazwisko');
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var login = $('#login');
		var haslo = $('#haslo');
		var haslo2 = $('#haslo2');
		var rodzaj = $('#rodzaj');
			
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid') && haslo.hasClass('valid') && haslo2.hasClass('valid')&& rodzaj.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".form-group-last");
				warning = true;
			}
		}
		
		if(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid') && haslo.hasClass('valid') && haslo2.hasClass('valid')&& rodzaj.hasClass('valid')){
			event.preventDefault();
			if (done == false) {
				$('<div class="alert alert-success"> Zarejestrowano pomyślnie!</div>').insertBefore(".form-group1");
				done = true;
			}
		}
});
	
});
</script>