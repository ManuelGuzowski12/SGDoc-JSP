<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "UsuariosPK.*"%> 

<%@ page import = "PermisosPK.*"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.LinkedList"%>
<%@ page import = "Modulos.*" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/switchery.css" rel="stylesheet">
	<link href="css/estilos.css" rel="stylesheet">
	<script src="js/md5.js" type="text/javascript"></script>
	<script src="js/switchery.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<form action="guardarPermisos.jsp">
	<div class="row">
		<div class="col-md-4">
			<div class="box">
			<div><h4>Opciones</h4></div>
			<hr>
			<button type="submit" class="btn btn-success">Guardar</button>	
			<input type="hidden" name="id_usuario" value="<%= request.getParameter("id")%>"/>
			</div>
		</div>
		<div class="col-md-8" style="overflow: overlay;height: 470px;">
			
	        <%LinkedList<Permisos> lista = PermisosDatos.getPermisosPadres(request.getParameter("id"));
	        for (int i=0;i<lista.size();i++){%>
          	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	            <div class="box">
	                <div class="info" >
	                		<div class="col-md-11"><%
	                			LinkedList<Modulos> mod = ModulosDatos.getModuloById(lista.get(i).getModulo());
					        	out.println("<h4>"+ mod.get(0).getnombre() +"</h4>");
					        %>
					        </div>
					        <div class="col-md-1" >
					        <input type="checkbox" value="<%=lista.get(i).getModulo() %>" name="chk" class="js-switch" onclick="buscachk(this)" <%if(lista.get(i).getPermiso()){out.print("checked");} %>/>
					        </div>
		                <div class="row">
		                	<% LinkedList<Permisos> pHijos = PermisosDatos.getPermisosHijos(request.getParameter("id"), lista.get(i).getModulo());
					        	for(int x = 0;x<pHijos.size();x++){%>
					        		<div class="col-md-3"><label><%LinkedList<Modulos> modHijo = ModulosDatos.getModuloById(pHijos.get(x).getModulo());
					        	out.println(""+ modHijo.get(0).getnombre() +"");%></label>
					        		<input type="checkbox" value="<%=pHijos.get(x).getModulo() %>" name="chk" class="js-switch" onclick="buscachk(this)" <%if(pHijos.get(x).getPermiso()){out.print("checked");} %>/>
					        		
					        	<% 
					            LinkedList<Permisos> pHijos2 = PermisosDatos.getPermisosHijos(request.getParameter("id"), pHijos.get(x).getModulo());
					        	for(int y = 0;y<pHijos2.size();y++){
					        		out.println();
					        		
					        		%>
					        		<div class="panel-header"><label><%LinkedList<Modulos> modHijo2 = ModulosDatos.getModuloById(pHijos2.get(y).getModulo());
					        	out.println(""+ modHijo2.get(0).getnombre() +"");%></label>
					        		<input type="checkbox" value="<%=pHijos2.get(y).getModulo() %>" name="chk" class="js-switch" onclick="buscachk(this)" <%if(pHijos2.get(y).getPermiso()){out.print("checked");} %>/>
					        		
					        		
					        	</div>
					        	<% 
					        	}%>
					        	</div>
					        	<% 
					        	}%>
		                </div>
	                </div>
	            </div>
	        </div>
          <%} %>
		</div>
		
	</div>

<div class="row">
<div class="col-md-4 col-offset-4">

</div>
</div>
</form>
</div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});

</script>
</body>
</html>