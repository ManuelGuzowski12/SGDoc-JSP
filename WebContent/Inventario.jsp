<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="org.json.simple.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/service.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<form name="formulario">
	<input type="text" class="form-control"  name="idinv" placeholder="ID Inventario">
	<input type="text" class="form-control" id="id" name="marca" placeholder="Marca">
	<input type="text" class="form-control" id="id" name="modelo" placeholder="Modelo">
	<input type="text" class="form-control" id="id" name="descripcion" placeholder="Descripcion">
	<input type="text" class="form-control" id="id" name="serie" placeholder="Serie">
	<input type="button" value="guardar" onclick="Insertar('formulario')">

</form>
</body>
</html>