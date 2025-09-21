package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.beanUsuario;
import mysql.Sql_Usuario;

import java.io.IOException;

@WebServlet("/ServletActUsuario")
public class ServletActUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletActUsuario() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre, apellido, email, telefono, distrito;

		int id = Integer.parseInt(request.getParameter("id"));
		nombre = request.getParameter("nombre");
		apellido = request.getParameter("apellido");
		email = request.getParameter("email");
		telefono = request.getParameter("telefono");
		distrito = request.getParameter("distrito");
		int rol_id = Integer.parseInt(request.getParameter("rol_id"));

		beanUsuario beanUsu = new beanUsuario();
		beanUsu.setId(id);
		beanUsu.setNombre(nombre);
		beanUsu.setApellido(apellido);
		beanUsu.setEmail(email);
		beanUsu.setTelefono(telefono);
		beanUsu.setDistrito(distrito);
		beanUsu.setRol_Id(rol_id);

		try {
			Sql_Usuario sqlUsu = new Sql_Usuario();
			sqlUsu.actualizarUsuario(beanUsu);
			response.sendRedirect("pages/listarUsuario.jsp");
		} catch (Exception e) {
			System.out.println("Error: ServletActUsuario " + e);
		}
	}
}
