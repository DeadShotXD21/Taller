	<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Iniciar Sesión</title>
  <link rel="stylesheet" href="../css/login.css" type="text/css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp" />
  <div class="login-container">
    <h3 class="text-center mb-4">Iniciar Sesión</h3>
    <form action="<%= request.getContextPath() %>/ServletLogin" method="post">
      <div class="mb-3">
        <label for="login" class="form-label">Correo Electrónico</label>
        <input type="email" name="login" id="login" class="form-control" placeholder="ejemplo@correo.com" required>
      </div>
      <div class="mb-3">
        <label for="clave" class="form-label">Contraseña</label>
        <input type="password" name="clave" id="clave" class="form-control" placeholder="********" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-primary">Entrar</button>
      </div>
    </form>

    <div class="mt-3 text-center">
      <p>¿No tienes cuenta? <a href="registrarCliente.jsp">Regístrate aquí</a></p>
    </div>

    <!-- Mensajes de estado -->
    <%
      String error = request.getParameter("error");
      String registro = request.getParameter("registro");
    %>
    <div class="mt-3">
      <% if ("1".equals(error)) { %>
        <div class="alert alert-danger text-center">Email o contraseña incorrectos.</div>
      <% } else if ("ok".equals(registro)) { %>
        <div class="alert alert-success text-center">Registro exitoso. Ahora inicia sesión.</div>
      <% } %>
    </div>
  </div>
	<jsp:include page="footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
