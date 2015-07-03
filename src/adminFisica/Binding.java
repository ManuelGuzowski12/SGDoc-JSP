package adminFisica;
import java.sql.*;
public class Binding {
	private int id_binding;
	private int id_tipo;
	private int id_dep;
	private String codigo;
	
	//constructor
			public Binding(){
				id_binding = 0;
				id_tipo = 0;
				id_dep = 0;
				codigo = "";
			}
			public int getId_binding()
			{
				return id_binding;
			}
			public void setId_binding(int id_binding)
			{
				this.id_binding = id_binding;
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
			//insertar en bindinng
			public void CrearBinding () throws ClassNotFoundException, SQLException
			{
		         Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement();
				
				String query = "insert into binding ( id_tipo, id_dep, codigo) values ('"+ getId_tipo() + "','" + getId_dep() + "','" + getCodigo() +"')";
				st.executeUpdate(query); 
				
			}
			//recuperar binding y codigo para mostrar en el dropdown
			public ResultSet Recuperar() throws ClassNotFoundException, SQLException
			{
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement();
				
				String query = " select id_binding, codigo from binding ";
				
				ResultSet rs = st.executeQuery(query);
				
					return rs;

			}	
			
			//recupera los binding que no esta aun guardados en las cajas
			public ResultSet Recuperarbin() throws ClassNotFoundException, SQLException
			{
				
			
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement();
				
				String query = " select id_binding, codigo from binding where id_binding not in (select id_binding from binding_caja)";
				
				ResultSet rs = st.executeQuery(query);
				
				return rs;
			}
			
			//compara si el id del binding es igual al id del departamento
			public int GetId_dep(int iddep) throws ClassNotFoundException, SQLException
			{
				
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement();
				
				String query = "SELECT id_dep FROM binding where id_binding = '"+iddep+"'";
				ResultSet rs = st.executeQuery(query);
				
				while(rs.next())
				{
					iddep = rs.getInt(1);
				}
				
				return iddep;
			}	
			
			
			
			
			
}
