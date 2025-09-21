function buscarFechas() {
    var inicio = document.getElementById("fechaInicio").value;
    var fin = document.getElementById("fechaFin").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../ServletBuscarFechas", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("resultadoFechas").innerHTML = xhr.responseText;
        }
    };
    xhr.send("inicio=" + inicio + "&fin=" + fin);
}
