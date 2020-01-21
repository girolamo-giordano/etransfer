<%@page import="java.util.ArrayList"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@page import="dao.CorsaDAO"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corse Autista</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="visualizzaCorse.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>
<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Utente</a> </li>
		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
		<li> <a href="visualizzaCorsaAutista.jsp">Visualizza Corse da effetturare</a> </li>
		
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	<h2><center>CORSE DA EFFETTUARE</center></h2>
<%
Autista autista= (Autista)request.getSession().getAttribute("autista");
CorsaDAO corsadao= new CorsaDAO();
Collection<Corsa> corse= corsadao.doRetrieveAll();
ArrayList<Corsa> corsefinali=new ArrayList<Corsa>();
if(autista != null)
{
	for(Corsa c:corse)
	{
		System.out.println(autista.getId());
		System.out.println(c.getBus().getAutista().getId());
		if(c.getBus().getAutista().getId()==autista.getId())
		{
			corsefinali.add(c);
		}
	}
	for(Corsa c:corsefinali)
	{
%>
</div>

<div id="firstP">

<table>
	<tr>
		<th>
		Partenza
		</th>
		<th>
		Arrivo
		</th>
		<th>
		Data
		</th>
		<th>
		Ora Partenza
		</th>
		<th>
		Durata
		</th>
		<th>
		Bus
		</th>
		
		
	</tr>


	
	<tr>
		<td><%=c.getTratta().getPartenza() %></td>
		<td><%=c.getTratta().getArrivo() %></td>
		<td><%=c.getDatapart() %></td>
		<td><%=c.getOrapart() %></td>
		<td><%=c.getDurata() %></td>
		<td><%=c.getBus().getModello() %></td>
		
	</tr>

	

</table>
</div>

<%}} %>
	

</body>
</html>