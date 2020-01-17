<%@page import="utenti.Cliente"%>
<%@page import="entita.Corsa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout biglietto</title>
</head>
<body>
<%
int numbiglietti= (int)request.getAttribute("numbiglietti");
int idcorsa=(int)request.getAttribute("idcorsa");
Corsa corsa= (Corsa)request.getAttribute("corsain");
System.out.println("checkjspclient: "+corsa);
Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");
System.out.println("clientejsp: "+cliente);
System.out.println("clientejspid: "+cliente.getId());
%>
Totale da pagare=<%=corsa.getCosto()*numbiglietti %>
<form method="post" action="AcquistoBiglietto">
<input type="text" required="required">
<input type="hidden" value="<%=numbiglietti %>" name="numbiglietti">
<input type="hidden" value="<%=idcorsa %>" name="idcorsa">
<input type="hidden" value="<%=cliente.getId() %>" name="idcliente">
<input type="submit" value="Completa acquisto">

</form>
</body>
</html>