<%@page import="utenti.Cliente"%>
<%@page import="entita.Corsa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout biglietto</title>
<LINK rel= "stylesheet" href="view/home.css" type="text/css">
<LINK rel= "stylesheet" href="view/login.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="./foto/logo.jpeg">
</div>
<%
int numbiglietti= (int)request.getAttribute("numbiglietti");
int idcorsa=(int)request.getAttribute("idcorsa");
Corsa corsa= (Corsa)request.getAttribute("corsain");
Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");

%>

<div id="menu">
	<ul>
		<li class="selected"><a href="view/home.jsp">Home</a></li>
		<li> <a href="view/chisiamo.jsp">L'azienda</a></li>
		<li> <a href="view/areaPers.jsp">Area Utente</a> </li>
		<li> <a href="view/corsa.jsp">Le nostre corse</a> </li>
		
		<li class="dropdown4"><a href="#">Personalizza Viaggio</a>
		
 			 <div class="dropdown4-content">
   				 <a href="view/richiestaCorsa.jsp"> Richiesta Corsa </a>
    				<a href="view/richiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="view/richiestaTratta.jsp"> Richiesta Tratta </a>
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="view/logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>

	
	<div style="margin-top:40px;">


</div>

<form method="post" action="AcquistoBiglietto" onsubmit="event.preventDefault();validate(this)">
<center><h2 style="color:#F8F8FA"> DATI CARTA DI CREDITO</h2> </center>

<fieldset id="primoF" id="form" >
						
					<div class="tableRow">
						<label class="rcolor" for="username">Nome e Cognome:</label>
						<input type="text" id="username" name="username" value="" placeholder="Inserire Nominativo.." required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">Numero Carta:</label>
						<input type="text" id="username" name="numc" value="" placeholder="Inserire Numero Carta.."  required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">Scadenza:</label>
						<input type="text" id="username" name="scad" value="" placeholder="Inserire Scadenza.."  required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">CVV:</label>
						<input type="text" id="username" name="cvv" value="" placeholder="Inserire CVV.." required> 
					</div>
					
					
		
			
</fieldset>

<input type="hidden" value="<%=numbiglietti %>" name="numbiglietti">
<input type="hidden" value="<%=idcorsa %>" name="idcorsa">
<input type="hidden" value="<%=cliente.getId() %>" name="idcliente">

<input type="submit" value="Completa acquisto <%=corsa.getCosto()*numbiglietti %>&#8364" style=" display: inline-block;
 text-align: center;
 white-space: nowrap;
 color: #333;
 text-decoration: none;
 line-height: 1.2;
 font-weight: normal;
 font-family: sans-serif;
 font-size: 18px;
 background-color: #F8F8FA;
 border-radius: 27px;
 padding: 22px 35px;
 border: 0px solid #006FE6;
 cursor: pointer;
 margin-top: 23px;
    margin-left: 70px;
 ">

</form>
<script type="text/javascript">
function validate(obj){
	var valid=true;
	
	var surname=document.getElementsByName("username")[0];
	var checksur=/^([a-zA-Z0-9]+|[a-zA-Z0-9]+\s{1}[a-zA-Z0-9]{1,}|[a-zA-Z0-9]+\s{1}[a-zA-Z0-9]{3,}\s{1}[a-zA-Z0-9]{1,})$/;
		if(!surname.value.match(checksur)){
			valid=false;
			alert("Nome e cognome errati");
	}
	
	var email=document.getElementsByName("numc")[0];
	var checknum=/^([0-9]{16})$/
	if(!email.value.match(checknum)){
		valid=false;
		alert("Numero PAN non valido");
	}
	var password=document.getElementsByName("scad")[0];
	var confermapassword=/^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$/;
	if(!password.value.match(confermapassword))
		{
			valid=false;
			alert("Data di scadenza non valida");
			
		}
	var numtelefono=document.getElementsByName("cvv")[0];
	var phoneno=/^([0-9]{3})$/;
	if(!(numtelefono.value.match(phoneno)))
		{
			valid=false;
			alert("CVV non valido");

		}
	

	
	if(valid)obj.submit();
}

</script>
<script src="javascriptcode.js"></script>
<script src="jquery-3.js"></script>

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>