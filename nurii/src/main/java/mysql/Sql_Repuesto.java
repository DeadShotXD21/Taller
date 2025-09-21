package mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.BeanRepuesto;
import util.Lista;
import util.SqlDBConn;

public class Sql_Repuesto {

    public void registrarRepuesto(BeanRepuesto beanRep) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "insert into Inventario (nombre, codigo, stock, stock_minimo) values ("
                   + "'" + beanRep.getNombre() + "', "
                   + "'" + beanRep.getCodigo() + "', "
                   + beanRep.getStock() + ", "
                   + beanRep.getStock_minimo() + ")";
        System.out.println(sql);

        Statement stm = conn.createStatement();
        stm.executeUpdate(sql);
        stm.close();
        conn.close();
    }

    public void actualizarRepuesto(BeanRepuesto beanRep) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "update Inventario set "
                   + "nombre = '" + beanRep.getNombre() + "', "
                   + "codigo = '" + beanRep.getCodigo() + "', "
                   + "stock = " + beanRep.getStock() + ", "
                   + "stock_minimo = " + beanRep.getStock_minimo() + " "
                   + "where id_repuesto = " + beanRep.getId_repuesto();
        System.out.println(sql);

        Statement stm = conn.createStatement();
        stm.executeUpdate(sql);
        stm.close();
        conn.close();
    }

    public void eliminarRepuesto(int id) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "delete from Inventario where id_repuesto = " + id;
        System.out.println(sql);

        Statement stm = conn.createStatement();
        stm.executeUpdate(sql);
        stm.close();
        conn.close();
    }

    public Lista listarRepuestos() throws Exception {
        Lista lista_rep = new Lista();
        BeanRepuesto objRep = null;
        String sql = "select * from Inventario";
        System.out.println(sql);

        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        ResultSet rst;
        Statement stm = conn.createStatement();
        rst = stm.executeQuery(sql);

        while (rst.next()) {
            objRep = new BeanRepuesto();
            objRep.setId_repuesto(rst.getInt("id_repuesto"));
            objRep.setNombre(rst.getString("nombre"));
            objRep.setCodigo(rst.getString("codigo"));
            objRep.setStock(rst.getInt("stock"));
            objRep.setStock_minimo(rst.getInt("stock_minimo"));
            lista_rep.setElemento(objRep);
        }

        rst.close();
        stm.close();
        conn.close();

        return lista_rep;
    }

    public BeanRepuesto obtenerRepuesto(int id) throws Exception {
        SqlDBConn cnx = new SqlDBConn();
        Connection conn = cnx.getConnection("taller_mecanico");

        String sql = "select * from Inventario where id_repuesto = " + id;
        Statement stm = conn.createStatement();
        ResultSet rst = stm.executeQuery(sql);

        BeanRepuesto beanRep = new BeanRepuesto();
        if (rst.next()) {
            beanRep.setId_repuesto(rst.getInt("id_repuesto"));
            beanRep.setNombre(rst.getString("nombre"));
            beanRep.setCodigo(rst.getString("codigo"));
            beanRep.setStock(rst.getInt("stock"));
            beanRep.setStock_minimo(rst.getInt("stock_minimo"));
        }

        rst.close();
        stm.close();
        conn.close();

        return beanRep;
    }
}