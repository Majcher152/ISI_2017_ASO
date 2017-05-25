<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<script>

$(document).ready(function() {
	//wyswietlanie dymku z informacja
	$('#vin').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	
	//Walidacja vinu
	$('#vin').on('blur', function() {
		var input = $(this);
		var pattern = /^[a-z0-9]{17}$/;
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
	var warning = false;
	
	$('#btn_dodaj_sam').click(function(event){
		var vin = $('#vin');
		
		if(!(vin.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"> Podaj poprawny VIN!</div>').insertBefore(".blad");
				warning = true;
			}
		}
	});
});
</script>