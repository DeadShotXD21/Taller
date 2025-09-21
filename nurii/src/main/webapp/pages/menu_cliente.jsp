<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Cliente</title>
<link rel = "stylesheet" href = "../../css/estilo.css" type = "text/css">
</head>
<body>
    <div id="menu_cliente">
        <a href="cliente.jsp"><i class="fas fa-tachometer-alt"></i> Inicio</a>
        <a href="recepcion.jsp"><i class="fas fa-tachometer-alt"></i> Recepcion</a>
        <a href="historial.jsp"><i class="fas fa-tachometer-alt"></i> Historial</a>
        <a href="perfil_cliente.jsp"><i class="fas fa-tachometer-alt"></i> Perfil</a>
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