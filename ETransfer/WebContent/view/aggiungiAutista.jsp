<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aggiunta Autista</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="aggiungiAutista.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>



<div class="topnav">
  <ul> 
 <li> <a href="home.jsp">Home</a> </li>
  <li> <a href="chisiamo.jsp">L'azienda</a> </li>
  <li> <a href="areautente.jsp">Area Admin</a> </li>
  <li> <a href="corsa.jsp">Le nostre corse</a> </li>
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Aggiungi </a> 
  	<div class="dropdown-content">
  	<a href="aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="aggiungiTratta.jsp"> Aggiungi Tratta </a>
  	</div>
  	</li>
  </ul> 
</div>

<form name="loginform" action="../AggiungiAutista" method="post"> 

	<fieldset>
	
		<h2 id=titolo> Aggiunta Autista </h2>
		
		
			
		<div class="tableRow">
			<label class="rcolor" for="nome">Nome:</label>
			<input type="text" id="nome" name="nome" value="" placeholder="Inserire Nome.." required> 
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="cognome">Cognome:</label>
			<input type="text" id="cognome" name="cognome" value="" placeholder="Inserire Cognome.." required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="username" name="username" value="" placeholder="Inserire Username.." required >
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="pass">Password:</label>
			<input type="password" id="pass" name="pass" value="" placeholder="Inserire password..."  required >
		</div>
		
		
		
		
		
		<input class="submit" type="submit" value="Aggiungi">
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