package bean;

public class BeanRecepcion {
    private int id_recepcion;
    private String dni;
    private String cliente;
    private String vehiculo;
    private String distrito;
    private String fechaInicio;
    private String fechaFinalizacion;
    private String estado;
    private String descripcion;

    // Constructores
    public BeanRecepcion() {}

    public BeanRecepcion(int id_recepcion, String dni, String cliente, String vehiculo, String distrito, String fechaInicio, String fechaFinalizacion, String estado, String descripcion) {
        this.id_recepcion = id_recepcion;
        this.dni = dni;
        this.cliente = cliente;
        this.vehiculo = vehiculo;
        this.distrito = distrito;
        this.fechaInicio = fechaInicio;
        this.fechaFinalizacion = fechaFinalizacion;
        this.estado = estado;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getId_recepcion() {
        return id_recepcion;
    }

    public void setId_recepcion(int id_recepcion) {
        this.id_recepcion = id_recepcion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(String vehiculo) {
        this.vehiculo = vehiculo;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(String fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}