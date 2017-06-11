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
	
	$('#godzina_otwarcia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	
	$('#godzina_zamkniecia').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#ilosc_stanowisk').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#adres').popover({
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
		
		$('#login').addClass("valid");
		$('#login').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#login').parent().removeClass("has-error").addClass("has-success");
		
		$('#haslo').addClass("valid");
		$('#haslo').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#haslo').parent().removeClass("has-error").addClass("has-success");
		
		$('#haslo2').addClass("valid");
		$('#haslo2').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#haslo2').parent().removeClass("has-error").addClass("has-success");
		
		$('#rodzaj_konta').addClass("valid");
		// $('#rodzaj_konta').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#rodzaj_konta').parent().removeClass("has-error").addClass("has-success");
		
		$('#godzina_otwarcia').addClass("valid");
		$('#godzina_otwarcia').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#godzina_otwarcia').parent().removeClass("has-error").addClass("has-success");
		
		$('#godzina_zamkniecia').addClass("valid");
		$('#godzina_zamkniecia').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#godzina_zamkniecia').parent().removeClass("has-error").addClass("has-success");
		
		$('#ilosc_stanowisk').addClass("valid");
		$('#ilosc_stanowisk').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#ilosc_stanowisk').parent().removeClass("has-error").addClass("has-success");
		
		$('#adres').addClass("valid");
		$('#adres').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#adres').parent().removeClass("has-error").addClass("has-success");
		
		$('#miasto').addClass("valid");
		$('#miasto').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#miasto').parent().removeClass("has-error").addClass("has-success");
		
		$('#warsztat').addClass("valid");
	//	$('#warsztat').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#warsztat').parent().removeClass("has-error").addClass("has-success");
	
			if($('#rodzaj_konta').val() == 'Mechanik' )
				$('#warsztat').prop('disabled', false);
			else
				$('#warsztat').prop('disabled', true);
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
	

	//Walidacja godzin otwarcia
	$('#godzina_otwarcia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}\u003A[0-9]{1,2}$/;
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

	//Walidacja godzin zamkniecia
	$('#godzina_zamkniecia').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,2}\u003A[0-9]{1,2}$/;
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

	//Walidacja ilości stanowisk
	$('#ilosc_stanowisk').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,3}$/;
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
	

	//Walidacja miasta
	$('#miasto').on('blur', function() {
		var input = $(this);
		var pattern =  /^[a-zA-ZąęółżźćśńĘŹĆŻŁÓĄŚŃ\s]{3,15}$/;
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
	
	//Walidacja adresu
	$('#adres').on('blur', function() {
		var input = $(this);
		var pattern =  /^[a-zA-Z0-9ąęółżźćśńĘŹĆŻŁÓĄŚŃ\s]{3,40}$/;
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
	
	//Walidacja warsztatu
	$('#warsztat').on('blur', function() {
		var input = $(this);
		//	input.next().removeClass("glyphicon-remove").addClass("glyphicon-ok");
			input.parent().removeClass("has-error").addClass("has-success");
			input.removeClass("invalid").addClass("valid");
	});
	

	var warning = false;
	
	$('#btn_edytuj_dane').click(function(event){
		var imie = $('#imie');
		var nazwisko = $('#nazwisko');
		var email = $('#email');
		var numer_telefonu = $('#numer_telefonu');
		var login = $('#login');
		
		if(!(imie.hasClass('valid') && nazwisko.hasClass('valid') && email.hasClass('valid') && numer_telefonu.hasClass('valid') && login.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".main-login");
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
	
	$('#btn_edytuj_warsztat').click(function(event){
		var adres = $('#adres');
		var numer_telefonu = $('#numer_telefonu');
		var email = $('#email');
		var godzina_zamkniecia = $('#godzina_zamkniecia');
		var godzina_otwarcia = $('#godzina_otwarcia');
		var ilosc_stanowisk = $('#ilosc_stanowisk');
		var miasto = $('#miasto');
		
		if(!(miasto.hasClass('valid') && adres.hasClass('valid') && numer_telefonu.hasClass('valid') && email.hasClass('valid') && ilosc_stanowisk.hasClass('valid') && godzina_zamkniecia.hasClass('valid') && godzina_otwarcia.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".main-login");
				warning = true;
			}
		}
	});
});
</script>
