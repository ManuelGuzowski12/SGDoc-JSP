<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.*" %>
    <%@ page import="UsuariosPK.*" %>
    
    <%
    	Usuarios usuario = new Usuarios();
    	usuario.setIdPersona(request.getParameter("id_persona"));
    	usuario.setnombre(request.getParameter("nombre"));
    	usuario.setapellido(request.getParameter("apellido"));
    	usuario.setdireccion(request.getParameter("direccion"));
    	usuario.setsexo(request.getParameter("sexo"));
    	UsuariosDatos.insertar(usuario);
    	usuario.setIdPersona(request.getParameter("id_persona"));
    	usuario.setnick(request.getParameter("nick"));
    	usuario.setpass(request.getParameter("pass"));
    	UsuariosDatos.nuevoUsuario(usuario);
    	response.sendRedirect("./Usuarios.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
</html>