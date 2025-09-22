package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.beanUsuario;
import util.Lista;
import util.SqlDBConn;

public class Sql_Usuario {
    // Insertar usuario (nota: la columna es 'direccion' en la BD)
    public void insertarUsuario(beanUsuario beanUso) throws Exception {
        String sql = "INSERT INTO Usuario(nombre, apellido, email, telefono, dni, direccion, rol_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, beanUso.getNombre());
            pstmt.setString(2, beanUso.getApellido());
            pstmt.setString(3, beanUso.getEmail());
            pstmt.setString(4, beanUso.getTelefono());
            pstmt.setString(5, beanUso.getDni());
            pstmt.setString(6, beanUso.getDireccion()); // ahora direccion
            pstmt.setInt(7, beanUso.getRol_Id());
            pstmt.executeUpdate();
        }
    }

    // Listar usuarios
    public Lista listarUsuarios() throws Exception {
        Lista list_usu = new Lista();
        String sql = "SELECT * FROM Usuario";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
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
                objUsu.setDireccion(rst.getString("direccion")); // corregido
                objUsu.setRol_Id(rst.getInt("rol_id"));
                list_usu.setElemento(objUsu);
            }
        }
        return list_usu;
    }

    // Actualizar usuario (incluye rol_id)
    public void actualizarUsuario(beanUsuario beanUso) throws Exception {
        String sql = "UPDATE Usuario SET nombre = ?, apellido = ?, telefono = ?, direccion = ?, rol_id = ? WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, beanUso.getNombre());
            pstmt.setString(2, beanUso.getApellido());
            pstmt.setString(3, beanUso.getTelefono());
            pstmt.setString(4, beanUso.getDireccion()); // ahora direccion
            pstmt.setInt(5, beanUso.getRol_Id());
            pstmt.setInt(6, beanUso.getId());
            pstmt.executeUpdate();
        }
    }

    // Obtener usuario por id
    public beanUsuario obtenerUsuarioPorId(int id) throws Exception {
        beanUsuario objUsu = null;
        String sql = "SELECT * FROM Usuario WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
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
                    objUsu.setDireccion(rst.getString("direccion")); // corregido
                    objUsu.setRol_Id(rst.getInt("rol_id"));
                }
            }
        }
        return objUsu;
    }

    // Verificar existencia de usuario por login/clave (usa tabla Acceso)
    public boolean existeUsuario(String login, String clave) throws Exception {
        String sql = "SELECT 1 FROM Acceso a JOIN Usuario u ON a.login = u.email WHERE a.login = ? AND a.clave = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, login);
            pstmt.setString(2, clave);
            try (ResultSet rst = pstmt.executeQuery()) {
                return rst.next();
            }
        }
    }

    // Eliminar usuario por correo (ahora con PreparedStatement para evitar SQL injection)
    public void eliminarUsuario(String correo) throws Exception {
        String sql = "DELETE FROM Usuario WHERE email = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, correo);
            pstmt.executeUpdate();
        }
    }

    // Obtener usuario por login/clave (usa tabla Acceso)
    public beanUsuario obtenerUsuario(String log, String pas) throws Exception {
        beanUsuario objUsu = null;
        String sql = "SELECT u.* FROM Usuario u INNER JOIN Acceso a ON u.email = a.login WHERE a.login = ? AND a.clave = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
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
                    objUsu.setDireccion(rst.getString("direccion")); // corregido
                    objUsu.setRol_Id(rst.getInt("rol_id"));
                }
            }
        }
        return objUsu;
    }

    // Eliminar usuario por id
    public void eliminarUsuarioPorId(int id) throws Exception {
        String sql = "DELETE FROM Usuario WHERE id = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
