<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "UsuariosPK.*"%> 
<%@ page import = "PermisosPK.*"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	
	String[] n = request.getParameterValues("chk");
	LinkedList<Permisos> lista = PermisosDatos.permisos(request.getParameter("id_usuario"));
	
	if(n != null){
		for(int i = 0; i <n.length;i++){
			for(int x= 0;x < lista.size();x++){
				if(lista.get(x).getModulo().equals(n[i])){
					Permisos permiso = new Permisos();
					permiso.setModulo(lista.get(x).getModulo());
					permiso.setUsuario(request.getParameter("id_usuario"));
					permiso.setPermiso("1");
					PermisosDatos.guardarPermisos(permiso);
					lista.remove(x);
				}else{
					Permisos permiso = new Permisos();
					permiso.setModulo(lista.get(x).getModulo());
					permiso.setUsuario(request.getParameter("id_usuario"));
					permiso.setPermiso("0");
					PermisosDatos.guardarPermisos(permiso);
				}
				
			}
		}
	}else{
		
			for(int x= 0; x < lista.size();x++){
				Permisos permiso = new Permisos();
				permiso.setModulo(lista.get(x).getModulo());
				permiso.setUsuario(request.getParameter("id_usuario"));
				permiso.setPermiso("0");
				PermisosDatos.guardarPermisos(permiso);
			}
		
	}
		
		
		response.sendRedirect("./PermisosUsuarios.jsp?id="+ request.getParameter("id_usuario")+"");
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>