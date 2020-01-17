<%@page import="dao.BigliettoDAO"%>
<%@page import="entita.Biglietto"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Info Biglietti</title>
</head>
<body>
<%
Collection<Biglietto> biglietti;
BigliettoDAO bigliettodao= new BigliettoDAO();
biglietti=bigliettodao.doRetrieveAll();
for(Biglietto b:biglietti)
{
	
%>
info dei biglietti <%=b.getAcquistodata() %>

<%} %>
</body>
</html>