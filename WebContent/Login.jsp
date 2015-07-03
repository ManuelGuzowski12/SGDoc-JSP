<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
	<link href="css/estilos.css" rel="stylesheet">
	<script src="js/md5.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<br>
	<div class="row">
		<div class="col-md-4 col-md-offset-4 text-center">
	      <div class="panel panel-pricing" style="border:1px; box-shadow:0px 2px 15px rgba(0, 0, 0, 0.42)">
	          <div class="panel-heading " style="background:#62c2e4; color:#fff;border:1px">
	              <i class="fa fa-folder-open fa-5x"></i>
	              <div><br></div>
	          </div>
	          <hr class="colorgraph">
	          <div class="panel-body text-center">
	              <p><strong>Bienvenido</strong></p>
	              ${errorMSG}
	          </div>
	          <div class="container-fluid">
	          <ul class="list-group text-center">
	          	<form action="autenticarUsuarios.jsp" method="post" name="Login" class="form">
	          		<div class="row">
	          		<div class="col-md-4">
	          		<label for="exampleInputEmail1">Usuario</label>
	          		</div>
					  <div class="col-md-12 form-group">
					    <input type="text" class="form-control" id="exampleInputEmail1" name="nick" placeholder="Usuarios">
					  </div>
				  	</div>
				  	<div class="row">
				  	<div class="col-md-4">
				  	<label for="exampleInputPassword1">Password</label>
				  	</div>
					  <div class="col-md-12 form-group">
					    <input type="password" class="form-control" name="pass" id="exampleInputPassword1" placeholder="Password">
					  </div>
				 	</div>
	          </ul>
	          </div>
	          <div class="panel-footer">
	              <button class="btn btn-lg btn-block btn-success" type="submit" onclick="Md5Log('Login')">Iniciar</button>
	          </div>
	          </form>
	      </div>
		</div>
	</div>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/nuevo.js"></script>
</body>
</html>