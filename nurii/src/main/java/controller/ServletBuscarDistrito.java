package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/ServletBuscarDistrito")
public class ServletBuscarDistrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletBuscarDistrito() {
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
		String distrito = request.getParameter("distrito");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<table border='1'><tr><th>Cliente</th><th>Vehículo</th></tr>");
        out.println("<tr><td>Juan Pérez</td><td>Toyota Corolla</td></tr>");
        out.println("</table>");
	}

}
