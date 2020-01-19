<%@page import="dao.CorsaDAO"%>
<%@page import="utenti.Manager"%>
<%@page import="utenti.Autista"%>
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



<body>

<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="foto/logo.jpeg">
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
	<tr><td style="padding-left:80px;">    -<%=t.getNomefermata() %></td></tr>
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

<form id="check" method="post" action="CheckoutAcquisto">
	<input id="sub" name="numbiglietti" type="number" min="1" value="1" max="10" required">
	<input type="hidden" value="<%=corsa.getId()%>" name="corsaid">
	<input id="sub" type="submit" value="Acquista">
</form>


</div>
</div>


<% 
	
	}else if(autista != null){%>
	
	<div id="menu">
	<ul>
		<li class="selected"><a href="view/home.jsp">Home</a></li>
		<li> <a href="view/chisiamo.jsp">L'azienda</a></li>
		<li> <a href="view/areaPers.jsp">Area Utente</a> </li>
		<li> <a href="view/corsa.jsp">Le nostre corse</a> </li>
		
		
		<div id="lright" style="float:right">
			<li><a href="view/logout.jsp">Logout</a></li>
		</div>
	</ul>
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

	<tr><td style="padding-left:80px;">    -<%=t.getNomefermata() %></td></tr>
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




</div>
</div>
</div>
	
	<%}else if(manager != null){ %>
	
	
	<div id="menu">
	<ul>
		<li class="selected"><a href="view/home.jsp">Home</a></li>
		<li> <a href="view/chisiamo.jsp">L'azienda</a></li>
		<li> <a href="view/areaPers.jsp">Area Admin</a> </li>
		<li> <a href="view/eliminaFermata.jsp">Elimina Fermata</a> </li>
		
		<li class="dropdown"><a href="#">Visualizza</a>
		
 			 <div class="dropdown-content">
   				 <a href="view/corsa.jsp"> Le nostre Corse </a>
    			<a href="view/visualizzaAutisti.jsp"> I nostri autisti </a>
  				<a href="view/visualizzaAutobus.jsp">I nostri bus </a>
    		</div>
		</li>
		
		<li class="dropdown1"><a href="#">Aggiungi</a>
		
 			 <div class="dropdown1-content">
   				<a href="view/aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="view/aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="view/aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="view/aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="view/aggiungiTratta.jsp"> Aggiungi Tratta </a>
    		</div>
		</li>
		
		<li class="dropdown2"><a href="#">Visualizza Richieste</a>
		
 			 <div class="dropdown2-content">
   				 <a href="view/visualizzarichiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="view/visualizzarichiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="view/visualizzarichiestaTratta.jsp"> Richiesta Tratta </a>
  	
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="view/logout.jsp">Logout</a></li>
		</div>
	</ul>
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
	<tr><td style="padding-left:80px;">    -<%=t.getNomefermata() %></td></tr>
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




</div>
</div>
</div>
  	
  

<%} else{ %>




	
	<div id="menu">
	<ul>
		<li class="selected"><a href="view/home.jsp">Home</a></li>
		<li><a href="view/chisiamo.jsp">L'azienda</a> </li>
  		<li> <a href="view/corsa.jsp">Le nostre corse</a> </li>
  			<li> <a href="view/visualizzaAutobus.jsp">I nostri autobus</a> </li>
		
		
		
		<div id="lright" style="float:right">
			<li><a href="view/login.jsp">Login</a></li>
			<li><a href="view/registrazione.jsp">Registrazione</a></li>
		</div>
	</ul>
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
	<tr><td style="padding-left:80px;">    -<%=t.getNomefermata() %></td></tr>
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




</div>
</div>



<%} %>


<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>

</head>
</body>
</html>