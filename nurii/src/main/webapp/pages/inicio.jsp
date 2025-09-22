<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>El Rincón Del Pato</title>
    <link rel="stylesheet" href="../css/inicio.css" type="text/css">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<section id="inicio">
    <div class="container">
        <h1>El Rincón Del Pato</h1>
        <p>En El Rincón del Pato, te ofrecemos la auténtica gastronomía criolla del campo, con sabores tradicionales y platos preparados con pasión. Disfruta de una experiencia cálida.</p>
    </div>
</section>

<section class="grid-2x2">
    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/Seco_de_cabrito.png');">
                    <div class="overlay">
                        <h2>NOSOTROS</h2>
                    </div>
                </div>
                <div class="card-back">
			    <div class="card-front" style="background-image: url('../images/Card-fond.jpg'); font-weight: bold;">
			        <ul style="margin-left: 50px; margin-right: 80px;">
			          En nuestro restaurante, nos dedicamos a ofrecer los más auténticos sabores típicos del norte, preparados con ingredientes frescos y tradición familiar. Con años de experiencia, garantizamos un servicio cálido y una experiencia culinaria inolvidable.
			        </ul>
			    </div>
			</div>

                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/Shambar.png');">
                    <div class="overlay">
                        <h2>POR QUE ELEGIRNOS</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front"  style="background-image: url('../images/Card-fond.jpg');color: white; font-weight: bold;">
                        <div class="overlay-back">
                        <ul style="margin-left: 20px; margin-right: 70px;">
                           	<ul>✔ Comida auténtica del norte</ul>
							<ul>✔ Ingredientes frescos y locales</ul>
							<ul>✔ Atención cálida y familiar</ul>
							<ul>✔ Precios justos y accesibles</ul>
							<ul>✔ Experiencia culinaria tradicional</ul>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/Sopa_seca.png');">
                    <div class="overlay">
                        <h2>MISIÓN</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/Card-fond.jpg');font-weight: bold;">
                        <ul style="margin-left: 50px; margin-right: 80px;">Brindar una experiencia gastronómica de alta calidad y accesible, garantizando la satisfacción del comensal mediante platos tradicionales, preparados con ingredientes frescos y locales, en un ambiente acogedor y auténtico.</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/Seco_de_cabrito.png');">
                    <div class="overlay">
                        <h2>VISIÓN</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/Card-fond.jpg');font-weight: bold;">
                        <ul style="margin-left: 50px; margin-right: 80px;">Ser reconocidos como el restaurante líder en gastronomía típica del norte, destacando por la excelencia de nuestros platos, la autenticidad de nuestras recetas y el compromiso con la satisfacción de nuestros comensales.</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Redes sociales -->
<div class="wsp">
    <a href="https://wa.me/918526203" target="_blank">
        <img src="../images/whsp.png" alt="WhatsApp">
    </a>
</div>
<div class="ig">
    <a href="https://instagram.com/taller_mecanico" target="_blank">
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

