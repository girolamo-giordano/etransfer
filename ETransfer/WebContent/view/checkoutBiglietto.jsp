<%@page import="utenti.Cliente"%>
<%@page import="entita.Corsa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout biglietto</title>
</head>
<body>
<%
int numbiglietti= (int)request.getAttribute("numbiglietti");
int idcorsa=(int)request.getAttribute("idcorsa");
Corsa corsa= (Corsa)request.getAttribute("corsain");
Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");

%>
Totale da pagare=<%=corsa.getCosto()*numbiglietti %>
<form method="post" action="AcquistoBiglietto">
<center><h2 style="color:#F8F8FA"> DATI CARTA DI CREDITO</h2> </center>

			<fieldset id="primoF" id="form" >
						
					<div class="tableRow">
						<label class="rcolor" for="username">Nome e Cognome:</label>
						<input type="text" id="username" name="username" value="" placeholder="Inserire Nominativo.." required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">Numero Carta:</label>
						<input type="text" id="username" name="username" value="" placeholder="Inserire Numero Carta.."  required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">Scadenza:</label>
						<input type="text" id="username" name="username" value="" placeholder="Inserire Scadenza.."  required> 
					</div>
					
					<div class="tableRow">
						<label class="rcolor" for="username">CVV:</label>
						<input type="text" id="username" name="username" value="" placeholder="Inserire CVV.." required> 
					</div>
					
					
			
			
			</fieldset>
<input type="hidden" value="<%=numbiglietti %>" name="numbiglietti">
<input type="hidden" value="<%=idcorsa %>" name="idcorsa">
<input type="hidden" value="<%=cliente.getId() %>" name="idcliente">
<input type="submit" value="Completa acquisto">

</form>
</body>
</html>