<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Restaurante</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css ">
</head>
<body>
	<jsp:include page="header.jsp" />
    <%@ include file="menu_admin.jsp" %>

    <section id="dashboard-admin">
        <div class="container">
            <h1>Panel de Administración - Restaurante</h1>
            <div class="grid-3-col">
                <div class="card-admin">
                    <i class="fas fa-users fa-3x"></i>
                    <h2>Usuarios</h2>
                    <p>Gestiona meseros, cocineros y administradores.</p>
                    <a href="usuarios.jsp" class="btn">Ver Detalles</a>
                </div>
                <div class="card-admin">
                    <i class="fas fa-utensils fa-3x"></i>
                    <h2>Inventario</h2>
                    <p>Controla insumos y productos del restaurante.</p>
                    <a href="inventario.jsp" class="btn">Ver Inventario</a>
                </div>
                <div class="card-admin">
                    <i class="fas fa-receipt fa-3x"></i>
                    <h2>Pedidos</h2>
                    <p>Revisa y gestiona los pedidos de clientes.</p>
                    <a href="pedidos.jsp" class="btn">Ver Pedidos</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Redes sociales -->
    <div class="wsp">
        <a href="https://wa.me/918526203 " target="_blank">
            <img src="../images/whatsapp.png" alt="WhatsApp">
        </a>
    </div>
    <div class="ig">
        <a href="https://instagram.com/restaurante_demo " target="_blank">
            <img src="../images/instagram.png" alt="Instagram">
        </a>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
