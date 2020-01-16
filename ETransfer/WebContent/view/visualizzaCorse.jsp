<%@page import="dao.CorsaDAO"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corse</title>
</head>
<body>
<%
	Collection<Corsa> autobus;
	CorsaDAO trattadao= new CorsaDAO();
	autobus=trattadao.doRetrieveAll();
	System.out.println(autobus);
	for(Corsa t:autobus)
	{
	
%>
	Campo1:<%=t.getDatapart() %>
	campo2:<%=t.getDurata() %>
	Campo3:<%=t.getOrapart()%>
	campo4:<%=t.getBus() %>
	campo5:<%=t.getFermate()%>
	campo6:<%=t.getTratta() %>
<%} %>
</body>
</html>