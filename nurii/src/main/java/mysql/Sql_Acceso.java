package mysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import bean.beanAcceso;
import util.SqlDBConn;

public class Sql_Acceso {
	//metodo insertar acceso
	    public void insertarAcceso(beanAcceso beanAcc) throws Exception {
	        String sql = "INSERT INTO acceso (login, clave) VALUES (?, ?)";
	        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
	                PreparedStatement pstmt = conn.prepareStatement(sql)) {
	               pstmt.setString(1, beanAcc.getLogin());
	               pstmt.setString(2, beanAcc.getClave()); 
	               pstmt.executeUpdate();
	           }
	    }
	//metodo actualizarAcceso
	    public void actualizarAcceso(beanAcceso beanAcc) throws Exception {
	        String sql = "UPDATE acceso SET clave = ? WHERE login = ?";
	        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, beanAcc.getClave());
	            pstmt.setString(2, beanAcc.getLogin());
	            pstmt.executeUpdate();
	        }
	    }

	//metodo eliminarAcceso
    public void eliminarAcceso(String login) throws Exception {
        String sql = "DELETE FROM acceso WHERE login = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, login);
            pstmt.executeUpdate();
        }
    }
}
