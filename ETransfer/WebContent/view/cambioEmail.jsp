<%@page import="utenti.Manager"%>
<%@page import="utenti.Autista"%>
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
  	
  

<%}%>

</div>

<div style="margin-top:80px;">


</div>

 <center>
<div id="firstP">
<h2> Cambio Email</h2>


<form name="mailform" action="../ModificaEmail" method="post" onsubmit="event.preventDefault();validate(this)">

<div>
	
		<div class="tableRow">
			<label class="rcolor" for="username">Nuova Email:</label>
			<input type="email" id="username" name="indir" value="" placeholder="Inserire nuova email..." required> 
		</div>
		
		
		
		<div id="SecFie">
			<input class="submit" type="submit" value="Cambia">
			<input class ="reset" type="reset">
		</div>
		
	</form>
</div>
</center>
<script type="text/javascript">
function validate(obj){
	var valid=true;
	var email=document.getElementsByName("indir")[0];
	if(!checkEmail(email)){
		valid=false;
		$("#email").addClass("error");
		$("#errorna4").remove();
		$("#email").after('<label id="errorna4" >Email Errata</label>');
	}else{
		$("#errorna4").remove();
		$("#email").removeClass("error");
	}
	if(valid)obj.submit();
}
</script>

<script src="javascriptcode.js"></script>
<script src="jquery-3.js"></script>
</body>
</html>