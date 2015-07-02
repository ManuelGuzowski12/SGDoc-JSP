package adminFisica;
import java.sql.*;
public class Doc_binding {
	private int id_documento;
	private int id_binding;
	private String fecha_insert;
	private int id_usuario;
	
	public Doc_binding(){
		id_documento = 0;
		id_binding = 0;
		fecha_insert = "";
		id_usuario = 0;
	}
	
	public int getId_documento() 
	{
		return id_documento;
	}
	public void setId_documento(int id_documento)
	{
		this.id_documento = id_documento;
	}
	public int getId_binding()
	{
		return id_binding;
	}
	public void setId_binding(int id_binding)
	{
		this.id_binding = id_binding;
	}
	public String getFecha_insert()
	{
		return fecha_insert;
	}
	public void setFecha_insert(String fecha_insert)
	{
		this.fecha_insert = fecha_insert;
	}
	public int getId_usuario()
	{
		return id_usuario;
	}
	public void setId_usuario(int id_usuario)
	{
		this.id_usuario = id_usuario;
	}
	
	public void insertDocBinding () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into doc_binding ( id_documento, id_binding, fecha_insert, id_usuario) values ('"+ getId_documento() + "','" + getId_binding() + "','" + getFecha_insert() +"','" + getId_usuario() +"')";
		st.executeUpdate(query); 
		
	}
	
	//cuanta cuantos cuantos registros hay con un binding del id que le envio
	
	public int count(int id_binding) throws ClassNotFoundException, SQLException
	{
		
	int cont = 0;
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " SELECT COUNT(*) FROM doc_binding where id_binding = '"+id_binding+"'";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
			cont = rs.getInt(1);
		}
		
		return cont; 
	}
	
}
