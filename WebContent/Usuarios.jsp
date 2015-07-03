<%@page import="PermisosPK.PermisosDatos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" %>
<%@ page import = "UsuariosPK.*"%> 
<%@ page import = "Visuales.*"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/switchery.css" rel="stylesheet">
	<link href="./css/estilos.css" rel="stylesheet">
	<script src="js/md5.js" type="text/javascript"></script>
	<script src="js/switchery.js" type="text/javascript"></script>
	</head>
<body>
<div class="container-fluid">
	<div class="row">
	<%if(session.getAttribute("id")  != null) {
		session.setAttribute("id_modulo", request.getParameter("id_modulo"));
	%>
		<%if(PermisosDatos.TienePermisos(session.getAttribute("id").toString(), session.getAttribute("id_modulo"))){ %>
		<div class="col-md-4">
			<div class="box">
			<div><h4>Opciones</h4></div>
			<hr>
				<button type="button" class="btn btn-success" data-toggle="modal" data-target=".fade" onclick="limpiar('Log')">Agregar</button>
			</div>
		</div>
		<div class="col-md-8" style="overflow: overlay;height: 470px;">
			
	        <%LinkedList<Usuarios> lista = UsuariosDatos.getPersonas();
          for (int i=0;i<lista.size();i++)
          {%>
          	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	            <div class="box">
	                <div class="info" >
		                <div class="row">
		                	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			                <table class="table c">
				                <%
				                out.println("<tr>");
				                out.println("<td>"+lista.get(i).getIdPersona()+"</td>");
				                out.println("<td>"+lista.get(i).getnombre()+"</td>");
				                out.println("<td>"+lista.get(i).getapellido()+"</td>");
				                out.println("<td>"+lista.get(i).getdireccion()+"</td>");
				                out.println("<td>"+lista.get(i).getsexo()+"</td>");
				                out.println("<td><a  class='btn btn-success' onclick=\"show('Log','"+lista.get(i).getIdPersona()+"' )\">Editar</a></td>");
				                out.println("<td><a  class='btn btn-success' onclick=\"nuevoU('NuevoUsuario','"+lista.get(i).getIdPersona()+"')\">Usuario</a></td>");
				                
				                out.println("</tr>");
				                %>
		                    </table>
		                </div>
	                </div>
	            </div>
	        </div>
          <%} %>
		</div>
		<%}else{
		%>
		<div class="container">
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 card card-fondo">
			<div class="alert alert-danger" role="alert">
			<center><p><h4>Usted No Tiene Permisos Para Ejecutar Esta Instruccion</h4>
				<a class="btn btn-success" href="./Login.jsp">Login</a>
			</p></center>
			
			</div>
		</div>
		</div>
		</div>
		
		<%}%>
	
	<%}else{%>
		<div class="container">
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 card card-fondo">
			<div class="alert alert-danger" role="alert">
			<center><p><h4>Usted No Tiene Permisos Para Ejecutar Esta Instruccion</h4>
				<a class="btn btn-success" href="./Login.jsp">Login</a>
			</p></center>
			
			</div>
		</div>
		</div>
		</div>
	<%}%>
	
	</div>
</div>
<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#e2e2e2">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
         
					<form action="guardarUsuario.jsp" method="post" name="Log" class="form"> 
					      <input type="hidden" name="clave" value=""/>
					     <input type="hidden" name="u" value=""/>
						  <%=UsuariosDatos.crearFormulario()
						  %> 
						 
						    			
          </div>
        </div>
        <div class="modal-footer">
        <button class="btn btn-primary"  name="Submit" value="Login" onclick="Md5edit('Log')">Guardar</button>		
					</form>	
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  <div class="modal nuevo" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
         
					<form action="guardarUsuario.jsp" method="post" name="NuevoUsuario" class="form"> 
					 	<label class='control-label'>Id:</label>
			 			<input type='text' class='form-control' name='id' placeholder='' required autofocus=''/>
			 			<label class='control-label'>Nombre de Usuario:</label>
			 			<input type='text' class='form-control' name='nick' placeholder='Ejemplo: Juan56' required autofocus=''/>
			 			<label class='control-label'>Contrase�a:</label>
			 			<input type='password' class='form-control' name='pass' placeholder='' required autofocus=''/>
			 			<label class='control-label'>activo:</label><input type="checkbox"  name="chk" class="js-switch"/>
			    			
          </div>
        </div>
        <div class="modal-footer">
        <button class="btn btn-primary"  name="Submit" value="Login" type="Submit" onclick="">Guardar</button>		
					</form>	
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/nuevo.js"></script>
</body>
</html>