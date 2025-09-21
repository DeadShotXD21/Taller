<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../ajax/buscarClienteAjax.js"></script>
</head>
<body class="container mt-5">
    <h2 class="mb-4">🔎 Buscar Cliente por DNI y/o Apellido</h2>
    
    <div class="row mb-3">
        <div class="col-md-4">
            <label for="dni" class="form-label">DNI:</label>
            <input type="text" class="form-control" id="dni" placeholder="Ingrese DNI">
        </div>
        <div class="col-md-4">
            <label for="apellido" class="form-label">Apellido:</label>
            <input type="text" class="form-control" id="apellido" placeholder="Ingrese Apellido">
        </div>
        <div class="col-md-4 d-flex align-items-end">
            <button class="btn btn-primary w-100" onclick="buscarCliente()">Buscar</button>
        </div>
    </div>

    <div id="resultadoCliente" class="mt-4"></div>

    <div class="mt-3">
        <button class="btn btn-success me-2" onclick="exportar('xls')">📄 Exportar a Excel</button>
        <button class="btn btn-danger" onclick="exportar('pdf')">🧾 Exportar a PDF</button>
    </div>

</body>
</html>
