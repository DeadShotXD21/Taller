package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Repuesto;

import java.io.IOException;

import bean.BeanRepuesto;

@WebServlet("/ServletEliRepuesto")
public class ServletEliRepuesto extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletEliRepuesto() {
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
		
		int id = Integer.parseInt(request.getParameter("txtId"));
		BeanRepuesto beanPro = new BeanRepuesto();
		beanPro.setId_repuesto(id);

        try {
            Sql_Repuesto sqlRep = new Sql_Repuesto();
            sqlRep.eliminarRepuesto(id);
            response.sendRedirect(request.getContextPath() + "/pages/inventario.jsp");
        } catch (Exception e) {
            System.out.println("Error: ServletEliRepuesto " + e);
        }
	}

}
