<%@page import="entita.Autobus"%>
<%@page import="java.util.Collection"%>
<%@page import="dao.AutobusDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autobus</title>
</head>
<body>
<%
	Collection<Autobus> autobus;
	AutobusDAO trattadao= new AutobusDAO();
	autobus=trattadao.doRetrieveAll();
	for(Autobus t:autobus)
	{
	
%>
	Campo1:<%=t.getAnnoimm() %>
	campo2:<%=t.getChilometri() %>
	Campo3:<%=t.getModello() %>
	campo4:<%=t.getNumeroposti() %>
	campo5:<%=t.getAutista()%>
<%} %>
</body>
</html>