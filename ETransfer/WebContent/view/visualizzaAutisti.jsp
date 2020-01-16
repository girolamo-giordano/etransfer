<%@page import="dao.AutistaDAO"%>
<%@page import="utenti.Autista"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autisti</title>
</head>
<body>
<%
	Collection<Autista> autobus;
	AutistaDAO trattadao= new AutistaDAO();
	autobus=trattadao.doRetrieveAll();
	for(Autista t:autobus)
	{
	
%>
	Campo1:<%=t.getCognome() %>
	campo2:<%=t.getNome()%>
	Campo3:<%=t.getPassword() %>
	campo4:<%=t.getUsername() %>
<%} %>
</body>
</html>