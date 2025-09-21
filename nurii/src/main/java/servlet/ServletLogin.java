package servlet;

import bean.beanUsuario;
import mysql.Sql_Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String clave = req.getParameter("clave");
        try {
            Sql_Usuario sqlUsu = new Sql_Usuario();
            if (sqlUsu.existeUsuario(login, clave)) {
                beanUsuario usu = sqlUsu.obtenerUsuario(login, clave);
                HttpSession session = req.getSession();
                session.setAttribute("usuario", usu);
                session.setAttribute("nombre", usu.getNombre());
                if (usu.getRol_Id() == 1) {
                    resp.sendRedirect("pages/cliente.jsp");
                } else {
                    resp.sendRedirect("pages/admin.jsp");
                }
            } else {
                resp.sendRedirect("pages/login.jsp?error=1");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
