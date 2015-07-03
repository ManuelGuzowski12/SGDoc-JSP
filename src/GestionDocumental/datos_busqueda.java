package GestionDocumental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class datos_busqueda {

		private int id_busqueda;
		private int id_documento;
		private int id_plantilla;
		private String valor;
		
		public datos_busqueda(){
			id_busqueda = 0;
			id_documento = 0;
			id_plantilla = 0;
			valor = "";
		}
		
		public int getIdbusqueda(){
			return id_busqueda;
		}
		public void setIdbusqueda(int id_busqueda){
			this.id_busqueda = id_busqueda;
		}
		public int getIddocumento(){
			return id_documento;
		}
		public void setIddocumento(int id_documento){
			this.id_documento = id_documento;
		}
		public int getIdplantilla(){
			return id_plantilla;
		}
		public void setIdplantilla(int id_plantilla){
			this.id_plantilla = id_plantilla;
		}
		public String getValor(){
			return valor;
		}
		public void setValor(String valor){
			this.valor = valor;
		}
		
		public void Almacenar() throws ClassNotFoundException, SQLException
		{
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = "insert into datos_busqueda (id_documentos, id_plantilla, valor) "; 
			query+= "values ('"+ getIddocumento()+"','"+ getIdplantilla()+"','" +getValor()+"')";
			st.executeUpdate(query);
			
		}
		
		public ResultSet GetCampos() throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " SELECT * FROM Plantilla WHERE id_plantilla = '"+getIdplantilla()+"'";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
		
	
}
