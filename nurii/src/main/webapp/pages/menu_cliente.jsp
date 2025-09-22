<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Menú Cliente</title>
<link rel="stylesheet" href="../../css/menu_cliente.css" type="text/css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div id="menu_cliente">
    <a href="cliente.jsp" class="active"><i class="fas fa-home"></i> Inicio</a>
    <a href="recepcion.jsp"><i class="fas fa-receipt"></i> Recepción</a>
    <a href="historial.jsp"><i class="fas fa-history"></i> Historial</a>
    <a href="perfil_cliente.jsp"><i class="fas fa-user"></i> Perfil</a>
    <a href="#" onclick="confirmLogout()" class="btn-logout">
        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
    </a>
</div>

<script>
function confirmLogout() {
    if(confirm('¿Estás seguro de cerrar sesión?')) {
        window.location.href = '${pageContext.request.contextPath}/ServletLogout';
    }
}
</script>

</body>
</html>
