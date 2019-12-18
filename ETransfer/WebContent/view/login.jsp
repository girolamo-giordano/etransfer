<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<header class="top"> 
<img src="../foto/etransfer.png">
</header>
<body>
<nav>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Chi siamo</a></li>
		
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei viaggi</a>
    		</div>
		</li>
			
	
		
		
		<li><a href="catalogo.jsp">Corse</a></li>
		<div id="lright">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrati</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
	</nav>
<fieldset>
	
		<h2 id=titolo> Login</h2>
		
		<fieldset id="primoF">
			<legend>Credenziali</legend>
		<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="username" name="username" placeholder="Inserire usernome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="password" name="password" placeholder="Inserire password.." required>
		</div>
		
		<div id="mostra"> <input type="checkbox" onclick="myFunction()"> Mostra Password </div>
		
		<div id="button">
		<input type="radio" id="radiobutton" name="sceltaP" value="Admin" checked="checked"> 
		<label class="rcolor" for="radio"> Admin </label>

		<input type="radio" id="radiobutton" name="sceltaP" value="Utente">
		<label class="rcolor" for="radio"> Utente </label>
		
		</div>
			
		</fieldset>
		
		
			<input class="submit" type="submit" value="Login">
			<input class ="reset" type="reset"> <br>
		</form>
		
		<div id="reg"> <h2 id="RegText"> Sei nuovo su ETransfer?</h2> 
		
		 <a href="registrazione.jsp"> <input type="button" id="regBut" value="REGISTRATI"> </a>  </div>
	</fieldset>
	<div class="fadein">
 	<div id="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
</body>
</html>