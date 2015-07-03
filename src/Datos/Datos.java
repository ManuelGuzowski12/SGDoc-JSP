package Datos;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

public class Datos {
	private String CadConexion;
	private Connection Con;
	private Statement St;
	private String Query;
	private String Tabla;
	private String Campo;
	private String Condicion;
	private ResultSet Resultados;
	private String menu;
	
	public String getCadConexion(){
		return this.CadConexion;
	}
	public void setCadConexion(String value){
		this.CadConexion = value;
	}
	public Connection getCon(){
		return this.Con;
	}
	public void setCon(Connection value){
		this.Con = value;
	}
	public Statement getSt(){
		return this.St;
	}
	public void setSt(Statement value){
		this.St = value;
	}
	public String getQuery(){
		return this.Query;
	}
	public void setQuery(String value){
		this.Query = value;
	}
	public String getTabla(){
		return this.Tabla;
	}
	public void setTabla(String value){
		this.Tabla = value;
	}
	public String getCampo(){
		return this.Campo;
	}
	public void setCampo(String value){
		this.Campo = value;
	}
	public String getCondicion(){
		return this.Condicion;
	}
	public void setCondicion(String value){
		this.Condicion = value;
	}
	public ResultSet getResultados(){
		return this.Resultados;
	}
	public void setResultados(ResultSet rs){
		this.Resultados = rs;
	}
	public Datos(){
		this.CadConexion = "";
		this.Tabla = "";
		this.Campo = "";
		this.Condicion = "";
		this.Query = "";
		this.menu = "";
	}
	public void CrearConexion(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SGdoc","root","");
			this.St = this.Con.createStatement();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public boolean Existe(){
		
		try {
			if(CrearCadena()){
				CrearConexion();
				setResultados(this.St.executeQuery(getQuery()));
				if(this.Resultados.next()){
					return true;
				}else{
					return false;
				}
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	@SuppressWarnings("null")
	public boolean CrearCadena() throws IOException{
		
		PrintWriter pw = null;
		
		if(getTabla() != ""){
			if(getCampo() != ""){
				setQuery("SELECT "+getCampo()+"FROM "+getTabla()+"");	
				pw.println("</br>"+getQuery());
			}else{
				setQuery("SELECT * FROM "+getTabla());
			}
			if(getCondicion() != ""){
				setQuery(getQuery()+" WHERE "+getCondicion());
			}
			return true;
		}else{
			return false;
		}
	}

	public ResultSet MostrarDatos()throws ClassNotFoundException, SQLException{
		try {
			if(CrearCadena()){
				CrearConexion();
				ResultSet rs = this.St.executeQuery(getQuery());
				setResultados(rs);
				return getResultados();
			}
		} catch (Exception e) {
			ResultSet rs = this.St.getResultSet();
			return rs;
		}
		return getResultados();
	}
	public ResultSet buscarmenu()throws ClassNotFoundException, SQLException{
		try {
				setQuery("select * from modulos");
				CrearConexion();
				ResultSet rs = this.St.executeQuery(getQuery());
				setResultados(rs);
				return getResultados();
		} catch (Exception e) {
			ResultSet rs = this.St.getResultSet();
			return rs;
		}
	}
	public ResultSet buscarPadre(String a)throws ClassNotFoundException, SQLException{
		try {
			setQuery("select id_modulo from modulos where id_padre='"+a+"'");
			CrearConexion();
			ResultSet rs = this.St.executeQuery(getQuery());
			setResultados(rs);
			return getResultados();
	} catch (Exception e) {
		ResultSet rs = this.St.getResultSet();
		return rs;
	}
	}
	public String creaMenu(String id_mod) throws Exception{
		
		this.Resultados = this.St.executeQuery("SELECT * FROM modulos where id_padre = '"+id_mod+"' and id_modulo = any(select id_modulo from user_mod_accion where id_usuario ='mel' and permiso = '1')");
		
		try {
			while (this.Resultados.next()) {
				this.menu+="<div class='col-md-4 well'>";
				this.menu+="<a  class='btn btn-lg btn-primary' href='"+this.Resultados.getString("url")+"'>"+this.Resultados.getString("desc_corta")+"</a>";
				this.menu+="</div>";
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new Exception(e.getMessage());
		}
		return this.menu;
	}
	public boolean existe2() throws ClassNotFoundException, SQLException{
		CrearConexion();
		ResultSet rs = this.St.executeQuery(getQuery());
		if(rs.next()){
			return true;
		}else{
			return false;
		}
	}
}

