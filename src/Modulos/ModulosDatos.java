package Modulos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.sql.*;
public class ModulosDatos {
	public static Connection CrearConexion(){
		try {
			
			@SuppressWarnings("unused")
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			return con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SGdoc","root","12345");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static LinkedList<Modulos> getModuloById(String id){
		LinkedList<Modulos> lista = new LinkedList<Modulos>();
		Connection conexion = CrearConexion();
		
		try {
			PreparedStatement st = conexion.prepareStatement("select * from modulos where id_modulo = ?");
			st.setString(1, id);
			ResultSet rs= st.executeQuery();
			while(rs.next()){
				Modulos mod = new Modulos();
				mod.setid(rs.getString("id_modulo"));
				mod.setnombre(rs.getString("nombre"));
				mod.setdesc(rs.getString("descripcion"));
				mod.setUrl(rs.getString("url"));
				mod.setidPadre(rs.getString("id_padre"));
				lista.add(0,mod);
			}
			rs.close();
			st.close();
			conexion.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lista;
	}
	public static LinkedList<Modulos> getModuloUsuarioTodos(String id){
		LinkedList<Modulos> lista = new LinkedList<Modulos>();
		Connection conexion = CrearConexion();
		
		try {
			PreparedStatement st = conexion.prepareStatement("select * from modulos where id_modulo = any(select id_modulo from user_mod where id_usuario = ? and permiso = 1)");
			st.setString(1, id);
			ResultSet rs= st.executeQuery();
			while(rs.next()){
				Modulos mod = new Modulos();
				mod.setid(rs.getString("id_modulo"));
				mod.setnombre(rs.getString("nombre"));
				mod.setdesc(rs.getString("descripcion"));
				mod.setUrl(rs.getString("url"));
				mod.setidPadre(rs.getString("id_padre"));
				lista.add(mod);
			}
			rs.close();
			st.close();
			conexion.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lista;
	}
	
	
	
}
