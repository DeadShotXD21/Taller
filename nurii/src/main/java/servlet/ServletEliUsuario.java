package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Acceso;
import mysql.Sql_Usuario;

import java.io.IOException;


import bean.beanAcceso;
import bean.beanUsuario;

@WebServlet("/ServletEliUsuario")
public class ServletEliUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletEliUsuario() {
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
		String email;
		email=(String)request.getParameter("txtId");
		//invocar la clase persistente
		beanUsuario beanUsu=new beanUsuario();
		beanAcceso beanAcc=new beanAcceso();
		//llenamos el BeanUsuario
		beanUsu.setEmail(email);
		//llenamos el BeanAcceso
		beanAcc.setLogin(email);
		try {
			Sql_Usuario sqlUsu=new Sql_Usuario();
			Sql_Acceso sqlAcc=new Sql_Acceso();
			sqlAcc.eliminarAcceso(email);
			sqlUsu.eliminarUsuario(email);
			response.sendRedirect("listarUsuario.jsp");
		}catch(Exception e) {
			System.out.println("Error:ServletEliUsuario:"+e);
		}
	}

}
