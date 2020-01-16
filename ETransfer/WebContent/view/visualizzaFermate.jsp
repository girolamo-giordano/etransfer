<%@page import="dao.FermataDAO"%>
<%@page import="entita.Fermata"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fermate</title>
</head>
<body>
<%
	Collection<Fermata> tratte;
	FermataDAO trattadao= new FermataDAO();
	tratte=trattadao.doRetrieveAll();
	for(Fermata t:tratte)
	{
	
%>
	Campo1:<%=t.getNomefermata() %>
<%} %>

</body>
</html>