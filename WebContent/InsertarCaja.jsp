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
	 	Cajas caja = new  Cajas();
	
	
		String tip = request.getParameter("tipo_caja");
		int id_tipo = Integer.parseInt(tip.trim());
		caja.setId_tipo(id_tipo);
				
		String dep = request.getParameter("id_dep");
		int id_dep = Integer.parseInt(dep.trim());
		caja.setId_dep(id_dep);
			
		String codigo = request.getParameter("codigo");
		caja.setCodigo(codigo);
		
		caja.CrearCaja();
		
%>
<h3>Creado Correctamente</h3>
<a href=CrearCaja.jsp>Regresar</a>
</body>
</html>