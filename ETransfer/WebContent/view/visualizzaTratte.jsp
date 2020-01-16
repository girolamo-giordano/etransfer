<%@page import="java.util.Collection"%>
<%@page import="dao.TrattaDAO"%>
<%@page import="entita.Tratta"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tratte</title>
</head>
<body>
<%
	Collection<Tratta> tratte;
	TrattaDAO trattadao= new TrattaDAO();
	tratte=trattadao.doRetrieveAll();
	for(Tratta t:tratte)
	{
	
%>
	Campo1:<%=t.getArrivo() %>
	campo2:<%=t.getPartenza() %>
<%} %>
</body>
</html>