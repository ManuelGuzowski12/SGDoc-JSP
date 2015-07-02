package adminFisica;
import java.sql.*;
public class Cajas {
	private int id_caja;
	private int id_tipo;
	private int id_dep;
	private String codigo;
	//constructor
	public Cajas(){
		id_caja = 0;
		id_tipo = 0;
		id_dep = 0;
		codigo = "";
	}
	
	public int getId_caja()
	{
		return id_caja;
	}
	public void setId_caja(int id_caja)
	{
		this.id_caja = id_caja;
	}
	
	public int getId_tipo()
	{
		return id_tipo;
	}
	public void setId_tipo(int id_tipo)
	{
		this.id_tipo = id_tipo;
	}
	public int getId_dep()
	{
		return id_dep;
	}
	public void setId_dep(int id_dep)
	{
		this.id_dep = id_dep;
	}
	public String getCodigo()
	{
		return codigo;
	}
	public void setCodigo(String codigo)
	{
		this.codigo = codigo;
	}
	
	//insertar la caja
	public void CrearCaja () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into cajas ( id_tipo, id_dep, codigo) values ('"+getId_tipo() +"','" +getId_dep()+ "','" +getCodigo()+"')";
		st.executeUpdate(query); 
		
	}
	//recupera el id de la caja y el codigo para mostrar en el dropdown
	public ResultSet Recuperar() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select id_caja, codigo from cajas";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	//recupera las cajas que no esta aun guardados en el pivote
		public ResultSet Recuperarcaj() throws ClassNotFoundException, SQLException
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select id_caja, codigo from cajas where id_caja not in (select id_caja from cajas_racks)";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
	
	//recupera el id del depto y lo compara con el id de la caja
	public int GetId_dep(int iddep) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "SELECT id_dep FROM cajas where id_caja ='"+iddep+"'";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
			iddep = rs.getInt(1);
		}
		
		return iddep;
	}		
	
	
	
	
}
