function buscarCliente() {
    var dni = document.getElementById("dni").value;
    var apellido = document.getElementById("apellido").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../ServletBuscarCliente", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("resultadoCliente").innerHTML = xhr.responseText;
        }
    };
    xhr.send("dni=" + dni + "&apellido=" + apellido);
}

function exportar(tipo) {
    // Lógica para exportar: redirige a un servlet u otro recurso
    alert("Exportar a " + tipo.toUpperCase() + " aún no implementado");
}
