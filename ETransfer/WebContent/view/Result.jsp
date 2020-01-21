<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recupero credenziali</title>
<link rel="icon" href="foto/favicon.ico">
<LINK rel= "stylesheet" href="view/home.css" type="text/css">
<LINK rel= "stylesheet" href="view/success.css" type="text/css">
</head>

<script>
  setTimeout(function() {
      document.location = "view/login.jsp";
  }, 2000);
</script>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="./foto/logo.jpeg">
</div>
<form>
<div class="succText"> <%=request.getAttribute("Message")%></div>

 <div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
	</div>
</body>
</html>