<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "UsuariosPK.*"%> 
<%@ page import = "Visuales.*"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.LinkedList"%>
<%@page import="org.json.simple.*"%>

<%LinkedList<Usuarios> lista = UsuariosDatos.getUsuariosID(request.getParameter("id"));
for (int i=0;i<lista.size();i++)
{
   JSONObject obj=new JSONObject();
   obj.put("id_persona",lista.get(i).getIdPersona());
   obj.put("nombre",lista.get(i).getnombre());
   obj.put("apellido",lista.get(i).getapellido());
   obj.put("direccion",lista.get(i).getdireccion());
   obj.put("sexo",lista.get(i).getsexo());
   obj.put("nick",lista.get(i).getnick());
   obj.put("pass",lista.get(i).getpass());
   out.print(obj);
   out.flush();
}%> 
