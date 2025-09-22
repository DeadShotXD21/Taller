<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BeanRecepcion" %>
<%@ page import="mysql.Sql_Recepcion" %>
<%@ page import="util.Lista" %>
<%@ page import="java.util.List" %>
<%
    Sql_Recepcion sql = new Sql_Recepcion();
    List<BeanRecepcion> listaFinalizadas = sql.listarRecepciones("finalizado");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historial de Órdenes Finalizadas</title>
<link rel="stylesheet" href="../css/main.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="menu_cliente.jsp" />

<!-- Contenedor que empuja el footer hacia abajo -->
<div id="contenido" class="container mt-4">
    <h2 class="mb-3">Historial de Órdenes Finalizadas</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>DNI</th>
                <th>Cliente</th>
                <th>Vehículo</th>
                <th>Distrito</th>
                <th>Fecha de Inicio</th>
                <th>Fecha de Finalización</th>
                <th>Descripción</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (listaFinalizadas != null && !listaFinalizadas.isEmpty()) {
                    for (BeanRecepcion r : listaFinalizadas) {
            %>
            <tr>
                <td><%= r.getId_recepcion() %></td>
                <td><%= r.getDni() %></td>
                <td><%= r.getCliente() %></td>
                <td><%= r.getVehiculo() %></td>
                <td><%= r.getDistrito() %></td>
                <td><%= r.getFechaInicio() %></td>
                <td><%= r.getFechaFinalizacion() %></td>
                <td><%= r.getDescripcion() %></td>
                <td><%= r.getEstado() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="9">No hay órdenes finalizadas.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
