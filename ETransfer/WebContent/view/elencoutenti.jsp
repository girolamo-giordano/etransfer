<%@page import="utenti.Autista"%>
<%@page import="utenti.Cliente"%>
<%@page import="java.util.Collection"%>
<%@page import="dao.AutistaDAO"%>
<%@page import="dao.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utenti</title>
<%
ClienteDAO clientedao=new ClienteDAO();
AutistaDAO autistadao=new AutistaDAO();
Collection<Cliente> clienti= clientedao.doRetrieveAll();
Collection<Autista> autisti= autistadao.doRetrieveAll();
%>
</head>
<body>
Clienti
<%
for(Cliente c:clienti)
{
	
%>
	cliente: <a href="../InfoUtente?idtipo=0&idutente=<%=c.getId()%>"><%=c.getNome() %>   <%=c.getCognome() %></a>
<%}
%>
Autisti
<%for(Autista a:autisti){ %>
autista: <a href="../InfoUtente?idtipo=1&idutente=<%=a.getId()%>"><%=a.getNome() %>  <%=a.getCognome() %></a>
<%} %>
</body>
</html>