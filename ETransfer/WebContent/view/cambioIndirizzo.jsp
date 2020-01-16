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
 <center>
<div id="firstP">
<h2> Cambio Indirizzo</h2>

<form name="indirizzoform" action="ChangeIndirizzo" method="post">

<div>
	
		<div class="tableRow">
			<label class="rcolor" for="username">Nuovo indirizzo:</label>
			<input type="text" id="username" name="indir" value="" placeholder="Inserire nuovo indirizzo..." required> 
		</div>
		
		</fieldset>
		
		<div id="SecFie">
			<input class="submit" type="submit" value="Cambia">
			<input class ="reset" type="reset">
		</div>
		
	</form>
</div>
</center>



</body>
</html>