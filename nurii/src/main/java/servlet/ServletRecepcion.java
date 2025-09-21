package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Recepcion;

import java.io.IOException;

import bean.BeanRecepcion;

@WebServlet("/ServletRecepcion")
public class ServletRecepcion extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRecepcion() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String dni = request.getParameter("txtDni");
	    String cliente = request.getParameter("txtCliente");
	    String vehiculo = request.getParameter("txtVehiculo");
	    String distrito = request.getParameter("txtDistrito");
	    String fechaInicio = request.getParameter("txtFechaInicio");
	    String fechaFinalizacion = request.getParameter("txtFechaFinalizacion");
	    String estado = "pendiente";
	    String descripcion = request.getParameter("txtDescripcion");

	    BeanRecepcion beanRec = new BeanRecepcion();
	    beanRec.setDni(dni);
	    beanRec.setCliente(cliente);
	    beanRec.setVehiculo(vehiculo);
	    beanRec.setDistrito(distrito);
	    beanRec.setFechaInicio(fechaInicio);
	    beanRec.setFechaFinalizacion(fechaFinalizacion);
	    beanRec.setEstado(estado);
	    beanRec.setDescripcion(descripcion);

	    try {
	        Sql_Recepcion sqlRec = new Sql_Recepcion();
	        int idRecepcion = sqlRec.registrarRecepcion(beanRec);

	        if (idRecepcion > 0) {
	            response.sendRedirect(request.getContextPath() + "/pages/ordenes.jsp");
	        } else {
	            response.sendRedirect("pages/error.jsp?msg=No se pudo registrar la recepción");
	        }
	    } catch (Exception e) {
	        System.out.println("Error: ServletRecepcion " + e);
	        response.sendRedirect("pages/error.jsp?msg=Error en el servidor");
	    }
	}
}
