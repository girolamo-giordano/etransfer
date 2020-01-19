<%@page import="entita.Autobus"%>
<%@page import="dao.AutobusDAO"%>
<%@page import="dao.TrattaDAO"%>
<%@page import="java.util.Collection"%>
<%@page import="entita.Tratta"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aggiungi corsa</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
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

<% Collection <Tratta> trattalist;
Collection <Autobus> autobus;
TrattaDAO trattadao= new TrattaDAO();
trattalist=trattadao.doRetrieveAll();
AutobusDAO busdao= new AutobusDAO();
autobus=busdao.doRetrieveAll();

%>

<form name="loginform" action="../AggiungiCorsa" method="post"> 

	<fieldset>
	
		<h2 id=titolo> Richiesta Corsa </h2>
		
		
			
		
		
		
		
		<div class="tableRow">
			<label class="rcolor" for="data">Data:</label>
			<input type="text" id="data" name="data" value="" placeholder="Inserire Data.." required style="
    width: 193px;
">
		</div>
		<div class="tableRow">
			<label class="rcolor" for="ora">Ora Partenza:</label>
			<input type="text" id="ora" name="ora" value="" placeholder="Inserire Ora partenza.." required style="
    width: 193px;
">
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="durata">Tratta:</label>
			<select class="sel" required style="width: 193px;
    height: 39px;">
				<option value="" selected> Partenza-Arrivo </option>
				<% for(Tratta t:trattalist){
					%>
					<option value="<%=t.getId()%>"><%=t.getPartenza()%> - <%=t.getArrivo() %> </option>
				<%} %>
			</select>
		</div>
		
		
		
		
		
		
		
		<input class="submit" type="submit" value="Richiedi">
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