<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>


<script>

$(document).ready(function() {
	//wyswietlanie dymku z informacja
	$('.ile').popover({
		container: 'body',
		trigger : 'focus',
		placement : 'right'
	});
	
	
	
	
	//Walidacja liczby
	$('.ile').on('blur', function() {
		var input = $(this);
		var pattern = /^[0-9]{1,5}$/;
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
	
	$('#btn_zmniejsz').click(function(event){
		var ile = $('.ile');
		
		
		if(!(ile.hasClass('valid'))){
			event.preventDefault();
			if (warning == false) {
				
				$('<div class="alert alert-danger"> W polu ile musi być liczba!</div>').insertBefore(".blad");
				warning = true;
			}
		}
	});
});
</script>