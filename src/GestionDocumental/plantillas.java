package GestionDocumental;
import java.sql.*;

public class plantillas {

	private int id_plantilla;
	private int id_tipodoc;
	private String campo;
	private String descripcion;
	
	public plantillas()
	{
		id_plantilla = 0;
		id_tipodoc =0;
		campo = "";
		descripcion = "";
	}
	
	public int getIdplantilla()
	{
		return id_plantilla;
	}
	
	public void setIdplantilla(int id_plantilla)
	{
		this.id_plantilla = id_plantilla;
	}
	
	public int getIdtipodoc()
	{
		return id_tipodoc;
	}
	public void setIdtipodoc(int id_tipodoc)
	{
		this.id_tipodoc = id_tipodoc;
	}
	
	public String getCampo()
	{
		return campo;
	}
	public void setCampo(String campo)
	{
		this.campo = campo;
	}
	public String getDescripcion()
	{
		return descripcion;
	}
	public void setDescripcion(String descripcion)
	{
		this.descripcion = descripcion;
	}
	public ResultSet Plantilla() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select id_plantilla, campo, descripcion from plantillas where id_tipodoc = '"+getIdtipodoc()+"'";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
}
