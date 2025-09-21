package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import bean.beanAcceso;
import bean.beanUsuario;
import mysql.Sql_Acceso;
import mysql.Sql_Usuario;

@WebServlet("/ServletAgreUsuario")
public class ServletAgreUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. Captura datos
            String nombre      = request.getParameter("nombre");
            String apellido    = request.getParameter("apellido");
            String email       = request.getParameter("email");
            String telefono    = request.getParameter("telefono");
            String dni         = request.getParameter("dni");
            String distrito    = request.getParameter("distrito");
            String clave       = request.getParameter("clave");
            String confirClave = request.getParameter("confirClave");

            if (!clave.equals(confirClave)) {
                response.sendRedirect("registrarCliente.jsp?error=clave");
                return;
            }

            // 3. Rellenar beans
            beanUsuario beanUsu = new beanUsuario();
            beanAcceso  beanAcc = new beanAcceso();

            beanUsu.setNombre(nombre);
            beanUsu.setApellido(apellido);
            beanUsu.setEmail(email);
            beanUsu.setTelefono(telefono);
            beanUsu.setDni(dni);
            beanUsu.setDistrito(distrito);
            beanUsu.setRol_Id(1);                 
            beanAcc.setLogin(email);
            beanAcc.setClave(clave);

            // 4. Guardar en BD
            Sql_Usuario sqlUsu = new Sql_Usuario();
            Sql_Acceso  sqlAcc = new Sql_Acceso();
            sqlUsu.insertarUsuario(beanUsu);
            sqlAcc.insertarAcceso(beanAcc);

            response.sendRedirect("pages/login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registrarCliente.jsp?error=1");
        }
    }
}

