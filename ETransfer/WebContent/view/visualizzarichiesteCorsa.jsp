<%@page import="entita.Autobus"%>
<%@page import="dao.AutobusDAO"%>
<%@page import="dao.RichiestaCorsaDAO"%>
<%@page import="entita.Richiestacorsa"%>
<%@page import="dao.CorsaDAO"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corse</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="visualizzaCorse.css" type="text/css">
</head>
<body>
<%AutobusDAO autobusdao= new AutobusDAO();
Collection<Autobus> autobus= autobusdao.doRetrieveAll();
%>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
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
<h2><center>Visualizza Richieste corse</center></h2>
<div id="firstP">

<table>
	<tr>
		<th>
		Partenza
		</th>
		<th>
		Arrivo
		</th>
		<th>
		Data
		</th>
		<th>
		Ora Partenza
		</th>
		<th>
		Autobus
		</th>
		<th>
		Durata
		</th>
		<th>
		Costo
		</th>
		<th>
		Azioni
		</th>
		
		
	</tr>
<%
	Collection<Richiestacorsa> rc;
	RichiestaCorsaDAO rcdao= new RichiestaCorsaDAO();
	rc=rcdao.doRetrieveAll();
	
	for(Richiestacorsa t:rc)
	
	{
	
%>


	<tr>
		<td><%=t.getTratta().getPartenza()%></td>
		<td><%=t.getTratta().getArrivo()%></td>
		<td><%=t.getDatapart()%></td>
		<td><%=t.getOrapart()%></td>
		<td><select name="idbus" id="idbus">
		<option value="" selected> Seleziona autobus </option>
				<% for(Autobus a:autobus){
					%>
					<option value="<%=a.getId()%>"><%=a.getModello()%> - <%=a.getAutista().getCognome() %> </option>
				<%} %>
		</select></td>
		<td><input type="text" name="durata" id="durata"></td>
		<td><input type="text" name="costo" id="costo"></td>
		<td><button onclick="see('<%=t.getId()%>')"> Aggiungi corsa</button>
		<a href="../EliminaRichiestaCorsa?idrichco=<%=t.getId()%>">Elimina corsa</a>
		</td>
		
	</tr>

	
<%} %>
</table>
<script type="text/javascript">
function see(k)
{
	var r= document.getElementById("idbus").value;
	var j= document.getElementById("durata").value;
	var a= document.getElementById("costo").value;

	var x="../ConfermaRichiestaCorsa?idbus="+r+"&durata="+j+"&idrcor="+k+"&costo="+a;
	window.location.href=x;
}

</script>
</div>

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>