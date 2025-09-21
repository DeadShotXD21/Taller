<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Admin TecnoFix</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css ">
    <style>
        /* Estilos específicos para el dashboard */
        #video_background {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
            object-fit: cover;
        }

        #dashboard-admin {
            padding: 3rem 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin: 2rem;
        }

        .grid-3-col {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .card-admin {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card-admin:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .card-admin i {
            color: #007bff;
            margin-bottom: 1rem;
        }

        .btn {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            background: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #0056b3;
        }

        .wsp, .ig {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

    </style>
</head>
<body>
    <video autoplay loop muted id="video_background">
        <source src="../videos/auto.mp4" type="video/mp4">
    </video>

    <%@ include file="header.jsp" %>
    <%@ include file="menu_admin.jsp" %>

    <section id="dashboard-admin">
        <div class="container">
            <h1>Panel de Administración</h1>
            <div class="grid-3-col">
                <div class="card-admin">
                    <i class="fas fa-user-cog fa-3x"></i>
                    <h2>Usuarios</h2>
                    <p>Gestiona clientes, mecánicos y administradores.</p>
                    <a href="usuarios.jsp" class="btn">Ver Detalles</a>
                </div>
                <div class="card-admin">
                    <i class="fas fa-warehouse fa-3x"></i>
                    <h2>Inventario</h2>
                    <p>Controla repuestos y materiales.</p>
                    <a href="inventario.jsp" class="btn">Ver Inventario</a>
                </div>
                <div class="card-admin">
                    <i class="fas fa-file-invoice-dollar fa-3x"></i>
                    <h2>Facturación</h2>
                    <p>Revisa facturas y pagos.</p>
                    <a href="facturacion.jsp" class="btn">Ver Facturas</a>
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
        <a href="https://instagram.com/taller_mecanico " target="_blank">
            <img src="../images/instagram.png" alt="Instagram">
        </a>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>