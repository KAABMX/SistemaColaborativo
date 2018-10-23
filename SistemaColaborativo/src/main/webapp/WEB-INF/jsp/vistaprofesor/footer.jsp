                <footer class="android-footer mdl-mega-footer">
                    <div class="mdl-mega-footer--middle-section">
                        <p class="mdl-typography--font-light">KAAB MX: 2018 Facultad de Ciencias, UNAM</p>
                        <p class="mdl-typography--font-light">Software en desarrollo.</p>
                    </div>

                    <div class="mdl-mega-footer--bottom-section">
                        <a class="android-link mdl-typography--font-light" href="">Políticas de Privacidad</a>
                    </div>

                </footer>
            </div>
        </div>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script>
            $("input[type=password]").keyup(function(){
	
	if($("#contrasenya").val().length >= 8){
		$("#8char").removeClass("glyphicon-remove");
		$("#8char").addClass("glyphicon-ok");
		$("#8char").css("color","#00A41E");
	}else{
		$("#8char").removeClass("glyphicon-ok");
		$("#8char").addClass("glyphicon-remove");
		$("#8char").css("color","#FF0004");
	}
		
	if($("#contrasenya").val() == $("#confirm").val()){
		$("#pwmatch").removeClass("glyphicon-remove");
		$("#pwmatch").addClass("glyphicon-ok");
		$("#pwmatch").css("color","#00A41E");
	}else{
		$("#pwmatch").removeClass("glyphicon-ok");
		$("#pwmatch").addClass("glyphicon-remove");
		$("#pwmatch").css("color","#FF0004");
	}
});
document.getElementById("boton").onchange = function () {
    document.getElementById("file").value = this.files[0].name;
};
        </script>
    </body>
</html>