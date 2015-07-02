package GestionDocumental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class departamentos {

		private int id_dep;
		private String descripcion;
		
		public departamentos(){
			
			id_dep=0;
			descripcion="";
		
		}
		
		public int getIddep(){
			return id_dep;
		}
		
		public void setIddep(int id_dep){
			this.id_dep = id_dep;
		}
		
		public String getDescripcion(){
			return descripcion;
		}
		
		public void setDescripcion(String descripcion){
			this.descripcion = descripcion;
		}
		
		public ResultSet Recuperar() throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select id_dep, descripcion from departamentos";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
}
