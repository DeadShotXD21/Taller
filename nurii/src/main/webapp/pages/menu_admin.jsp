<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Admin</title>
<link rel = "stylesheet" href = "../../css/admin_menu.css" type = "text/css">
</head>
<body>
    <div id="menu_admin">
        <a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="listarUsuario.jsp"><i class="fas fa-users"></i> Usuarios</a>
        <a href="inventario.jsp"><i class="fas fa-boxes"></i> Inventario</a>
        <a href="ordenes.jsp"><i class="fas fa-boxes"></i> Ordenes de Recepcion</a>
        <a href="facturacion.jsp"><i class="fas fa-file-invoice"></i> Facturación</a>
                <a href="#" onclick="confirmLogout()" class="btn btn-danger">
    <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
</a>

<script>
function confirmLogout() {
    if(confirm('¿Estás seguro de cerrar sesión?')) {
        window.location.href = '${pageContext.request.contextPath}/ServletLogout';
    }
}
</script>
    </div>
</body>
</html>