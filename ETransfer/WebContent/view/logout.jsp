<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout avvenuto con successo</title>
<link rel="icon" href="foto/favicon.ico">
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="success.css" type="text/css">


</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<form>
<div class="succText"> Logout avvenuto con successo, verrai reindirizzato alla Homepage</div>
<%request.getSession().setAttribute("cliente",null);
request.getSession().setAttribute("autista",null); 
request.getSession().setAttribute("manager",null); %>

<script>
  setTimeout(function() {
      document.location = "home.jsp";
  }, 2000);
</script>
</form>
 <div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
	</div>

</body>
</html>