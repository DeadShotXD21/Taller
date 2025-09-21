// Archivo: mysql/Sql_Usuario.java
package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import bean.beanUsuario;
import util.Lista;
import util.SqlDBConn;

public class Sql_Usuario {
    public void insertarUsuario(beanUsuario beanUso) throws Exception {
        String sql = "INSERT INTO usuario(nombre, apellido, email, telefono, dni,distrito,rol_id) VALUES (?, ?, ?, ?, ?, ?,?)";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, beanUso.getNombre());
            pstmt.setString(2, beanUso.getApellido());
            pstmt.setString(3, beanUso.getEmail());
            pstmt.setString(4, beanUso.getTelefono());
            pstmt.setString(5, beanUso.getDni());
            pstmt.setString(6, beanUso.getDistrito());
            pstmt.setInt(7, beanUso.getRol_Id());
            pstmt.executeUpdate();
        }
    }

    public Lista listarUsuarios() throws Exception {
        Lista list_usu = new Lista();
        String sql = "SELECT * FROM usuario";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rst = pstmt.executeQuery()) {
            while (rst.next()) {
                beanUsuario objUsu = new beanUsuario();
                objUsu.setId(rst.getInt("id"));
                objUsu.setNombre(rst.getString("nombre"));
                objUsu.setApellido(rst.getString("apellido"));
                objUsu.setEmail(rst.getString("email"));
                objUsu.setTelefono(rst.getString("telefono"));
                objUsu.setDni(rst.getString("dni"));
                objUsu.setDistrito(rst.getString("distrito"));
                objUsu.setRol_Id(rst.getInt("rol_id"));
                list_usu.setElemento(objUsu);
            }
        }
        return list_usu;
    }
    
    public void actualizarUsuario(beanUsuario beanUso) throws Exception {
        // Agrega rol_id al UPDATE
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, telefono = ?, distrito = ?, rol_id = ? WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, beanUso.getNombre());
            pstmt.setString(2, beanUso.getApellido());
            pstmt.setString(3, beanUso.getTelefono());
            pstmt.setString(4, beanUso.getDistrito());
            pstmt.setInt(5, beanUso.getRol_Id()); // Nuevo: rol_id
            pstmt.setInt(6, beanUso.getId()); // Ahora en posición 6
            pstmt.executeUpdate();
        }
    }
    public beanUsuario obtenerUsuarioPorId(int id) throws Exception {
        beanUsuario objUsu = null;
        String sql = "SELECT * FROM usuario WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    objUsu = new beanUsuario();
                    objUsu.setId(rst.getInt("id"));
                    objUsu.setNombre(rst.getString("nombre"));
                    objUsu.setApellido(rst.getString("apellido"));
                    objUsu.setEmail(rst.getString("email"));
                    objUsu.setTelefono(rst.getString("telefono"));
                    objUsu.setDni(rst.getString("dni"));
                    objUsu.setDistrito(rst.getString("distrito"));
                    objUsu.setRol_Id(rst.getInt("rol_id"));
                }
            }
        }
        return objUsu;
    }

    public boolean existeUsuario(String login, String clave) throws Exception {
        String sql = "SELECT 1 FROM acceso a JOIN usuario u ON a.login = u.email WHERE a.login = ? AND a.clave = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, login);
            pstmt.setString(2, clave);
            try (ResultSet rst = pstmt.executeQuery()) {
                return rst.next(); 
            }
        }
    }
	public void eliminarUsuario (String correo) throws Exception {
		//invocamos a la clase SqlDBconn
		SqlDBConn cnx = new SqlDBConn();
		//invocamos al metodo que nos permite acceder a la base de datos
		Connection conn = cnx.getConnection("taller_mecanico");
		//hacemos la sentencia para insertar datos a la tabla
		String sql = "";
		sql = "delete from usuario where email = '"+correo+"'";
		System.out.println(sql);
		//ejecutar la sentencia
		Statement stm = conn.createStatement();
		//como se hace un insert se usa ExecuteUpdate
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
	}

    public beanUsuario obtenerUsuario(String log, String pas) throws Exception {
        beanUsuario objUsu = null;
        String sql = "SELECT u.* FROM usuario u INNER JOIN acceso a ON u.email = a.login WHERE a.login = ? AND a.clave = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, log);
            pstmt.setString(2, pas);
            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    objUsu = new beanUsuario();
                    objUsu.setId(rst.getInt("id"));
                    objUsu.setNombre(rst.getString("nombre"));
                    objUsu.setApellido(rst.getString("apellido"));
                    objUsu.setEmail(rst.getString("email"));
                    objUsu.setTelefono(rst.getString("telefono"));
                    objUsu.setDni(rst.getString("dni"));
                    objUsu.setRol_Id(rst.getInt("rol_id"));
                }
            }
        }
        return objUsu;
    }
    public void eliminarUsuarioPorId(int id) throws Exception {
        String sql = "DELETE FROM usuario WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("taller_mecanico");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}