function buscarEstado() {
    var estado = document.getElementById("estado").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../ServletBuscarEstado", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("resultadoEstado").innerHTML = xhr.responseText;
        }
    };
    xhr.send("estado=" + estado);
}
