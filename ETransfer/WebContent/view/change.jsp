<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica avvenuta con successo</title>
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
<div class="succText"> Modifica avvenuta con successo, verrai reindirizzato alla tua Pagina Personale</div>
<script>
  setTimeout(function() {
      document.location = "areaPers.jsp";
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