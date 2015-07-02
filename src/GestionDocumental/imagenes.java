package GestionDocumental;
import java.sql.*;
public class imagenes {
	
	private int id_documento;
	private Blob imagen;
	
	public imagenes(){
		
		id_documento=0;
		imagen = null;
	}

	public int getIddocumento(){
		return id_documento;
	}
	
	public void setIddocumento(int id_documento){
		this.id_documento = id_documento;
	}
	
	public Blob getImagen(){
		return imagen;
	}
	
	public void setImagen(Blob imagen){
		
		this.imagen = imagen;
	}
	
	public ResultSet Recuperar() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select imagen from imagenes where id_documento = '"+getImagen()+"'";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
}
