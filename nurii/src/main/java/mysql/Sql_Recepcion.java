package mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.BeanRecepcion;
import util.SqlDBConn;

public class Sql_Recepcion {

	public int registrarRecepcion(BeanRecepcion beanRec) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "INSERT INTO Recepcion (dni, cliente, vehiculo, distrito, fecha_inicio, fecha_finalizacion, estado, descripcion) VALUES ("
                   + "'" + beanRec.getDni() + "', "
                   + "'" + beanRec.getCliente() + "', "
                   + "'" + beanRec.getVehiculo() + "', "
                   + "'" + beanRec.getDistrito() + "', "
                   + "'" + beanRec.getFechaInicio() + "', "
                   + "'" + beanRec.getFechaFinalizacion() + "', "
                   + "'" + beanRec.getEstado() + "', "
                   + "'" + beanRec.getDescripcion() + "')";

        System.out.println("Ejecutando SQL: " + sql);

        Statement stm = conn.createStatement();

        
        int idGenerado = 0;
        int rowsAffected = stm.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
        
        if (rowsAffected > 0) {
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                idGenerado = rs.getInt(1);
            }
            rs.close();
        }
        stm.close();
        conn.close();

        return idGenerado;
    }
	
	public List<BeanRecepcion> listarRecepciones(String estadoFiltro) throws Exception {
	    List<BeanRecepcion> lista = new ArrayList<>();
	    SqlDBConn cnx = new SqlDBConn();
	    Connection conn = cnx.getConnection("taller_mecanico");

	    String sql;
	    if (estadoFiltro == null || estadoFiltro.isEmpty()) {
	        sql = "SELECT id_recepcion, dni, cliente, vehiculo, distrito, fecha_inicio, fecha_finalizacion, estado, descripcion FROM Recepcion";
	    } else {
	        sql = "SELECT id_recepcion, dni, cliente, vehiculo, distrito, fecha_inicio, fecha_finalizacion, estado, descripcion FROM Recepcion WHERE estado = '" + estadoFiltro + "'";
	    }

	    Statement stm = conn.createStatement();
	    ResultSet rs = stm.executeQuery(sql);

	    while (rs.next()) {
	        BeanRecepcion bean = new BeanRecepcion();
	        bean.setId_recepcion(rs.getInt("id_recepcion"));
	        bean.setDni(rs.getString("dni"));
	        bean.setCliente(rs.getString("cliente"));
	        bean.setVehiculo(rs.getString("vehiculo"));
	        bean.setDistrito(rs.getString("distrito"));
	        bean.setFechaInicio(rs.getString("fecha_inicio"));
	        bean.setFechaFinalizacion(rs.getString("fecha_finalizacion"));
	        bean.setEstado(rs.getString("estado"));
	        bean.setDescripcion(rs.getString("descripcion"));

	        lista.add(bean);
	    }

	    rs.close();
	    stm.close();
	    conn.close();

	    return lista;
	}
    
    public void actualizarEstado(int idRecepcion, String nuevoEstado) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "UPDATE Recepcion SET estado = '" + nuevoEstado + "' WHERE id_recepcion = " + idRecepcion;
        System.out.println(sql);

        Statement stm = conn.createStatement();
        stm.executeUpdate(sql);
        stm.close();
        conn.close();
    }
}