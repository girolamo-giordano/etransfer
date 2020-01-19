<%@page import="dao.RichiestafermataDAO"%>
<%@page import="entita.Richiestafermata"%>
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
<h2><center>Visualizza Richieste fermate</center></h2>
<div id="firstP">

<table>
	<tr>
		<th>
		Nome Fermata
		</th>
		<th>
		Partenza
		</th>
		<th>
		Arrivo
		</th>
		<th>
		Azioni
		</th>
		
		
	</tr>
<%
	Collection<Richiestafermata> rc;
	RichiestafermataDAO rcdao= new RichiestafermataDAO();
	rc=rcdao.doRetrieveAll();
	
	for(Richiestafermata t:rc)
	
	{
	
%>


	
	<tr>
		<td><%=t.getNomefermata()%></a></td>
		<td><%=t.getCorsa().getTratta().getPartenza()%></a></td>
		<td><%=t.getCorsa().getTratta().getArrivo()%></td>
		<td><a href="../ConfermaRichiestaFermata?idrichfermata=<%=t.getId()%>">Aggiungi fermata</a>
		|| <a href="../EliminaRichiestaFermata?idrichfe=<%=t.getId()%>">Rimuovi Fermata</a>
		</td>
		
	</tr>

	
<%} %>
</table>
</div>

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>