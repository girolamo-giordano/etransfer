<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 	
	String username=(String)request.getAttribute("username");
	if(username==null) username="";
	
	String password =(String) request.getAttribute("password");
	if(password==null) password="";
	
%>
<html>
<head>


<title>Login</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">

</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<% 
	String errore=(String) request.getAttribute("errore");
	if(errore!=null){
%>
	<div> <%=errore%></div>
<%
	}
 
	String message=(String) request.getAttribute("message");
	if(message!=null){
%>
	<div> <%=message%></div>
<%
	}
%>

<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp">L'azienda</a> </li>
  		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
  		<li> <a href="visualizzaAutobus.jsp">I nostri autobus</a> </li>
		
		
		
		<div id="lright" style="float:right">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrazione</a></li>
		</div>
	</ul>
	</div>

<div id="form">
<form name="loginform" action="../Login" method="post"> 

<fieldset>
	
		<h2 id=titolo> Login</h2>
		
		<fieldset id="primoF">
			
		<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="username" name="username" value="<%=username %>" placeholder="Inserire usernome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="password" name="password" value="<%=password %>" placeholder="Inserire password.." required>
		</div>
		
		<div id="mostra"> <input type="checkbox" onclick="myFunction()"> Mostra Password </div>
		
		<div id="button">
		

		<input type="radio" id="radiobutton" name="sceltaP" value="Utente" checked="checked">
		<label class="rcolor" for="radio"> Cliente </label>
		
		<input type="radio" id="radiobutton" name="sceltaP" value="Admin" > 
		<label class="rcolor" for="radio"> Manager </label>
		
		<input type="radio" id="radiobutton" name="sceltaP" value="Autista">
		<label class="rcolor" for="radio"> Autista </label>
		
		</div>
			
		</fieldset>
		
		
		
			<input class="submit" type="submit" value="Login">
			<input class ="reset" type="reset"> <br>
		</form>
		
		<div style="padding-top:10px;">
		 <a id="ricordapass" href="RecuperaPassword.jsp" style="margin:65px; color:#F8F8FA; "> Hai dimenticato la password?</a>
		 </div>
		 
		<div id="reg"> <h2 id="RegText"> Sei nuovo su ETransfer?</h2> 
		
		 <a href="registrazione.jsp"> <input type="button" id="regBut" value="REGISTRATI"> </a>  </div>
		 
		
	</div>
	
	
	<div class="footer">
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