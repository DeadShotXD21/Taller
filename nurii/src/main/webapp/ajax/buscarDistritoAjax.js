function buscarDistrito() {
    var distrito = document.getElementById("distrito").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../ServletBuscarDistrito", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("resultadoDistrito").innerHTML = xhr.responseText;
        }
    };
    xhr.send("distrito=" + distrito);
}
