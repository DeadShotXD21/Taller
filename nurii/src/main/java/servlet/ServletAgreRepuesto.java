package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mysql.Sql_Repuesto;

import java.io.IOException;

import bean.BeanRepuesto;

@WebServlet("/ServletAgreRepuesto")
public class ServletAgreRepuesto extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletAgreRepuesto() {
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
		
		String nombre = request.getParameter("txtNombre");
        String codigo = request.getParameter("txtCodigo");
        int stock = Integer.parseInt(request.getParameter("txtStock"));
        int stockMin = Integer.parseInt(request.getParameter("txtStockMinimo"));

        BeanRepuesto beanRep = new BeanRepuesto();
        beanRep.setNombre(nombre);
        beanRep.setCodigo(codigo);
        beanRep.setStock(stock);
        beanRep.setStock_minimo(stockMin);

        try {
            Sql_Repuesto sqlRep = new Sql_Repuesto();
            sqlRep.registrarRepuesto(beanRep);
            response.sendRedirect("pages/inventario.jsp");
        } catch (Exception e) {
            System.out.println("Error: ServletAgreRepuesto " + e);
        }
	}

}
