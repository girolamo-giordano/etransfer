<%@page import="utenti.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica Indirizzo</title>

<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="cambia.css" type="text/css">

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
	<div style="margin-top:80px;">


</div>

<%Cliente c=(Cliente)request.getSession().getAttribute("cliente"); %>
 <center>
<div id="firstP">
<h2> Cambio Indirizzo</h2>

<form name="indirizzoform" action="../ModificaIndirizzo" method="post">

<div>
	
		<div class="tableRow">
			<label class="rcolor" for="username">Nuovo indirizzo:</label>
			<input type="text"  id="username" name="indir" value="" placeholder="Inserire nuovo indirizzo..." required> 
		</div>
		
		</fieldset>
		
		<div id="SecFie">
			<input class="submit" type="submit" value="Cambia">
			<input class ="reset" type="reset">
		</div>
		
	</form>
</div>
</center>



</body>
</html>