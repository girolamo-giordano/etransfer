<%@page import="java.util.Collection"%>
<%@page import="dao.AutistaDAO"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aggiunta Autobus</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="aggiungiAutista.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<% Collection <Autista> autistalist;
AutistaDAO autistadao= new AutistaDAO();
autistalist=autistadao.doRetrieveAll();


%>


<div class="topnav">
  <ul> 
 <li> <a href="home.jsp">Home</a> </li>
  <li> <a href="chisiamo.jsp">L'azienda</a> </li>
  <li> <a href="areaPers.jsp">Area Admin</a> </li>
  <li> <a href="eliminaFermata.jsp">Elimina Fermata</a> </li>
  
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Visualizza </a> 
  	<div class="dropdown-content">
  	<a href="corsa.jsp">Le nostre corse</a>
  	<a href="visualizzaAutisti.jsp"> I nostri Autisti </a>
  	<a href="visualizzaAutobus.jsp"> I nostri Bus </a>
  	
  	</div>
  	</li>
  
  
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Aggiungi </a> 
  	<div class="dropdown-content">
  	<a href="aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="aggiungiTratta.jsp"> Aggiungi Tratta </a>
  	</div>
  	</li>
  	
  	<li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Visualizza Richieste </a> 
  	<div class="dropdown-content">
  	<a href="visualizzarichiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="visualizzarichiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="visualizzarichiestaTratta.jsp"> Richiesta Tratta </a>
  	
  	</div>
  	</li>
  	
  	<div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="logout.jsp" style="float:right">Logout</a>
  
</div>
  </ul>
  
</div>
  

<form name="loginform" action="LogControl" method="post"> 

	<fieldset>
	
		<h2 id=titolo> Aggiunta Autobus </h2>
		
		
			
		<div class="tableRow">
			<label class="rcolor" for="modello">Modello:</label>
			<input type="text" id="modello" name="modello" value="" placeholder="Inserire Modello.." required> 
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="numeroPosti">Numero Posti:</label>
			<input type="number" id="numeroPosti" name="numeroPosti" value="" min="10" max="130" placeholder="Inserire Numero Posti.." required style="
    width: 192px;
"> 
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="anno">Immatricolazione:</label>
			<input type="number" id="anno" name="anno" value="" placeholder="Inserire Anno Immatricolazione.." min="1990" max="2019" required style="
    width: 193px;
">
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="km">Chilometri:</label>
			<input type="number" id="km" name="km" value="" placeholder="Inserire kilometri..." min="0" required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="autista">Autista:</label>
			<select class="sel" style="width: 193px;
    height: 39px;" required>
				<option value="" selected> Autista </option>
				<%for(Autista a:autistalist){
				%>
				<option value="<%=a.getId() %>"><%=a.getNome()%> <%=a.getCognome()%> </option>
			<%
			}%>
			</select>
		</div>
		
		
		
		<input class="submit" type="submit" value="Aggiungi">
			<input class ="reset" type="reset"> <br>
	
	</fieldset>
</form>
		
		

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>

</body>
</html>