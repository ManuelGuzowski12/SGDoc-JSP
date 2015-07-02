<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*, java.text.*"%> 
     <%@ page import= "adminFisica.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	 	Bodega bod = new  Bodega();
		
		String cap = request.getParameter("capacidad");
		int capacidad = Integer.parseInt(cap.trim());
		bod.setCapacidad(capacidad);
		
		String nombre = request.getParameter("nombre");
		bod.setNombre(nombre);
			
		String codigo = request.getParameter("codigo");
		bod.setCodigo(codigo);
		
		bod.CrearBodega();	
%>
<h3>Creado Correctamente</h3>
<a href=CrearBodega.jsp>Regresar</a>
</body>
</html>