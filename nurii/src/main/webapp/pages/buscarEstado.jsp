<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar por Estado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../ajax/buscarEstadoAjax.js"></script>
</head>
<body class="container mt-5">
    <h2 class="mb-4">📌 Buscar Cliente y Vehículo por Estado</h2>
    
    <div class="row mb-3">
        <div class="col-md-6">
            <label for="estado" class="form-label">Estado:</label>
            <select class="form-select" id="estado">
                <option value="">Seleccione un estado</option>
                <option value="En atención">En atención</option>
                <option value="Programado">Programado</option>
            </select>
        </div>
        <div class="col-md-6 d-flex align-items-end">
            <button class="btn btn-primary w-100" onclick="buscarEstado()">Buscar</button>
        </div>
    </div>

    <div id="resultadoEstado" class="mt-4"></div>

    <div class="mt-3">
        <button class="btn btn-success me-2" onclick="exportarEstado('xls')">📄 Exportar a Excel</button>
        <button class="btn btn-danger" onclick="exportarEstado('pdf')">🧾 Exportar a PDF</button>
    </div>

</body>
</html>
