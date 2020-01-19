<%@page import="dao.CorsaDAO"%>
<%@page import="utenti.Cliente"%>
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
	CorsaDAO corsadao= new CorsaDAO();
	Corsa corsa=  (Corsa)request.getAttribute("corsasel");
	FermataDAO fermatadao= new FermataDAO();
	

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
	Collection<Fermata> fermate;
	fermate=fermatadao.doRetrieveAll();
	ArrayList<Fermata> fermatefin=new ArrayList<Fermata>();
	for(Fermata f:fermate)
	{
		if(f.getCorsa().getId()==corsa.getId())
		{
			fermatefin.add(f);
		}
	}
	for(Fermata t:fermatefin)
	
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

<form method="post" action="CheckoutAcquisto">
	<input name="numbiglietti" type="number" min="1" max="10" required">
	<input type="hidden" value="<%=corsa.getId()%>" name="corsaid">
	<input type="submit" value="Acquista">
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