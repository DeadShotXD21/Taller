<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Taller Mecánico</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu_cliente.jsp" %>
<div id="cuerpo">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Registrar Recepción</h3>
                </div>
                <div class="card-body">
                    <form name="regRecepcionFrm" method="post" action="<%= request.getContextPath() %>/ServletRecepcion" class="needs-validation" novalidate>
                        <!-- DNI -->
                        <div class="mb-3">
                            <label for="txtDni" class="form-label">DNI</label>
                            <input type="text" class="form-control" id="txtDni" name="txtDni" required>
                            <div class="invalid-feedback">El DNI es obligatorio.</div>
                        </div>
                        <!-- Cliente -->
                        <div class="mb-3">
                            <label for="txtCliente" class="form-label">Cliente</label>
                            <input type="text" class="form-control" id="txtCliente" name="txtCliente" required>
                            <div class="invalid-feedback">El nombre del cliente es obligatorio.</div>
                        </div>
                        <!-- Vehículo -->
                        <div class="mb-3">
                            <label for="txtVehiculo" class="form-label">Vehículo</label>
                            <input type="text" class="form-control" id="txtVehiculo" name="txtVehiculo" required>
                            <div class="invalid-feedback">El vehículo es obligatorio.</div>
                        </div>
                        <!-- Distrito -->
                        <div class="mb-3">
                            <label for="txtDistrito" class="form-label">Distrito</label>
                            <input type="text" class="form-control" id="txtDistrito" name="txtDistrito" required>
                            <div class="invalid-feedback">El distrito es obligatorio.</div>
                        </div>
                        <!-- Fechas -->
                        <div class="mb-3">
                            <label for="txtFechaInicio" class="form-label">Fecha de Inicio</label>
                            <input type="date" class="form-control" id="txtFechaInicio" name="txtFechaInicio" required>
                            <div class="invalid-feedback">La fecha de inicio es obligatoria.</div>
                        </div>
                        <div class="mb-3">
                            <label for="txtFechaFinalizacion" class="form-label">Fecha de Finalización</label>
                            <input type="date" class="form-control" id="txtFechaFinalizacion" name="txtFechaFinalizacion" required>
                            <div class="invalid-feedback">La fecha de finalización es obligatoria.</div>
                        </div>
                        <!-- Descripción -->
                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción</label>
                            <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" rows="4"></textarea>
                        </div>
                        <!-- Botones -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">Registrar</button>
                            <a href="ordenes.jsp" class="btn btn-danger">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>