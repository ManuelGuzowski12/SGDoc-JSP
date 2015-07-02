<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "GestionDocumental.*"%>
<%@page import= "java.text.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/colorgraph.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.file-input.js"></script>
<style type="text/css">
	body{
		padding-bottom: 70px;
		background-color: #eeeff4;
		font-family: Lucida Grande, "Tahoma";}
</style>
<title>Subir Archivo</title>
</head>
<body>
	<%	
				documentos doc = new documentos();
			    doc.GetId();
			    int id_documento = doc.getIddocumento();
			
	%>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class = "container">
		
			<div class="row">
			
				<div class="col-md-4"></div>
				<div class="col-md-4">
				
					<h1><span class="label label-info visible-lg">Eligir una Imagen</span></h1>
					<hr class="colorgraph-01"><br>
					   <form method="post" action="uploadServlet" enctype="multipart/form-data">
            				<input id="file"type="file"name="imagen" data-filename-placement="inside">
            				<br><br>
            				<script type="text/javascript">
                   				$('input[type=file]').bootstrapFileInput();
                   				$('.file-inputs').bootstrapFileInput();
                   			</script>
                   			<input type="hidden" name="id_documento" value="<%=id_documento%>">
                   		
	                        <button type="submit" class="btn btn-lg btn-success btn-block" >
	                        	Guardar Imagen   <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
	                        </button>
        				</form>
        		
        		</div>
				<div class="col-md-4"></div>
			</div>
	</div>
	  
        
     
    
</body>
</html>