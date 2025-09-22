<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mysql.Sql_Usuario"%>
<%@ page import="bean.beanUsuario"%>
<%@ page import="util.Lista" %>
<%
    String idStr = request.getParameter("id");
    beanUsuario beanUsu = new beanUsuario();
    Sql_Usuario sqlUsu = new Sql_Usuario();

    if (idStr != null && !idStr.isEmpty()) {
        try {
            int id = Integer.parseInt(idStr);
            beanUsu = sqlUsu.obtenerUsuarioPorId(id);
        } catch (NumberFormatException e) {
            out.println("ID inválido.");
        } catch (Exception e) {
            out.println("Error al obtener usuario: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <title>Detalle Inventario</title>
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="../css/Usuario.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Incluir el menú -->

<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0 text-center">Detalle de Inventario</h3>
                    </div>
                    <div class="card-body">
                        <form class="needs-validation" novalidate>
                            <!-- Nombre -->
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%= beanUsu.getNombre() %>" disabled>
                            </div>
                            <!-- apellido -->
                            <div class="mb-3">
                                <label for="apellido" class="form-label">apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" value="<%= beanUsu.getApellido() %>" disabled>
                            </div>
                            <!-- email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">email</label>
                                <input type="email" class="form-control" id="email" name="email" value="<%= beanUsu.getEmail() %>" disabled>
                            </div>
                            <!-- Telefono -->
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="number" class="form-control" id="telefono" name="telefono" value="<%= beanUsu.getTelefono() %>" disabled>
                            </div>
                            <!-- DNI -->
                            <div class="mb-3">
                                <label for="dni" class="form-label">DNI</label>
                                <input type="number" step="0.01" class="form-control" id="dni" name="dni" value="<%= beanUsu.getDni() %>" disabled>
                            </div>
                            <!-- direccion -->
                            <div class="mb-3">
                                <label for="dni" class="form-label">direccion</label>
                                <input type="text" step="0.01" class="form-control" id="direccion" name="direccion" value="<%= beanUsu.getDireccion() %>" disabled>
                            </div>
                            <!-- ROL-ID -->
                            <div class="mb-3">
                                <label for="rol_id" class="form-label">Rol</label>
                                <input type="text" class="form-control" id="rol_id" name="rol_id" value="<%= beanUsu.getRol_Id() %>" disabled>
                            </div>

                            <!-- Botones -->
                            <div class="d-grid gap-2">
                                <a href="listarUsuario.jsp" class="btn btn-danger">Retornar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>