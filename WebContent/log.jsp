<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="css/estilos.css" rel="stylesheet">
    	<script src="js/md5.js" type="text/javascript"></script>
    	
    	
	</head>
	<body style="background:#262537">
		<div class = "container">
			<div class="wrapper">
				<form action="setSession.jsp" method="post" name="Login" class="form-signin">       
				    <h3 class="form-signin-heading">BIENVENIDO</h3>
				    ${errorMSG};
					  <hr class="colorgraph"><br>
					  
					  <input type="text" class="form-control" name="nick" placeholder="Usuario" required="" autofocus="" />
					  <input type="password" class="form-control" name="pass" placeholder="Password" required=""/>     		  
					 
					  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login"  onclick="Md5Log('Login')">Iniciar</button>  			
				</form>			
			</div>
		</div>
		<script src="js/jquery.js"></script>
		
		<script src="js/bootstrap.js"></script>
		<script src="js/nuevo.js"></script>
	</body>
</html>