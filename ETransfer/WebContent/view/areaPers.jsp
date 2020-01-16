<%@page import="utenti.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Area Personale</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="visualizzaCorse.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
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
<%Cliente c=(Cliente)request.getSession().getAttribute("cliente"); %>
<div id="firstP">
<h2> Ciao <%=c.getNome() %> <%=c.getCognome() %></h2>

<form>

<fieldset>
	
		<div class="tableRow">
			<label class="rcolor" for="indirizzo">Indirizzo:</label>
			<input type="text" id="indirizzo" name="indirizzo" value= <%=c.getIndirizzo() %> readonly> 
			<a href="cambioIndirizzo.jsp">Modifica Indirizzo </a>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="provincia">Provincia: </label>
 			<input type="text" id="provincia" name="provincia" value= <%=c.getCitta() %> readonly>
        
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="email">Email:</label>
			<input type="email" id="email" name="email" value= <%=c.getEmail() %> readonly>
			<a href="cambioEmail.jsp">Modifica Email </a>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="email">Telefono:</label>
			<input type="number" id="telefono" name="numerotelefono" value= <%=c.getNumerotel()%> readonly>
		</div>
		
		
		
		</fieldset>
		
		<fieldset id="secondoF">
			
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="user" name="username" value= <%=c.getUsername()%> readonly> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="Password" name="Password" value="*****" readonly>
			<a href="cambioIndirizzo.jsp">Modifica Password </a>
		</div>
		
		
	</fieldset>
	</form>

</div>

</body>
</html>