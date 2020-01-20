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
  	
  
  
</div>

<% Collection <Tratta> trattalist;
Collection <Autobus> autobus;
TrattaDAO trattadao= new TrattaDAO();
trattalist=trattadao.doRetrieveAll();
AutobusDAO busdao= new AutobusDAO();
autobus=busdao.doRetrieveAll();

%>

<form name="loginform" action="../AggiungiCorsa" method="post" onsubmit=" event.preventDefault();myFunction(this)"> 

	<fieldset>
	
		<h2 id=titolo> Aggiunta Corsa </h2>
		
		
			
		
		
		
		
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
			<label class="rcolor" for="durata">Durata:</label>
			<input type="number" id="durata" name="durata" value="" min="1" max="999" placeholder="Inserire durata.." required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="durata">Costo:</label>
			<input type="number" id="durata" name="costo" value="" min="1" max="999" placeholder="Inserire costo.." required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="durata">Tratta:</label>
			<select name="tratta" class="sel" required style="width: 193px;
    height: 39px;">
				<option value="" selected> Partenza-Arrivo </option>
				<% for(Tratta t:trattalist){
					%>
					<option value="<%=t.getId()%>"><%=t.getPartenza()%> - <%=t.getArrivo() %> </option>
				<%} %>
			</select>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="durata">Trasporto:</label>
			<select name="bus" class="sel" style="width: 193px;
    height: 39px;" required>
				<option value="" selected> Bus-Autista </option>
				<%for(Autobus a:autobus){
				%>
				<option value="<%=a.getId() %>"><%=a.getModello() %> - <%=a.getAutista().getCognome()%></option>
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
<script>
function myFunction(obj) {
	var valid=true;
	var numtelefono=document.getElementsByName("data")[0];
	var phoneno=/^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/;
	if(!(numtelefono.value.match(phoneno)))
		{
			valid=false;
			alert("data non valida");
			

		}
	
	var ora=document.getElementsByName("ora")[0];
	var regora=/^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
	if(!(ora.value.match(regora)))
		{
			valid=false;
			alert("ora non valida");
		}
	if(valid)obj.submit();
}

</script>


<script src="javascriptcode.js"></script>
<script src="jquery-3.js"></script>



</body>
</html>