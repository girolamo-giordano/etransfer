<%@page import="java.util.ArrayList"%>
<%@page import="entita.Corsa"%>
<%@page import="dao.FermataDAO"%>
<%@page import="entita.Fermata"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scheda corsa</title>
<LINK rel= "stylesheet" href="view/home.css" type="text/css">
<LINK rel= "stylesheet" href="view/infoCorsa.css" type="text/css">
<LINK rel= "stylesheet" href="view/login.css" type="text/css">


<body>
<script type="text/javascript">
	function mostra(obj) {
		document.getElementById("content"+obj).style.display="block";
		}
	function nascondi(obj) {
		document.getElementById("content"+obj).style.display="none";
	}	
	
	</script>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="foto/logo.jpeg">
</div>

<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="view/home.jsp">Home</a>
  <a href="chisiamo.jsp">L'azienda</a>
  <a href="areautente.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="Login.jsp" style="float:right">Login</a>
  <a href="registrazione.jsp" style="float:right">Registrazione</a>
</div>
</div>

<div style="margin-top:80px;">


</div>

<%
	Corsa corsa=  (Corsa)request.getAttribute("corsasel");
	
%>



<h2 style="
    font-size: -webkit-xxx-large;
"><center>Dettagli Viaggio</center></h2>


<div id=totale>

<div id="firstP">


<table>
	<tr>
		<th>
		Tragitto
		</th>
	</tr>
	
	<tr>
		<td class="arrpar">&#183<%=corsa.getTratta().getPartenza() %></td>
	</tr>
	
	<%
	ArrayList<Fermata> fermate;
	fermate=corsa.getFermate();
	
	for(Fermata t:fermate)
	
	{
	
%>
	<tr><td>    -<%=t.getNomefermata() %></td></tr>
<%} %>
	<tr>
		<td class="arrpar">&#183<%=corsa.getTratta().getArrivo() %></td>
	</tr>
</table>

<table>
	<tr>
		<th>
		Autobus
		</th>
		<th>
		Data
		</th>
		<th>
		Orario
		</th>
		<th>
		Durata
		</th>
		<th>
		Prezzo
		</th>
	</tr>
	
	<tr>
		<td> <%=corsa.getBus().getModello() %></td>
		<td> <%=corsa.getDatapart() %></td>
		<td> <%=corsa.getOrapart() %></td>
		<td> <%=corsa.getDurata() %> </td>
		<td> <%=corsa.getCosto() %>&#8364</td>
	</tr>

</table>


<div id="pulsanti" style=" margin-left:225px;">
	<input style="padding:10px; margin-top:20px; width: 240px;" type="button" value="PROCEDI AL PAGAMENTO" onclick="javascript:mostra('<%=corsa.getId() %>')" />   
</div>


<div id="content<%=corsa.getId()%>" style="display:none; padding-left: 150px">
	
	
		<form name="loginform" id="form"> 
		<center><h2 style="color:#F8F8FA"> DATI CARTA DI CREDITO</h2> </center>

			<fieldset id="primoF" >
						
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
			<center><input style="padding:10px; margin-top:20px;" type="button" value="Nascondi" onclick="javascript:nascondi('<%=corsa.getId() %>')" />
					<input style="padding:10px; margin-top:20px;" type="button" value="Completa l'acquisto" onclick="location.href='buysuccess.jsp';" />  
					 </center>
		</form>
	
	
</div>

</div>
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