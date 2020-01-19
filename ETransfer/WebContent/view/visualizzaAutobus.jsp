<%@page import="utenti.Manager"%>
<%@page import="utenti.Cliente"%>
<%@page import="utenti.Autista"%>
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
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="visualizzaCorse.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<%
	Autista autista= (Autista)request.getSession().getAttribute("autista");
	Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");
	Manager manager= (Manager)request.getSession().getAttribute("manager");
	
	if(cliente != null)
	{
%>
 		
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Utente</a> </li>
		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
		
		<li class="dropdown4"><a href="#">Personalizza Viaggio</a>
		
 			 <div class="dropdown4-content">
   				 <a href="richiestaCorsa.jsp"> Richiesta Corsa </a>
    				<a href="richiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="richiestaTratta.jsp"> Richiesta Tratta </a>
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	<%}
	
	
	else if(autista != null){%>
	
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Utente</a> </li>
		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
		
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	
	<%}else if(manager != null){ %>
	
	
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
  	
  

<%} else{ %>




	
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp">L'azienda</a> </li>
  		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
  		<li> <a href="visualizzaAutobus.jsp">I nostri autobus</a> </li>
		
		
		
		<div id="lright" style="float:right">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrazione</a></li>
		</div>
	</ul>
	</div>
	
	<%} %>
  

<div style="margin-top:80px;">


</div>
<h2><center>AUTOBUS DISPONIBILI</center></h2>
<div id="firstP">

<table>
	<tr>
		<th>
		modello</th>
		<th>
		numeroposti
		</th>
		<th>
		immatricolazione
		</th>
		<th>
		chilometri
		</th>
		<th>
		autista
		</th>
		
	</tr>
<%
	Collection<Autobus> autobus;
	AutobusDAO trattadao= new AutobusDAO();
	autobus=trattadao.doRetrieveAll();
	for(Autobus t:autobus)
	{
	
%>


	
	<tr>
		<td><%=t.getModello() %></td>
		<td><%=t.getNumeroposti()%></td>
		<td><%=t.getAnnoimm()%></td>
		<td><%=t.getChilometri() %></td>
		<td><%=t.getAutista().getNome()%>  <%=t.getAutista().getCognome()%></td>
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
</head>



</body>
</html>