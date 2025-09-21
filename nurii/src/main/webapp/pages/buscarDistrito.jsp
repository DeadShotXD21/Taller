<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar por Distrito</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../ajax/buscarDistritoAjax.js"></script>
</head>
<body class="container mt-5">
    <h2 class="mb-4">📍 Buscar Cliente y Vehículo por Distrito</h2>
    
    <div class="row mb-3">
        <div class="col-md-6">
            <label for="distrito" class="form-label">Distrito:</label>
            <select class="form-select" id="distrito">
                <option value="">Seleccione un distrito</option>
                <option value="Lima">Lima</option>
                <option value="Callao">Callao</option>
                <option value="San Isidro">San Isidro</option>
                <!-- Puedes agregar más distritos aquí -->
            </select>
        </div>
        <div class="col-md-6 d-flex align-items-end">
            <button class="btn btn-primary w-100" onclick="buscarDistrito()">Buscar</button>
        </div>
    </div>

    <div id="resultadoDistrito" class="mt-4"></div>

    <div class="mt-3">
        <button class="btn btn-success me-2" onclick="exportarDistrito('xls')">📄 Exportar a Excel</button>
        <button class="btn btn-danger" onclick="exportarDistrito('pdf')">🧾 Exportar a PDF</button>
    </div>

</body>
</html>
