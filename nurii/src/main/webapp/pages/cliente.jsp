<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taller Mecánico</title>
    <link rel="stylesheet" href="../css/inicio.css" type="text/css">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css ">
    <style>
        /* Ajustes específicos para el contenido del cliente */
        #inicio-cliente {
            margin-top: 3rem;
            padding: 2rem 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
        }
        .acciones-cliente {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            justify-content: center;
        }
        .acciones-cliente li {
            background: #007BFF;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .acciones-cliente li:hover {
            transform: translateY(-5px);
        }
        .acciones-cliente a {
            color: black;
            text-decoration: none;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-weight: bold;
        }
        .acciones-cliente i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
    <%-- FONDO VIDEO --%>
    <video autoplay loop muted id="video_background">
        <source src="../videos/auto.mp4" type="video/mp4">
    </video>

    <%@ include file="header.jsp" %>
    <%@ include file="menu_cliente.jsp" %>

    <section id="inicio-cliente">
        <div class="container">
           	<h1>Bienvenido, <%= session.getAttribute("nombre") %></h1>
            <p>Desde tu panel de cliente puedes:</p>
            <ul class="acciones-cliente">
                <li><a href="recepcion.jsp"><i class="fas fa-tools"></i> Solicitar Orden de Servicio</a></li>
                <li><a href="historial.jsp"><i class="fas fa-history"></i> Ver Historial de Servicios</a></li>
                <li><a href="perfil_cliente.jsp"><i class="fas fa-user"></i> Mi Perfil</a></li>
            </ul>
        </div>
    </section>

    <!-- Redes sociales -->
    <div class="wsp">
        <a href="https://wa.me/918526203 " target="_blank">
            <img src="../images/whatsapp.png" alt="WhatsApp">
        </a>
    </div>
    <div class="ig">
        <a href="https://instagram.com/taller_mecanico " target="_blank">
            <img src="../images/instagram.png" alt="Instagram">
        </a>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        document.querySelectorAll('.card-flip').forEach(card => {
            card.addEventListener('click', () => {
                card.classList.toggle('flipped');
            });
        });
    </script>
</body>
</html>