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
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="visualizzaCorse.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
  <a href="chisiamo.jsp">L'azienda</a>
  <a href="areautente.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="Login.jsp" style="float:right">Login</a>
  <a href="registrazione.jsp" style="float:right">Registrazione</a>
</div>
</div>

<div style="margin-top:80px;">


</div>
<h2><center>CORSE DISPONIBILI</center></h2>
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
		Prezzo
		</th>
		
	</tr>
<%
	Collection<Corsa> autobus;
	CorsaDAO trattadao= new CorsaDAO();
	autobus=trattadao.doRetrieveAll();
	System.out.println(autobus);
	for(Corsa t:autobus)
	
	{
	
%>


	
	<tr>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getTratta().getPartenza() %></a></td>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getTratta().getArrivo() %></a></td>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getDatapart() %></a></td>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getOrapart() %></a></td>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getDurata() %>'</a></td>
		<td><a class="co" href="../InfoCorsa?id_corsa=<%=t.getId()%>"><%=t.getCosto() %>&#8364</a></td>
	</tr>

	
<%} %>
</table>
</div>

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>