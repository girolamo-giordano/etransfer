<%@page import="dao.CorsaDAO"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aggiunta Autista</title>
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
<%
Collection<Corsa> corse;
CorsaDAO corsadao= new CorsaDAO();
corse=corsadao.doRetrieveAll();

%>
<form name="loginform" action="../RichiestaFermata" method="post"> 

	<fieldset>
	
		<h2 id=titolo> Richiesta Fermata </h2>
		
		
			
		<div class="tableRow">
			<label class="rcolor" for="nome">Nome Fermata:</label>
			<input type="text" id="nome" name="nome" value="" placeholder="Inserire Nome.." required> 
		</div>
		
			<div class="tableRow">
			<label class="rcolor" for="durata">Corsa:</label>
			<select class="sel" style="width: 193px;
    height: 39px;" required>
    <option value="" selected> Partenza-Arrivo ora </option>
				<% for(Corsa t:corse){
					%>
					<option value="<%=t.getId()%>"><%=t.getTratta().getPartenza()%>-<%=t.getTratta().getArrivo() %> <%=t.getOrapart()%>  </option>
				<%} %>
			</select>
		</div>
		
		
		
		
		
		<input class="submit" type="submit" value="Richiedi">
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