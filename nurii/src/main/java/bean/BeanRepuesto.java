package bean;

import util.Bean;

public class BeanRepuesto extends Bean {
    private static final long serialVersionUID = 1L;

    private int id_repuesto;
    private String nombre;
    private String codigo;
    private int stock;
    private int stock_minimo;

    public BeanRepuesto() {
    }

    public BeanRepuesto(int id_repuesto, String nombre, String codigo, int stock, int stock_minimo) {
        this.id_repuesto = id_repuesto;
        this.nombre = nombre;
        this.codigo = codigo;
        this.stock = stock;
        this.stock_minimo = stock_minimo;
    }

    public int getId_repuesto() {
        return id_repuesto;
    }

    public void setId_repuesto(int id_repuesto) {
        this.id_repuesto = id_repuesto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStock_minimo() {
        return stock_minimo;
    }

    public void setStock_minimo(int stock_minimo) {
        this.stock_minimo = stock_minimo;
    }
}