<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
 <%@ page import= "GestionDocumental.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	documentos doc = new documentos();
	datos_busqueda datos = new datos_busqueda();
	plantillas plantilla = new plantillas();
	String nombre_doc = request.getParameter("nombre");
		doc.setNombre(nombre_doc);
	
	DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
	String date = fecha.format(new java.util.Date());
		doc.setFecha(date);
	
	String username = request.getParameter("username");
	int  id_usuario = Integer.parseInt(username.trim());
		doc.setIdusuario(id_usuario);
		
	int activacion =1;
	doc.setActivacion(activacion);
	
	String dep = request.getParameter("id_dep");
	int id_dep = Integer.parseInt(dep.trim());
	doc.setIddep(id_dep);
		
	doc.Almacenar();
	int id_documento = doc.getIddocumento();
	String tipo = request.getParameter("tipodoc");
	int id_tipodoc = Integer.parseInt(tipo.trim());
	
	plantilla.setIdtipodoc(id_tipodoc);
	ResultSet rs = plantilla.Plantilla();
	String valor = "";
	while(rs.next())
	{
		datos.setIddocumento(id_documento);
		datos.setIdtipo(id_tipodoc);
		valor = request.getParameter(rs.getString(1));
		datos.setValor(valor);
		datos.Almacenar();
	}
	
	response.sendRedirect("imagen.jsp");
	
%>
	
</body>
</html>