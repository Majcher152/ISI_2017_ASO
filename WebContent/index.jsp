<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="pl-PL">
<head>
<title>ASO | Strona główna</title>
</head>
<body>
<form action="login" method="post">
	Login: <input type="text" name="login" /><br />
	Hasło: <input type="password" name="haslo" /><br />
	<input type="submit" value="Zaloguj"/>
</form>


<a href="rejestracja.jsp">Rejestracja</a>
</body>
</html>