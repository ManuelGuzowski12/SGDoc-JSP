package UsuariosPK;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.sql.*;


public class UsuariosDatos {
	
	
	@SuppressWarnings("unused")
	public static Connection CrearConexion(){
		try {
			
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			return con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SGdoc","root","12345");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	 public static LinkedList<Usuarios> getUsuarios()
	   {
	      LinkedList<Usuarios> listaUsuarios = new LinkedList<Usuarios>();
	      Connection conexion = CrearConexion();
	      
	      try
	      {
	    	 
	         Statement st = conexion.createStatement();
	         ResultSet rs = st.executeQuery("select p.*, u.id_usuario,u.username,u.password from personas as p inner join usuarios as u on p.id_persona = u.id_persona " );
	         
	         while (rs.next())
	         {
	        	Usuarios usuario = new Usuarios();
	            usuario.setIdPersona(rs.getString("id_persona"));
	            usuario.setnombre(rs.getString("nombre"));
	            usuario.setapellido(rs.getString("apellido"));
	            usuario.setdireccion(rs.getString("direccion"));
	            usuario.setsexo(rs.getString("sexo"));
	            usuario.setId(Integer.parseInt(rs.getString("id_usuario")));
	            usuario.setnick(rs.getString("username"));
	            usuario.setpass(rs.getString("password"));
	            usuario.setId(rs.getInt("id_usuario"));
	            
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
	 public static LinkedList<Usuarios> getPersonas()
	   {
	      LinkedList<Usuarios> listaUsuarios = new LinkedList<Usuarios>();
	      Connection conexion = CrearConexion();
	      
	      try
	      {
	    	 
	         Statement st = conexion.createStatement();
	         ResultSet rs = st.executeQuery("select * from personas p, usuarios u where u.id_persona=p.id_persona " );
	         
	         while (rs.next())
	         {
	        	Usuarios usuario = new Usuarios();
	            usuario.setIdPersona(rs.getString("id_persona"));
	            usuario.setnombre(rs.getString("nombre"));
	            usuario.setapellido(rs.getString("apellido"));
	            usuario.setdireccion(rs.getString("direccion"));
	            usuario.setsexo(rs.getString("sexo"));
	            usuario.setnick(rs.getString("username"));
	            usuario.setpass(rs.getString("password"));
	            usuario.setId(rs.getInt("id_usuario"));
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
	 public static LinkedList<Usuarios> getUsuariosID(String id)
	   {
	      LinkedList<Usuarios> listaUsuarios = new LinkedList<Usuarios>();
	      Connection conexion = CrearConexion();
	      
	      try
	      {
	    	 
	         Statement st = conexion.createStatement();
	         ResultSet rs = st.executeQuery("select * from personas p inner join usuarios u on p.id_persona = u.id_persona and u.id_persona= '"+ id +"'" );
	         
	         while (rs.next())
	         {
	        	Usuarios usuario = new Usuarios();
	            usuario.setIdPersona(rs.getString("id_persona"));
	            usuario.setnombre(rs.getString("nombre"));
	            usuario.setapellido(rs.getString("apellido"));
	            usuario.setdireccion(rs.getString("direccion"));
	            usuario.setsexo(rs.getString("sexo"));
	            usuario.setnick(rs.getString("username"));
	            usuario.setpass(rs.getString("password"));
	            
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
	 public static void insertar(Usuarios usuario){
		 Connection conexion = CrearConexion();
		 if(existe(usuario.getIdPersona())){
			 try {
				 
		         PreparedStatement  st =conexion.prepareStatement("Update personas set nombre = ?, apellido=?, direccion = ?, sexo = ?, telefono = ? where id_persona = ?");
		        st.setString(6,usuario.getIdPersona());
		        st.setString(1,usuario.getnombre());
		        st.setString(2,usuario.getapellido());
		        st.setString(3,usuario.getdireccion());
		        st.setString(4,usuario.getsexo());
		        st.setString(5,"");
		        st.executeUpdate();
		         
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		 }else{
		 try {
			 
	         PreparedStatement  st =conexion.prepareStatement("Insert into personas values(?,?,?,?,?,?)");
	        st.setString(1,usuario.getIdPersona());
	        st.setString(2,usuario.getnombre());
	        st.setString(3,usuario.getapellido());
	        st.setString(4,usuario.getdireccion());
	        st.setString(5,usuario.getsexo());
	        st.setString(6,"");
	        st.executeUpdate();
	         
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 }
		
		 
	 }
	 public static boolean Auth(String user, String pass) throws SQLException{
		 ResultSet res = null;
		 Connection conexion = CrearConexion();
		 try {
			 
	         PreparedStatement  st =conexion.prepareStatement("Select * from Usuarios Where username=? and password=?");
	         st.setString(1, user);
	         st.setString(2, pass);
	        res = st.executeQuery();
	        if(res.next()){
				 return true;
			 }else{
				 return false;
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 return false;
		 
	 }

	public static String buscarId(String user, String pass){
		 Connection conexion = CrearConexion();
		 String id="";
		 try {
			 PreparedStatement  st =conexion.prepareStatement("Select * from Usuarios Where username=? and password=?");
	         st.setString(1, user);
	         st.setString(2, pass);
	        ResultSet res = st.executeQuery();
	        while(res.next()){
	        	id = res.getString("id_usuario");
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return id;
	 }
	 public  static Usuarios cargarDatos(ResultSet res) throws Exception{
		 Usuarios usuario = new Usuarios();
		 while(res.next()){
			 usuario.setId(Integer.parseInt(res.getString(0)));
			 usuario.setnick(res.getString(1));
			 usuario.setIdPersona(res.getString(2));
		 }
		 return usuario; 
	 }
	 public static String crearFormulario(){
		 String Formulario="";
		 Formulario+="<label class='control-label'>Identificador Personal:</label>";
		 	Formulario+="<input type='text' class='form-control' name='id_persona' placeholder='Cedula' required='' autofocus='' /></br>";
		 	Formulario+="<label class='control-label'>Nombre de Usuario:</label><input type='text' class='form-control' name='nick' placeholder='Ejemplo: Juan56' required autofocus=''/><label class='control-label'>Contraseña:</label><input type='password' class='form-control' name='pass' placeholder='' required autofocus=''/>";
		 	Formulario+="<label class='control-label'>Nombre:</label>";
		 	Formulario+="<input type='text' class='form-control' name='nombre' placeholder='Nombre' required='' autofocus='' /></br>";
		 	Formulario+="<label class='control-label'>Apellido:</label>";
		 	Formulario+="<input type='text' class='form-control' name='apellido' placeholder='Apellido' required='' autofocus='' />";
		 	Formulario+="<label class='control-label'>Dirección:</label>";
		 	Formulario+="<input type='text' class='form-control' name='direccion' placeholder='Dirección' required='' autofocus='' /><br>";
		 	Formulario+="<label class='control-label'>Sexo:</label>";
		 	Formulario+="<select class='form-control' name='sexo' required='' autofocus=''><option value='F'>Femenino</option><option value='M'>Masculino</option></select>";
		 	Formulario+="<label class='control-label'>activo:</label><input type='checkbox'  name='chk' class='js-switch'/>";
		 	
		 	return Formulario;
	 }
	 public static String crearFormulario(String id) throws Exception{
		 ResultSet d = null;
		 String Formulario="<div class='col-md-8'>";
		 Connection conexion = CrearConexion();
		 try {
			 
	         PreparedStatement  st =conexion.prepareStatement("Select * from personas Where id_persona=?");
	         st.setString(1, id);
	         
	       d = st.executeQuery();
	         
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 while(d.next()){
			 Formulario+="<label class='control-label'>Identificador Personal:</label>";
			 	Formulario+="<fieldset disabled><input type='text' class='form-control' name='id_persona' placeholder='Cedula' required='' autofocus='' value='"+ d.getString("id_persona")+"' id='disabledInput'/></fieldset></br>";
			 	Formulario+="<label class='control-label'>Nombre:</label>";
			 	Formulario+="<input type='text' class='form-control' name='nombre' placeholder='Nombre' required='' autofocus='' value='"+ d.getString("nombre")+"'/></br>";
			 	Formulario+="<label class='control-label'>Apellido:</label>";
			 	Formulario+="<input type='text' class='form-control' name='apellido' placeholder='Apellido' required='' autofocus='' value='"+ d.getString("apellido")+"'/>";
			 	Formulario+="<label class='control-label'>Dirección:</label>";
			 	Formulario+="<input type='text' class='form-control' name='direccion' placeholder='Dirección' required='' autofocus='' value='"+ d.getString("direccion")+"'/><br>";
			 	Formulario+="<label class='control-label'>Sexo:</label>";
			 	if(d.getString("sexo").equals("M")){
			 		Formulario+="<select class='form-control' name='sexo' placeholder='Sexo F/M' required='' autofocus=''><option value='F'>Femenino</option><option value='M' selected='selected'>Masculino</option></select>";
			 	}else{
			 		if(d.getString("sexo").equals("F")){
				 	Formulario+="<select class='form-control' name='sexo' placeholder='Sexo F/M' required='' autofocus=''><option value='F' selected='selected'>Femenino</option><option value='M'>Masculino</option></select>";
			 		}else{
			 			Formulario+="NOOOOOOOO";
				 		
			 		}
			 	}
			 	
		 }
		 return Formulario+="</div>";
	 }
	 
	 public static boolean existe(String id){
		 Connection conexion = CrearConexion();
		 ResultSet rs = null;
		 boolean existe = false;
		try {
			
		         PreparedStatement  st =conexion.prepareStatement("Select * from personas Where id_persona=?");
		         st.setString(1, id);
		         rs = st.executeQuery();
		         while(rs.next()){
		        	 existe = true;
		         }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return existe;
	 }
	 public static void nuevoUsuario(Usuarios usuario){
		 Connection conexion = CrearConexion();
		if (existe(usuario.getIdPersona()) && esUsuario(usuario.getIdPersona())){
			try {
				
		         PreparedStatement  st =conexion.prepareStatement("update usuarios set username= ?,password = ? where id_persona = ?");
		         st.setString(1, usuario.getnick());
		         st.setString(3, usuario.getIdPersona());
		         st.setString(2, usuario.getpass());
		         
		        st.executeUpdate();
		        
		        st.close();
		         
		         conexion.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}else{
			try {
				
		         PreparedStatement  st =conexion.prepareStatement("insert into usuarios(username,id_persona,password,activo) values(?,?,?,?)");
		         st.setString(1, usuario.getnick());
		         st.setString(2, usuario.getIdPersona());
		         st.setString(3, usuario.getpass());
		         st.setString(4, "1");
		        st.executeUpdate();
		        setearPermisos(usuario.getIdPersona());
		        
		        st.close();
		         
		         conexion.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
		 
	 }
	 public static void setearPermisos(String id){
		 Connection conexion = CrearConexion();
		 
		 try {
			 Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from usuarios where id_persona = '"+id+"'");
		        
		        while(rs.next()){
		        	 
			         st.executeUpdate("insert into user_mod(id_usuario,id_modulo,permiso)select '"+ rs.getString("id_usuario") +"',id_modulo,'0' from  modulos");
			         
		         }
		        st.close();
		         rs.close();
		         conexion.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	 }
	 public static boolean esUsuario(String id){
		 Connection conexion = CrearConexion();
		 ResultSet rs = null;
		 boolean existe = false;
		try {
			
		         PreparedStatement  st =conexion.prepareStatement("Select * from usuarios Where id_persona=?");
		         st.setString(1, id);
		         rs = st.executeQuery();
		         while(rs.next()){
		        	 existe = true;
		         }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return existe;
	 }

}
