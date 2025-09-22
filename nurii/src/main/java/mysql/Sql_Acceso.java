package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.beanAcceso;
import util.SqlDBConn;

public class Sql_Acceso {
    // Método insertar acceso
    public void insertarAcceso(beanAcceso beanAcc) throws Exception {
        String sql = "INSERT INTO Acceso (login, clave) VALUES (?, ?)";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, beanAcc.getLogin());
            pstmt.setString(2, beanAcc.getClave());
            pstmt.executeUpdate();
        }
    }

    // Método actualizarAcceso
    public void actualizarAcceso(beanAcceso beanAcc) throws Exception {
        String sql = "UPDATE Acceso SET clave = ? WHERE login = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, beanAcc.getClave());
            pstmt.setString(2, beanAcc.getLogin());
            pstmt.executeUpdate();
        }
    }

    // Método eliminarAcceso
    public void eliminarAcceso(String login) throws Exception {
        String sql = "DELETE FROM Acceso WHERE login = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, login);
            pstmt.executeUpdate();
        }
    }

    // Obtener acceso por login (útil para validaciones)
    public beanAcceso obtenerAccesoPorLogin(String login) throws Exception {
        beanAcceso beanAcc = null;
        String sql = "SELECT login, clave FROM Acceso WHERE login = ?";
        try (Connection conn = new SqlDBConn().getConnection("RestauranteElPato");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, login);
            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    beanAcc = new beanAcceso();
                    beanAcc.setLogin(rst.getString("login"));
                    beanAcc.setClave(rst.getString("clave"));
                }
            }
        }
        return beanAcc;
    }
}
