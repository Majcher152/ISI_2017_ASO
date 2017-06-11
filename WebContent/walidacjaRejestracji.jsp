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
	
	$('#rodzaj_konta').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#numer_budynku').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#godzina_otwarcia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#minuta_otwarcia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#godzina_zamkniecia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#minuta_zamkniecia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#ilosc_stanowisk').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	}); 
	
	$('#ulica').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#miasto').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#warsztat').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
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
	$('#rodzaj_konta').on('blur', function() {
		var input = $(this);
		if(input.val() == 'Mechanik' || input.val() == 'Ksiegowy' || input.val() == 'Administrator'){
			if(input.val() == 'Mechanik' )
				$('#warsztat').prop('disabled', false);
			else
				$('#warsztat').prop('disabled', true);
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
	
	//Walidacja numeru budynku
	$('#numer_budynku').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,4}$/;
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
	
	
	//Walidacja godziny otwarcia 
	$('#godzina_otwarcia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}$/;
		var is_name = pattern.test(input.val()) ;
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
	
	//Walidacja minuty otwarcia 
	$('#minuta_otwarcia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}$/;
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
	
	//Walidacja godzin zamkniecia
	$('#godzina_zamkniecia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}$/;
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
	
	//Walidacja minuty zamknięcia 
	$('#minuta_zamkniecia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}$/;
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
	
	//Walidacja nazwy ulicy
	$('#ulica').on('blur', function() {
		var input = $(this);
		var pattern =  /^[a-zA-Z0-9ąęółżźćśńĘŹĆŻŁÓĄŚŃ\s]{3,40}$/;
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
	
	//Walidacja ilości stanowisk
	$('#ilosc_stanowisk').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}$/;
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
	
	//Walidacja miasta
	$('#miasto').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-zA-Z0-9ąęółżźćśńĘŹĆŻŁÓĄŚŃ\s]{3,20}$/;
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
	
	//Walidacja warsztatu
	$('#warsztat').on('blur', function() {
		var input = $(this);
		//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
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
		var rodzaj_konta = $('#rodzaj_konta');
			
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid') && haslo.hasClass('valid') && haslo2.hasClass('valid')&& rodzaj_konta.hasClass('valid'))){
			event.preventDefault();
			console.log("hej");
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".main-login");
				warning = true;
			}
		}
});
	$('#btn_rej_uzytkownik').click(function(event){
		var imie = $('#imie');
		var nazwisko = $('#nazwisko');
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var login = $('#login');
		var haslo = $('#haslo');
		var haslo2 = $('#haslo2');
			
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid') && haslo.hasClass('valid') && haslo2.hasClass('valid'))){
			event.preventDefault();
			console.log("hej");
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".main-login");
				warning = true;
			}
		}
});
	
	$('#btn_rej_war').click(function(event){
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var ulica = $('#ulica');
		var ilosc_stanowisk = $('#ilosc_stanowisk');
		var minuta_zamkniecia = $('#minuta_zamkniecia');
		var godzina_zamkniecia = $('#godzina_zamkniecia');
		var minuta_otwarcia = $('#minuta_otwarcia');
		var godzina_otwarcia = $('#godzina_otwarcia');
		var numer_budynku = $('#numer_budynku')
		var miasto = $('#miasto')
		
		if(!(email.hasClass('valid') && numer_telefonu.hasClass('valid') && ulica.hasClass('valid') && ilosc_stanowisk.hasClass('valid') && minuta_zamkniecia.hasClass('valid') && godzina_zamkniecia.hasClass('valid') && minuta_otwarcia.hasClass('valid') && godzina_otwarcia.hasClass('valid') && numer_budynku.hasClass('valid') && miasto.hasClass('valid'))){		
			event.preventDefault();
			console.log("hej");
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".main-login");
				warning = true;
			}
		}
});
	
});
</script>