<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.beanUsuario"%>
<%@ page import="mysql.Sql_Usuario"%>
<%@ page import="util.Lista"%>
<%
    Lista lis_usu = new Lista();
    Sql_Usuario sqlUsu = new Sql_Usuario();
    try {
        lis_usu = sqlUsu.listarUsuarios();
    } catch (Exception e) {
        out.println("Error al cargar usuarios: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle Inventario</title>
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="../css/Usuario.css" type="text/css">
    <link rel="stylesheet" href="../css/main.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="../ajax/gestUsuario.js"></script>
</head>
<body>
    <!-- Incluir el menú -->

<jsp:include page="header.jsp" />
<jsp:include page="menu_admin.jsp" />
<div class="main-content">
    <div class="form-container container mt-5">
        <table>
            <tr>
				    <div class="d-flex justify-content-end mb-3">
				        	<a href="registrarCliente.jsp" class="btn btn-success btn-sm">+ Nuevo Usuario</a>
				   	</div>
            </tr>
        </table>
        <h2 class="text-center mb-4">Lista de Usuarios</h2>
        <form name="f_body" method="post" action="ServletEliUsuario">
            <input type="hidden" id="txtId" name="txtId">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (lis_usu != null && lis_usu.getTamanio() > 0) {
                        for (int i = 0; i < lis_usu.getTamanio(); i++) {
                            beanUsuario beanUsu = (beanUsuario) lis_usu.getElemento(i);
                %>
                    <tr>
                        <td><%= beanUsu.getId() %></td>
                        <td><%= beanUsu.getNombre() %></td>
                        <td><%= beanUsu.getEmail() %></td>
                        <td><%= beanUsu.getTelefono() %></td>
                        <td><%= beanUsu.getRol_Id() %></td>
                <td>
                    <a href="verUsuario.jsp?id=<%= beanUsu.getId() %>" class="btn btn-sm btn-primary">Ver</a> |
                    <a href="ActUsuario.jsp?id=<%= beanUsu.getId() %>" class="btn btn-sm btn-warning">Editar</a> |
                    <button type="button" class="btn btn-sm btn-danger"
							onclick="javascript:enlaceEliminar('<%= beanUsu.getId() %>')">
							Eliminar
						</button>
                </td>
                </tr> 	
                <%
                        }
                    } else {
                        out.println("<tr><td colspan='8' class='text-center'>No hay usuarios registrados.</td></tr>");
                    }
                %>
                </tbody>
            </table>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap @5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>