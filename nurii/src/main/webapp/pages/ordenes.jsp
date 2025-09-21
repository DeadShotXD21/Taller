<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.BeanRecepcion" %>
<%@ page import="mysql.Sql_Recepcion" %>
<%@ page import="util.Lista" %>
<%@ page import="java.util.List" %>
<%
    Sql_Recepcion sql = new Sql_Recepcion();
    List<BeanRecepcion> lista = sql.listarRecepciones("");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Órdenes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu_admin.jsp" %>

<div class="container mt-4">
    <h2 class="mb-3">Órdenes de Recepción</h2>

    <form method="post" action="<%= request.getContextPath() %>/ServletCambiarEstado">
    	<div class="d-flex justify-content-end mb-2">
            <button type="submit" class="btn btn-success">Actualizar todos los estados</button>
    	</div>
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
                    if (lista != null && !lista.isEmpty()) {
                        for (BeanRecepcion r : lista) {
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
                    <td>
                        <select name="estado_<%= r.getId_recepcion() %>" class="form-select form-select-sm" style="width:auto;">
                            <option value="pendiente" <%= "pendiente".equals(r.getEstado()) ? "selected" : "" %>>Pendiente</option>
                            <option value="finalizado" <%= "finalizado".equals(r.getEstado()) ? "selected" : "" %>>Finalizado</option>
                        </select>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr><td colspan="9">No hay registros.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>