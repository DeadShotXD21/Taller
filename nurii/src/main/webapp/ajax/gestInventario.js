function enlaceEliminar(id) {
    if (confirm("¿Estás seguro de eliminar este repuesto?")) {
        document.f_body.txtId.value = id;
        document.f_body.action = contextPath + "/ServletEliRepuesto";
        document.f_body.submit();
    }
}