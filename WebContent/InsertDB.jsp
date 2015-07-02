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
	Binding binding = new  Binding();
	documentos doc = new documentos();
	departamentos depto = new departamentos();
	Doc_binding docb = new Doc_binding();
	Tipos tipo = new Tipos();
	
	 int iddoc;
	 int iddep;
	 int cap;
	 int tipb;
	 int cont;
	
	String docu = request.getParameter("id_documento");
	int id_documento = Integer.parseInt(docu.trim());
	docb.setId_documento(id_documento);
	
	
	
	String bin = request.getParameter("id_binding");
	int id_binding = Integer.parseInt(bin.trim());
	docb.setId_binding(id_binding);
	 
		
		
	String fecha = request.getParameter("fecha");
	docb.setFecha_insert(fecha);
	
	String id_user = request.getParameter("id_usuario");
	int  id_usuario = Integer.parseInt(id_user.trim());
		docb.setId_usuario(id_usuario);
	
	iddoc = doc.GetId_dep(id_documento);
	iddep = binding.GetId_dep(id_binding);
	//--------------------------------------
	tipb = tipo.Get_tipbing(id_binding);
	cap = tipo.Recuperarcap(tipb);
	cont = docb.count(id_binding);
	
	if((iddoc == iddep) && (cont < cap ))
	{
		docb.insertDocBinding();
		out.println("<h3>Creado Correctamente</h3>");
		out.println(cont);
		out.println(cap);
	}
	else
		out.println("<b>Inserte en departamento indicado o en un binding que tenga espacio</b>");
		
	%>
	
	<a href=FormDB.jsp>Regresar</a>
</body>
</html>