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
	Cajas caja = new Cajas();
	departamentos depto = new departamentos();
	Binding_caja binc = new Binding_caja();
	Tipos tipo = new Tipos();
	
	 int idcaja;
	 int iddep;
	 int cap;
	 int tipc;
	 int cont;
	
	String bin = request.getParameter("id_binding");
	int id_binding = Integer.parseInt(bin.trim());
	binc.setId_binding(id_binding);
	
	
	String caj = request.getParameter("id_caja");
	int id_caja = Integer.parseInt(caj.trim());
	binc.setId_caja(id_caja);
	 
		
	String id_user = request.getParameter("id_usuario");
	int id_usuario = Integer.parseInt(id_user.trim());
	binc.setId_usuario(id_usuario);
		
	String fecha = request.getParameter("fecha");
	binc.setFecha_insert(fecha);
	
	
	idcaja = caja.GetId_dep(id_caja);
	iddep = binding.GetId_dep(id_binding);
	//----------------------------------
	tipc = tipo.Get_tipcaja(id_caja);
	cap = tipo.RecuperarcapC(tipc);
	cont = binc.count(id_caja);
	
	if((idcaja == iddep) && (cont < cap ))
	{
		binc.insertBinding_caja();
		out.println("<h3>Creado Correctamente</h3>");
		out.println(cont);
		out.println(cap);
	}
	else
		out.println("<b>Inserte en departamento indicado o en una caja que tenga espacio</b>");
		
	%>
	
	<a href=FormBC.jsp>Regresar</a>
</body>
</html>