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
    <title>Ver Repuesto</title>
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
                    <h3 class="mb-0">Detalle del Repuesto</h3>
                </div>
                <div class="card-body">
                    <form name="regFrm" method="post" action="<%= request.getContextPath() %>/ServletAgreRepuesto" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label">ID</label>
                            <input type="text" class="form-control" value="<%= beanRep.getId_repuesto() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" value="<%= beanRep.getNombre() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Código</label>
                            <input type="text" class="form-control" value="<%= beanRep.getCodigo() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Stock</label>
                            <input type="text" class="form-control" value="<%= beanRep.getStock() %>" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Stock mínimo</label>
                            <input type="text" class="form-control" value="<%= beanRep.getStock_minimo() %>" disabled>
                        </div>
                        <div class="d-grid">
                            <a href="inventario.jsp" class="btn btn-danger">Volver</a>
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