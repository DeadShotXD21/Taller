package util;

//IMPORTAR LOS PAQUETES NECESARIOS PARA LA CONEXION A LA BASE DE DATOS
//====================================================================
import java.sql.Connection;
import java.sql.DriverManager;

public class SqlDBConn
{
	//METODO PARA INVOCAR EL USO DE LA LIBRERIA
	//=========================================
	static
	{
		try
		{Class.forName("com.mysql.jdbc.Driver");}
		catch (Exception e)
		{
			System.out.println("Error en el Driver"+e.getMessage());
		}
	}
	//METODO PARA CREAR LA CONEXION A LA BASE DE DATOS
	//================================================
	public Connection getConnection(String db)
	{
		Connection connection=null;
		try {
			connection=
			DriverManager.getConnection("jdbc:mysql://localhost:3307/"+db,"root","");
		}catch (Exception e)
		{
			System.out.println("Error en la conexion:"+e.getMessage());
		}
		return connection;
	}
}