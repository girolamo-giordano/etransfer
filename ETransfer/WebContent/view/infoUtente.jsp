<%@page import="utenti.Cliente"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utente</title>
</head>
<body>
<%
Cliente cliente=(Cliente) request.getAttribute("cliente");
Autista autista= (Autista)request.getAttribute("autista");
if(cliente != null)
{
%>
	cliente <%=cliente.toString() %>
<%}
if(autista!= null){
%>
autista <%=autista.toString() %>
<%} %>
</body>
</html>