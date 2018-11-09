<style>
    header{
        text-align: center;
    }
</style>
<footer class="android-footer mdl-mega-footer">

    <header>
        <div class="mdl-mega-footer--middle-section">
            <p class="mdl-typography--font-light">KAAB MX: 2018 Facultad de Ciencias, UNAM</p>
            <p class="mdl-typography--font-light">Software en desarrollo.</p>
        </div>

        <div class="mdl-mega-footer--bottom-section">
            <a class="android-link mdl-typography--font-light" href="">Políticas de Privacidad</a>
        </div>
    </header>

</footer>
</div>
</div>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script>
    document.getElementById("subir").onchange = function () {
        var imagen = new FileReader();
        var visor = document.getElementById('canvas');

        imagen.onload = function (e) {
            visor.src = e.target.result;
        };

        imagen.readAsDataURL(this.files[0]);
        document.getElementById("file").value = this.files[0].name;
    };
    document.getElementById("boton").onchange = function () {
        document.getElementById("file").value = this.files[0].name;
    };
</script>
</body>
</html>
