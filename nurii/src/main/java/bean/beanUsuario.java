package bean;

import util.Bean;

public class beanUsuario extends Bean {
	private static final long serialVersionUID = 1L;

	private int id;
	private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private String dni;
    private String distrito;
    private int rol_Id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	public int getRol_Id() {
		return rol_Id;
	}
	public void setRol_Id(int rol_Id) {
		this.rol_Id = rol_Id;
	}

	
}
