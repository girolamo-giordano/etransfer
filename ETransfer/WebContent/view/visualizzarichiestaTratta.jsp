<%@page import="dao.RichiestatrattaDAO"%>
<%@page import="entita.Richiestatratta"%>
<%@page import="dao.RichiestafermataDAO"%>
<%@page import="entita.Richiestafermata"%>
<%@page import="dao.RichiestaCorsaDAO"%>
<%@page import="entita.Richiestacorsa"%>
<%@page import="dao.CorsaDAO"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Richieste Tratte</title>
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
		<li> <a href="areaPers.jsp">Area Admin</a> </li>
		<li> <a href="eliminaFermata.jsp">Elimina Fermata</a> </li>
		
		<li class="dropdown"><a href="#">Visualizza</a>
		
 			 <div class="dropdown-content">
   				 <a href="corsa.jsp"> Le nostre Corse </a>
    			<a href="visualizzaAutisti.jsp"> I nostri autisti </a>
  				<a href="visualizzaAutobus.jsp">I nostri bus </a>
  				<a href="visualizzaBiglietti.jsp">Biglietti venduti </a>
    		</div>
		</li>
		
		<li class="dropdown1"><a href="#">Aggiungi</a>
		
 			 <div class="dropdown1-content">
   				<a href="aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="aggiungiTratta.jsp"> Aggiungi Tratta </a>
    		</div>
		</li>
		
		<li class="dropdown2"><a href="#">Visualizza Richieste</a>
		
 			 <div class="dropdown2-content">
   				 <a href="visualizzarichiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="visualizzarichiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="visualizzarichiestaTratta.jsp"> Richiesta Tratta </a>
  	
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
  	
  	
<h2><center>Visualizza Richieste Tratte</center></h2>
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
		Azioni
		</th>
		
	</tr>
<%
	Collection<Richiestatratta> rc;
	RichiestatrattaDAO rcdao= new RichiestatrattaDAO();
	rc=rcdao.doRetrieveAll();
	
	for(Richiestatratta t:rc)
	
	{
	
%>


	
	<tr>
		<td><%=t.getPartenza()%></td>
		<td><%=t.getArrivo()%></td>
		<td><a href="../ConfermaRichiestaTratta?idrichtratta=<%=t.getId() %>">Aggiungi richiesta a tratte</a>
		||   <a href="../EliminaRichiestaTratta?idrichtratta=<%=t.getId() %>"> Elimina richiesta</a>
		</td>
		
		
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