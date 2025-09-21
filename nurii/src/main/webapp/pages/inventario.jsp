<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.BeanRepuesto" %>
<%@ page import="mysql.Sql_Repuesto" %>
<%@ page import="util.Lista" %>
<%
    Lista lis_rep = new Lista();
    Sql_Repuesto sqlRep = new Sql_Repuesto();
    BeanRepuesto beanRep = new BeanRepuesto();

    lis_rep = sqlRep.listarRepuestos();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Taller Mecánico</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/inventario.css" type="text/css">
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<script>
  		var contextPath = "<%= request.getContextPath() %>";
	</script>
	<script type="text/javascript" src="../ajax/gestInventario.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu_admin.jsp" %>

<div id="cuerpo">
    <div class="main-content">
        <div class="form-container container mt-3">
					    <div class="d-flex justify-content-end mb-3">
					        	<a href="regRepuesto.jsp" class="btn btn-success btn-sm">+ Nuevo Repuesto</a>
					   	</div>

	<form name="f_body" id="f_body" method="post" action="<%= request.getContextPath() %>/ServletEliRepuesto">
        <input type="hidden" name="txtId" value="<%=beanRep.getId_repuesto()%>">
	<div class="text-center mb-4">
	<h2 class="text-center mb-4">Inventario</h2>
        <table class="table table-striped table-bordered">
    		<thead class="table-primary">
        		<tr>
            		<th>ID</th>
            		<th>Nombre</th>
            		<th>Código</th>
            		<th>Stock</th>
            		<th>Stock mínimo</th>
            		<th>Acciones</th>
        		</tr>
    		</thead>
            <%
                for (int i = 0; i < lis_rep.getTamanio(); i++) {
                    beanRep = (BeanRepuesto) lis_rep.getElemento(i);
            %>
            <tr class="<%= beanRep.getStock() <= beanRep.getStock_minimo() ? "stock-bajo" : "" %>">
                <td><%= beanRep.getId_repuesto() %></td>
                <td><%= beanRep.getNombre() %></td>
                <td><%= beanRep.getCodigo() %></td>
                <td><%= beanRep.getStock() %></td>
                <td><%= beanRep.getStock_minimo() %></td>
                <td>
                    <a href="visRepuesto.jsp?id=<%= beanRep.getId_repuesto() %>" class="btn btn-sm btn-primary">Ver</a> |
                    <a href="actRepuesto.jsp?id=<%= beanRep.getId_repuesto() %>" class="btn btn-sm btn-warning">Editar</a> |
                    <button type="button" class="btn btn-sm btn-danger"
							onclick="javascript:enlaceEliminar('<%= beanRep.getId_repuesto() %>')">
							Eliminar
						</button>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    </form>
	</div>
</div>
</div>
    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>