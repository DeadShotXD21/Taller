<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro del Repuesto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div id="cuerpoform">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Registro del Repuesto</h3>
                </div>
                <div class="card-body">
					<form name="regFrm" method="post" action="<%= request.getContextPath() %>/ServletAgreRepuesto" class="needs-validation" novalidate>
                        <!-- Nombre -->
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="txtNombre" required>
                            <div class="invalid-feedback">El nombre es obligatorio.</div>
                        </div>
                        <!-- Código -->
                        <div class="mb-3">
                            <label class="form-label">Código</label>
                            <input type="text" class="form-control" name="txtCodigo" required>
                            <div class="invalid-feedback">El código es obligatorio.</div>
                        </div>
                        <!-- Stock -->
                        <div class="mb-3">
                            <label class="form-label">Stock</label>
                            <input type="number" class="form-control" name="txtStock" required>
                            <div class="invalid-feedback">El stock es obligatorio.</div>
                        </div>
                        <!-- Stock mínimo -->
                        <div class="mb-3">
                            <label class="form-label">Stock mínimo</label>
                            <input type="number" class="form-control" name="txtStockMinimo" required>
                            <div class="invalid-feedback">El stock mínimo es obligatorio.</div>
                        </div>
                        <!-- Botones -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">Registrar</button>
                            <a href="inventario.jsp" class="btn btn-danger">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    (function () {
        'use strict';
        var forms = document.querySelectorAll('.needs-validation');
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
    })();
</script>
<%@ include file="footer.jsp" %>
</body>
</html>