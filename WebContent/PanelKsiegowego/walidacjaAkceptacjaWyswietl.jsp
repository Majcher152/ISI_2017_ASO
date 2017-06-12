<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>

<script>

$(document).ready(function() {
	//wyswietlanie dymku z informacja
	$('#dataoddania').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$('#przewid_czas_trwania').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	$(document).ready(function() {
		$('#dataoddania').addClass("valid");
		$('#dataoddania').next().removeClass("glyphicon-remove").addClass("glyphicon-ok")
		$('#dataoddania').parent().removeClass("has-error").addClass("has-success");
		
	});

	//Walidacja daty
	$('#dataoddania').on('blur', function() {
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
	
	//czasu trwania
	$('#przewid_czas_trwania').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,3}$/;
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
	
	var warning = false;
	
	$('#btn_rej').click(function(event){
		var dataoddania = $('#dataoddania');
		var przewid_czas_trwania = $('#przewid_czas_trwania');
		
		if(!(dataoddania.hasClass('valid') && przewid_czas_trwania.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				$('<div class="alert alert-danger"><p style="text-align:center"> Wypełnij poprawnie wszystkie pola!</div></p>').insertAfter(".blad");
				warning = true;
			}
		}
		
		
	});
});
</script>