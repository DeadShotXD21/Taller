<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.BeanRepuesto"%>
<%@ page import="mysql.Sql_Repuesto"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BeanRepuesto beanRep = new BeanRepuesto();
    Sql_Repuesto sqlRep = new Sql_Repuesto();
    beanRep = sqlRep.obtenerRepuesto(id);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Repuesto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div id="cuerpoform">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Actualizar Repuesto</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="<%= request.getContextPath() %>/ServletActRepuesto" class="needs-validation" novalidate>
                        <input type="hidden" name="txtId" value="<%= beanRep.getId_repuesto() %>">
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="txtNombre" value="<%= beanRep.getNombre() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Código</label>
                            <input type="text" class="form-control" name="txtCodigo" value="<%= beanRep.getCodigo() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Stock</label>
                            <input type="number" class="form-control" name="txtStock" value="<%= beanRep.getStock() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Stock mínimo</label>
                            <input type="number" class="form-control" name="txtStockMinimo" value="<%= beanRep.getStock_minimo() %>" required>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">Actualizar</button>
                            <a href="inventario.jsp" class="btn btn-danger">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>