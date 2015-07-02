package GestionDocumental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class documentos {

		private int id_documento;
		private String fecha_creacion;
		private int id_usuario;
		private int activacion;
		private String nombre;
		private int id_dep;
		public documentos(){
			
			id_documento=0;
			fecha_creacion ="";
			id_usuario=0;
			activacion=0;
			id_dep=0;
			nombre="";
		}
		
		public int getIddocumento(){
			
			return id_documento;
		}
		public void setIddocumento(int id_documento){
			
			this.id_documento = id_documento;
		}
		public String getFecha(){
			
			return fecha_creacion;
		}
		public void setFecha(String fecha_creacion){
			
			this.fecha_creacion = fecha_creacion;
		}
		public int getIdusuario(){
			
			return id_usuario;
		}
		public void setIdusuario(int id_usuario){
			
			this.id_usuario = id_usuario;
		}
		public int getActivacion(){
			
			return activacion;
		}
		public void setActivacion(int activacion){
			
			this.activacion = activacion;
		}
		public int getIddep(){
			
			return id_dep;
		}
		public void setIddep(int id_dep){
			
			this.id_dep = id_dep;
		}
		public String getNombre(){
			return nombre;
		}
		public void setNombre(String nombre){
			this.nombre = nombre;
		}
		
		public ResultSet Recuperar() throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select * from documentos";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
		
		public void Almacenar() throws ClassNotFoundException, SQLException
		{
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = "insert into documentos (fecha_creacion, id_usuario, activacion, nombre, id_dep) "; 
			query+= "values ('"+ getFecha()+"','" +getIdusuario()+ "','" +getActivacion()+ "','"+getNombre()+"','"+getIddep()+"')";
			st.executeUpdate(query);
			
			GetId();
			
			st.close();
			con.close();
			
		}
		public void GetId() throws ClassNotFoundException, SQLException
		{
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = "SELECT id_documento FROM documentos ORDER BY id_documento DESC LIMIT 1";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()){
				
				setIddocumento(rs.getInt(1));
			}
			
			st.close();
			con.close();
		}
		
		public ResultSet Buscar() throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select id_documento, fecha_creacion, nombre from documentos where activacion=1 ";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
		
		
}
