<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*, java.text.*"%> 
     <%@ page import= "GestionDocumental.*" %>
     <%@ page import= "adminFisica.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	 //Tipo_binding tipo = new Tipo_binding();
	// departamentos depto = new departamentos();
	Binding binding = new  Binding();
	
	
		String tip = request.getParameter("tipo_Binding");
		int id_tipo = Integer.parseInt(tip.trim());
		binding.setId_tipo(id_tipo);
				
		String dep = request.getParameter("id_dep");
		int id_dep = Integer.parseInt(dep.trim());
		binding.setId_dep(id_dep);
			
		String codigo = request.getParameter("codigo");
		binding.setCodigo(codigo);
		
		binding.CrearBinding();
		
%>
<h3>Creado Correctamente</h3>
<a href=CrearBinding.jsp>Regresar</a>
	
</body>
</html>