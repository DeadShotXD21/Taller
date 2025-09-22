<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario - Restaurante</title>
    <link rel="stylesheet" href="../css/Usuario.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <jsp:include page="header.jsp" />
    <jsp:include page="menu.jsp" />

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow">
                    <div class="card-header bg-success text-white text-center">
                        <h3 class="mb-0">Registro de Usuario - Restaurante</h3>
                    </div>
                    <div class="card-body">
                        <form id="registroForm" method="post" action="<%= request.getContextPath() %>/ServletAgreUsuario" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" required>
                                <div class="invalid-feedback">El nombre es obligatorio.</div>
                            </div>
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" required>
                                <div class="invalid-feedback">El apellido es obligatorio.</div>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Correo</label>
                                <input type="email" 
                                       class="form-control" 
                                       id="email" 
                                       name="email" 
                                       required
                                       pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                       title="Ingrese un correo válido (ejemplo@dominio.com)">
                                <div class="invalid-feedback">Ingrese un correo válido (ejemplo@dominio.com).</div>
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" required>
                                <div class="invalid-feedback">El teléfono es obligatorio.</div>
                            </div>
                            <div class="mb-3">
                                <label for="dni" class="form-label">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni" maxlength="8" pattern="\d{8}" title="8 dígitos" required>
                                <div class="invalid-feedback">El DNI (8 dígitos) es obligatorio.</div>
                            </div>

                            <div class="mb-3">
                                <label for="direccion" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" maxlength="100" required>
                                <div class="invalid-feedback">La dirección es obligatoria.</div>
                            </div>

                            <!-- Campo oculto con rol fijo "Mesero" -->
                            <input type="hidden" id="rol" name="rol" value="1">

                            <div class="mb-3">
                                <label for="clave" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="clave" name="clave" required>
                                <div class="invalid-feedback">La contraseña es obligatoria.</div>
                            </div>
                            <div class="mb-3">
                                <label for="confirClave" class="form-label">Confirmar Contraseña</label>
                                <input type="password" class="form-control" id="confirClave" name="confirClave" required>
                                <div class="invalid-feedback">Debes confirmar tu contraseña.</div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Registrar</button>
                                <a href="login.jsp" class="btn btn-danger">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function () {
            'use strict'
            var form = document.getElementById('registroForm');

            form.addEventListener('submit', function (event) {
                // Validación propia del navegador/Bootstrap
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                // Validación extra del correo con regex
                var emailField = document.getElementById('email');
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailRegex.test(emailField.value)) {
                    event.preventDefault();
                    event.stopPropagation();
                    Swal.fire({
                        icon: 'error',
                        title: 'Correo inválido',
                        text: 'Ingrese un correo válido (ejemplo@dominio.com)',
                        confirmButtonColor: '#d33',
                        confirmButtonText: 'Entendido'
                    });
                    return false;
                }

                form.classList.add('was-validated');
            }, false);
        })()
    </script>
</body>
</html>
