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
<LINK rel= "stylesheet" href="aggiungiAutista.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>



<div class="topnav">
  <ul> 
 <li> <a href="home.jsp">Home</a> </li>
  <li> <a href="chisiamo.jsp">L'azienda</a> </li>
  <li> <a href="areautente.jsp">Area Admin</a> </li>
  <li> <a href="corsa.jsp">Le nostre corse</a> </li>
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
	
		<h2 id=titolo> Aggiunta Corsa </h2>
		
		
			
		<div class="tableRow">
			<select name="tratta" required>
				<option value="" selected> select </option>
				<% for(Tratta t:trattalist){
					%>
					<option value="<%=t.getId()%>"><%=t.getPartenza()%> - <%=t.getArrivo() %> </option>
				<%} %>
			</select>
			<select name="bus" required>
			<option value="" selected> select</option>
			<%for(Autobus a:autobus){
				%>
				<option value="<%=a.getId() %>"><%=a.getModello() %> - <%=a.getAutista().getCognome()%></option>
			<%
			}%>
			
			</select>
		</div>
		
		
		
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
			<input type="number" id="durata" name="durata" value="" min="0" placeholder="Inserire durata.." required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="fermate">Fermate:</label>
			<input type="text" id="fermate" name="fermate" value="" placeholder="Inserire fermate.." required>
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