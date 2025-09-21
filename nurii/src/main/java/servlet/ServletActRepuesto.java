package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Repuesto;

import java.io.IOException;

import bean.BeanRepuesto;

@WebServlet("/ServletActRepuesto")
public class ServletActRepuesto extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletActRepuesto() {
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
        String nombre = request.getParameter("txtNombre");
        String codigo = request.getParameter("txtCodigo");
        int stock = Integer.parseInt(request.getParameter("txtStock"));
        int stockMin = Integer.parseInt(request.getParameter("txtStockMinimo"));

        BeanRepuesto beanRep = new BeanRepuesto(id, nombre, codigo, stock, stockMin);

        try {
            Sql_Repuesto sqlRep = new Sql_Repuesto();
            sqlRep.actualizarRepuesto(beanRep);
            response.sendRedirect("pages/inventario.jsp");
        } catch (Exception e) {
            System.out.println("Error: ServletActRepuesto " + e);
        }
	}

}
