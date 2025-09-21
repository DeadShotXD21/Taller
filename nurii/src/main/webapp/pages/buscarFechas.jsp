<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar por Fechas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../ajax/buscarFechasAjax.js"></script>
</head>
<body class="container mt-5">
    <h2 class="mb-4">📅 Buscar Cliente y Vehículo por Rango de Fechas</h2>
    
    <div class="row mb-3">
        <div class="col-md-5">
            <label for="fechaInicio" class="form-label">Fecha Inicio:</label>
            <input type="date" class="form-control" id="fechaInicio">
        </div>
        <div class="col-md-5">
            <label for="fechaFin" class="form-label">Fecha Fin:</label>
            <input type="date" class="form-control" id="fechaFin">
        </div>
        <div class="col-md-2 d-flex align-items-end">
            <button class="btn btn-primary w-100" onclick="buscarFechas()">Buscar</button>
        </div>
    </div>

    <div id="resultadoFechas" class="mt-4"></div>

    <div class="mt-3">
        <button class="btn btn-success me-2" onclick="exportarFechas('xls')">📄 Exportar a Excel</button>
        <button class="btn btn-danger" onclick="exportarFechas('pdf')">🧾 Exportar a PDF</button>
    </div>

</body>
</html>
