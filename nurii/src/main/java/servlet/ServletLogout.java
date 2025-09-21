package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ServletLogout")
public class ServletLogout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 1. Obtener la sesión actual (sin crear nueva)
        HttpSession session = request.getSession(false);
        
        // 2. Invalidar la sesión si existe
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Redirigir a página de login (con parámetro opcional)
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp?logout=1");
    }
    
    // También manejar POST por si acaso
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}