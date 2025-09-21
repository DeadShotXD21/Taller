package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/ServletBuscarCliente")
public class ServletBuscarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletBuscarCliente() {
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
		String dni = request.getParameter("dni");
        String apellido = request.getParameter("apellido");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // Aquí puedes consultar la BD. Resultado simulado:
        out.println("<table border='1'><tr><th>DNI</th><th>Apellido</th></tr>");
        out.println("<tr><td>" + dni + "</td><td>" + apellido + "</td></tr>");
        out.println("</table>");
	}

}
