package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Recepcion;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/ServletCambiarEstado")
public class ServletCambiarEstado extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ServletCambiarEstado() {
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
		
		Sql_Recepcion sql = new Sql_Recepcion();

        try {
            Enumeration<String> params = request.getParameterNames();

            while (params.hasMoreElements()) {
                String paramName = params.nextElement();
                if (paramName.startsWith("estado_")) {
                    String idStr = paramName.substring("estado_".length());
                    int idRecepcion = Integer.parseInt(idStr);
                    String nuevoEstado = request.getParameter(paramName);

                    sql.actualizarEstado(idRecepcion, nuevoEstado);
                }
            }

            response.sendRedirect(request.getContextPath() + "/pages/ordenes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al actualizar los estados.");
        }
	}

}
