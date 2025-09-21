<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="bean.beanUsuario"%>
<%@ page import="mysql.Sql_Usuario"%>
<%@ page import="util.Lista"%>

<%
   // Recuperar el parámetro id del usuario
   String idStr = request.getParameter("id");
   beanUsuario beanUsu = new beanUsuario();
   Sql_Usuario sqlUsu = new Sql_Usuario();
   
   try {
       if (idStr != null && !idStr.isEmpty()) {
           int id = Integer.parseInt(idStr);
           beanUsu = sqlUsu.obtenerUsuarioPorId(id);
       }
   } catch (Exception e) {
       out.println("Error al cargar datos: " + e.getMessage());
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Incluir el menú -->
<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow">
                    <div class="card-header text-center">
                        <h3>Actualizar Usuario</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="<%= request.getContextPath() %>/ServletActUsuario">
                            <!-- Campo oculto para ID -->
                            <input type="hidden" name="id" value="<%= beanUsu.getId() %>">
                            
                            <!-- email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">email Electrónico</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="<%= beanUsu.getEmail() %>" disabled>
                                <input type="hidden" name="email" value="<%= beanUsu.getEmail() %>">
                            </div>
                            
                            <!-- Nombre -->
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" 
                                       value="<%= beanUsu.getNombre() %>" required>
                                <div class="invalid-feedback">
                                    Por favor ingrese un nombre válido.
                                </div>
                            </div>
                            
                            <!-- apellido -->
                            <div class="mb-3">
                                <label for="apellido" class="form-label">apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" 
                                       value="<%= beanUsu.getApellido() %>" required>
                                <div class="invalid-feedback">
                                    Por favor ingrese apellido válidos.
                                </div>
                            </div>
                            
                            <!-- Teléfono -->
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" 
                                       value="<%= beanUsu.getTelefono() %>" required>
                                <div class="invalid-feedback">
                                    Por favor ingrese un número de teléfono válido.
                                </div>
                            </div>
                            
                            <!-- Distrito -->
                            <div class="mb-3">
                                <label for="distrito" class="form-label">Distrito</label>
                                <input type="text" class="form-control" id="distrito" name="distrito" 
                                       value="<%= beanUsu.getDistrito() %>" required>
                                <div class="invalid-feedback">
                                    Por favor ingrese un Distrito válido.
                                </div>
                            </div>
                            
                            <!-- Rol -->
                            <div class="mb-3">
                                <label for="rol_id" class="form-label">Rol</label>
                                <select class="form-select" id="rol_id" name="rol_id" required>
                                    <option value="">Seleccionar rol</option>
                                    <option value="1" <%= beanUsu.getRol_Id() == 1 ? "selected" : "" %>>Cliente</option>
                                    <option value="2" <%= beanUsu.getRol_Id() == 2 ? "selected" : "" %>>Mecanico</option>
                                    <option value="3" <%= beanUsu.getRol_Id() == 4 ? "selected" : "" %>>Administrador</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor seleccione un rol.
                                </div>
                            </div>
                            
                            <!-- Botones -->
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Actualizar</button> 
                                <a href="listarUsuario.jsp" class="btn btn-danger">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />

    <!-- Bootstrap JS and validation script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap @5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Script de validación de formularios
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>