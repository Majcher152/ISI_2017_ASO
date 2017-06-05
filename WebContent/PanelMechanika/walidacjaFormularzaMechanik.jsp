<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>


<script>

$(document).ready(function() {
	//wyswietlanie dymku z informacja
	$('#koszt').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#opis').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#dataodebrania').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	//Walidacja daty
	$('#dataodebrania').on('blur', function() {
		var input = $(this);
		var pattern = /(^(((0[1-9]|1[0-9]|2[0-8])[\/](0[1-9]|1[012]))|((29|30|31)[\/](0[13578]|1[02]))|((29|30)[\/](0[4,6,9]|11)))[\/](19|[2-9][0-9])\d\d$)|(^29[\/]02[\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)$/;
		var is_data = pattern.test(input.val());
		if(is_data){
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
	
	//Walidacja daty
	$('#koszt').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,7}(\\.[0-9]{1,2})?$/;
		var is_data = pattern.test(input.val());
		if(is_data){
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
	
	//Walidacja daty
	$('#opis').on('blur', function() {
		var input = $(this);
		var pattern = /^[^<>%\$]$/;
		var is_data = pattern.test(input.val());
		if(is_data){
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
	
	$('#btn_zakoncz').click(function(event){
		var data = $('#dataodebrania');
		var koszt = $('#koszt');
		var opis = $('#opis');
		
		if(!(data.hasClass('valid') && koszt.hasClass('valid') && opis.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				
				$('<div class="alert alert-danger"> Wypełnij poprawnie wszystkie pola!</div>').insertBefore(".blad");
				warning = true;
			}
		}
	});
});
</script>