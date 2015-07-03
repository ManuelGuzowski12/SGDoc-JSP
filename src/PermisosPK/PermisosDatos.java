package PermisosPK;
import java.util.LinkedList;
import java.sql.*;

import Modulos.Modulos;


public class PermisosDatos {
	public static Connection CrearConexion(){
		try {
			
			@SuppressWarnings("unused")
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			return con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SGdoc","root","");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static LinkedList<Permisos> getPermisosPadres(String usuarioId){
		
		LinkedList<Permisos> listapermisos = new LinkedList<Permisos>();
	      Connection conexion = CrearConexion();
	      
	      try
	      {
	    	 
	         Statement st = conexion.createStatement();
	         ResultSet rs = st.executeQuery("select um.* from user_mod as um inner join modulos as m on um.id_usuario = '"+ usuarioId +"' and um.id_modulo = m.id_modulo and m.id_padre = '0'" );
	         
	         while (rs.next())
	         {
	        	 Permisos permiso = new Permisos();
	        	 permiso.setUsuario(rs.getString("id_usuario"));
	        	 permiso.setModulo(rs.getString("id_modulo"));
	        	 permiso.setPermiso(rs.getString("permiso"));
	        	 listapermisos.add(permiso);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listapermisos;
		
	}
	public static LinkedList<Permisos> getPermisosHijos(String usuario, String padre){
		Connection conexion = CrearConexion();
		LinkedList<Permisos> listapermisos = new LinkedList<Permisos>();
	      try
	      {
	    	 
	         Statement st = conexion.createStatement();
	         ResultSet rs = st.executeQuery("select um.* from user_mod as um inner join modulos as m on um.id_usuario = '"+ usuario +"' and um.id_modulo = m.id_modulo and m.id_padre='"+padre+"'"  );
	         
	         while (rs.next())
	         {
	        	 Permisos permiso = new Permisos();
	        	 permiso.setUsuario(rs.getString("id_usuario"));
	        	 permiso.setModulo(rs.getString("id_modulo"));
	        	 permiso.setPermiso(rs.getString("permiso"));
	        	 listapermisos.add(permiso);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listapermisos;
	}
	public static void guardarPermisos(Permisos permiso){
		Connection conexion = CrearConexion();
			 try {
				 
		         PreparedStatement  st =conexion.prepareStatement("Update user_mod set permiso = ? where id_usuario = ? and id_modulo = ?");

				@SuppressWarnings("unused")
				String a;
				st.setString(1, a = permiso.getPermiso()? "1":"0");
				st.setString(2, permiso.getUsuario());
				st.setString(3, permiso.getModulo());
		        st.executeUpdate();

		         st.close();
		         conexion.close();
		         
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		 
		
	}
	public static void BorrarPermisos(Permisos permiso){
		Connection conexion = CrearConexion();
			 try {
				 
		         PreparedStatement  st =conexion.prepareStatement("Update user_mod set permiso = '0' where user_mod id_usuario = ? and id_modulo = ?");
				st.setString(1, permiso.getUsuario());
				st.setString(2, permiso.getModulo());
		        st.executeUpdate();
		         st.close();
		         conexion.close();
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		 
		
	}
	public static LinkedList<Permisos> permisos(String id_user){
		Connection conexion = CrearConexion();
		ResultSet rs=null;
		LinkedList<Permisos> lista = new LinkedList<Permisos>();
		 try {
			 
	         PreparedStatement  st =conexion.prepareStatement("SELECT * from user_mod where id_usuario = ?");

			
			st.setString(1, id_user);
	        rs = st.executeQuery();
	        while(rs.next()){
	        	Permisos p = new Permisos();
	        	p.setModulo(rs.getString("id_modulo"));
	
	        	lista.add(p);
	        }
	        rs.close();
	         st.close();
	         conexion.close();
	         
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 return lista;
	}
public static boolean TienePermisos(String id, String modulo){
		boolean tienepermisos = false;
		Connection conexion = CrearConexion();
		
		try {
			PreparedStatement st = conexion.prepareStatement("select * from user_mod where id_modulo = ? and id_usuario = ? and permiso = '1'");
			st.setString(1, modulo);
			st.setString(2, id);
			ResultSet rs= st.executeQuery();
			if(rs.next()){
				tienepermisos =true;
			}
			rs.close();
			st.close();
			conexion.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tienepermisos;
	}
}
