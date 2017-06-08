<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:include page="headerKlient.jsp" />
<sql:query dataSource="jdbc/aso" var="result">
SELECT tresc FROM `informacje` where typ_informacji='o_nas';
</sql:query>
	<div class="container marketing">
		<div class="row main"></div>
		<h2>O nas.</h2>
		<h3 align = "justify">
		<c:forEach var="o_nas" items="${result.rows}">
			<c:out value="${o_nas.tresc}" />
		</c:forEach></h3>
		<hr class="featurette-divider">

<jsp:include page="footerKlient.jsp" />	
