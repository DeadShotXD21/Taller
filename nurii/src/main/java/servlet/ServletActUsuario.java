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
        
        try {
            int id        = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email    = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion= request.getParameter("direccion");
            int rol_id      = Integer.parseInt(request.getParameter("rol_id"));

            // Validación de email
            String regexEmail = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
            if (email == null || !email.matches(regexEmail)) {
                response.sendRedirect("pages/editarUsuario.jsp?error=email&id=" + id);
                return;
            }

            // Llenar bean
            beanUsuario beanUsu = new beanUsuario();
            beanUsu.setId(id);
            beanUsu.setNombre(nombre);
            beanUsu.setApellido(apellido);
            beanUsu.setEmail(email);
            beanUsu.setTelefono(telefono);
            beanUsu.setDireccion(direccion);
            beanUsu.setRol_Id(rol_id);

            // Actualizar en BD
            Sql_Usuario sqlUsu = new Sql_Usuario();
            sqlUsu.actualizarUsuario(beanUsu);

            response.sendRedirect("pages/listarUsuario.jsp");
        } catch (Exception e) {
            System.out.println("Error: ServletActUsuario " + e);
            response.sendRedirect("pages/editarUsuario.jsp?error=1");
        }
    }
}

