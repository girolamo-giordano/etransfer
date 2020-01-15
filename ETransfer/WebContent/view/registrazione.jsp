<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="registrazione.css" type="text/css">
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


<div id="form">
<form name="checkforname" method="post" action="RegControl" onsubmit="event.preventDefault();validate(this)">

<fieldset>
	
		<h2 id=titolo> REGISTRAZIONE</h2>
		<h4 id="RegLog"> Hai gi� un account? <a id="Torna" href="Login.jsp" >Torna al Login </a></h4>
		
		<fieldset id="primoF">
			
		<div class="tableRow">
			<label class="rcolor" for="cognome">Nome:</label>
			<input type="text" id="name" name="name" " placeholder="Inserire nome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="nome">Cognome:</label>
			<input type="text" id="cognome" name="cognome"  placeholder="Inserire cognome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="indirizzo">Indirizzo:</label>
			<input type="text" id="indirizzo" name="indirizzo" placeholder="Inserire indirizzo.." required> 
		</div>
		
		
		
		<div class="tableRow">
			<label class="rcolor" for="provincia">Provincia: </label>
 			<select name="citta" id="provincia">
    			<option selected="selected">--</option>
                <optgroup label="Valle d'Aosta">
                	<option value="AO">AOSTA</option>
                </optgroup>
        
                <optgroup label="Piemonte">
                	<option value="AL">ALESSANDRIA</option>
                    <option value="AT">ASTI</option>
                    <option value="BI">BIELLA</option>
                    <option value="CN">CUNEO</option>
                    <option value="NO">NOVARA</option>
                    <option value="TO">TORINO</option>
                    <option value="VB">VERBANO-CUSIO-OSSOLA</option>
                    <option value="VC">VERCELLI</option>
                    
                </optgroup>
        
                <optgroup label="Liguria">
                	<option value="GE">GENOVA</option>
                    <option value="IM">IMPERIA</option>
                    <option value="SP">LA SPEZIA</option>
                    <option value="SV">SAVONA</option>
                </optgroup>
        
                <optgroup label="Lombardia">
                	<option value="BG">BERGAMO</option>
                    <option value="BS">BRESCIA</option>
                    <option value="CO">COMO</option>
                    <option value="CR">CREMONA</option>
                    <option value="LC">LECCO</option>
					<option value="LO">LODI</option>
                    <option value="MN">MANTOVA</option>
                    <option value="MI">MILANO</option>
                    <option value="MB">MONZA - BRIANZA</option>
                    <option value="PV">PAVIA</option>
                    <option value="SO">SONDRIO</option>
                    <option value="VA">VARESE</option>                    
                </optgroup>
        
                <optgroup label="Trentino-Alto Adige">
                	<option value="BZ">BOLZANO</option>
                    <option value="TN">TRENTO</option>
                </optgroup>
        
                <optgroup label="Veneto">
                	<option value="BL">BELLUNO</option>
                    <option value="PD">PADOVA</option>
                    <option value="RO">ROVIGO</option>
                    <option value="TV">TREVISO</option>
                    <option value="VE">VENEZIA</option>
					<option value="VR">VERONA</option>
                    <option value="VI">VICENZA</option>
                </optgroup>
        
                <optgroup label="Friuli-Venezia Giulia">
                	<option value="GO">GORIZIA</option>
                    <option value="PN">PORDENONE</option>
                    <option value="TS">TRIESTE</option>
                    <option value="UD">UDINE</option>
                </optgroup>
        
                <optgroup label="Emilia-Romagna">
                	<option value="BO">BOLOGNA</option>
                    <option value="FE">FERRARA</option>
					<option value="FC">FORLI'-CESENA</option>
                    <option value="MO">MODENA</option> 
                    <option value="PR">PARMA</option>
                    <option value="PC">PIACENZA</option>
                    <option value="RA">RAVENNA</option>
                    <option value="RE">REGGIO NELL'EMILIA</option> 
                    <option value="RN">RIMINI</option>        
                </optgroup>
        
                <optgroup label="Toscana">
                	<option value="AR">AREZZO</option>
                    <option value="FI">FIRENZE</option>
                    <option value="GR">GROSSETO</option>
                    <option value="LI">LIVORNO</option>
                    <option value="LU">LUCCA</option>
                    <option value="MS">MASSA-CARRARA</option>
                    <option value="PI">PISA</option>
					<option value="PT">PISTOIA</option>
                    <option value="PO">PRATO</option>
                    <option value="SI">SIENA</option>
                </optgroup>
        
                <optgroup label="Umbria">
                	<option value="PG">PERUGIA</option>
                    <option value="TR">TERNI</option>
                </optgroup>
        
                <optgroup label="Marche">
                	<option value="AN">ANCONA</option>
                    <option value="AP">ASCOLI PICENO</option>
                    <option value="FM">FERMO</option>
                    <option value="MC">MACERATA</option>
                    <option value="PU">PESARO E URBINO</option>
                </optgroup>
        
                <optgroup label="Lazio">
                	<option value="FR">FROSINONE</option>
                    <option value="LT">LATINA</option>
                    <option value="RM">ROMA</option>
                    <option value="RI">RIETI</option>
                    <option value="VT">VITERBO</option>
                </optgroup>
        
                <optgroup label="Abruzzo">
                	<option value="CH">CHIETI</option>
                    <option value="AQ">L'AQUILA</option>
                    <option value="PE">PESCARA</option>
                    <option value="TE">TERAMO</option>
                    
                </optgroup>
        
                <optgroup label="Molise">
                	<option value="CB">CAMPOBASSO</option>
                    <option value="IS">ISERNIA</option>
                </optgroup>
        
                <optgroup label="Campania">
                    <option value="AV">AVELLINO</option>
                    <option value="BN">BENEVENTO</option>
                    <option value="CE">CASERTA</option>
                    <option value="NA">NAPOLI</option>
                    <option value="SA">SALERNO</option>
                </optgroup>
        
                <optgroup label="Puglia">
                	<option value="BA">BARI</option>
                	<option value="BT">BARLETTA-ANDRIA-TRANI</option>
                    <option value="BR">BRINDISI</option>
                    <option value="FG">FOGGIA</option>
                    <option value="LE">LECCE</option>
                    <option value="TA">TARANTO</option>
                </optgroup>
        
                <optgroup label="Basilicata">
                	<option value="MT">MATERA</option>
                    <option value="PZ">POTENZA</option>
                </optgroup>
        
                <optgroup label="Calabria">
                	<option value="CZ">CATANZARO</option>
                    <option value="CS">COSENZA</option>
                    <option value="KR">CROTONE</option>
                    <option value="RC">REGGIO DI CALABRIA</option>
                    <option value="VV">VIBO VALENTIA</option>
                </optgroup>
        
                <optgroup label="Sicilia">
                	<option value="AG">AGRIGENTO</option>
                    <option value="CL">CALTANISSETTA</option>
                    <option value="CT">CATANIA</option>
                    <option value="EN">ENNA</option>
                    <option value="ME">MESSINA</option>
                    <option value="PA">PALERMO</option>
                    <option value="RG">RAGUSA</option>
					<option value="SR">SIRACUSA</option>
                    <option value="TP">TRAPANI</option>
                    
                </optgroup>
        
                <optgroup label="Sardegna">
                	<option value="CA">CAGLIARI</option>
                    <option value="CI">CARBONIA - IGLESIAS</option>
                    <option value="VS">MEDIO CAMPIDANO</option>
                    <option value="NU">NUORO</option>
                    <option value="OG">OGLIASTRA</option>
                    <option value="OT">OLBIA - TEMPIO</option>
                    <option value="OR">ORISTANO</option>
                    <option value="SS">SASSARI</option>
                </optgroup>
            </select>
    
        
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="email">Email:</label>
			<input type="email" id="email" name="email" placeholder="Inserire email.." required>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="email">Telefono:</label>
			<input type="number" id="telefono" name="telefono" placeholder="Inserire telefono.." required>
		</div>
		
		
		
		</fieldset>
		
		<fieldset id="secondoF">
			
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="user" name="username" placeholder="Inserire username.." required> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="confermaPassword" name="confermaPassword" placeholder="Inserire password.." required>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="password">Conferma Password:</label>
			<input type="password" id="password" name="password" placeholder="Inserire password.." required>
		</div>
		
		<div id="mostra"> <input type="checkbox" onclick="myFunction()"> Mostra Password </div>
			
		</fieldset>
		
			<label></label>
			<input class="submit" type="submit" value="Registrati">
			<input class ="reset" type="reset">
		
	</fieldset>
	</form>
</div>
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