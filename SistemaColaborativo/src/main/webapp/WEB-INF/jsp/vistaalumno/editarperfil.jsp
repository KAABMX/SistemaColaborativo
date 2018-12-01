<%-- 
    Document   : curriculum
    Created on : 3/10/2018, 03:04:12 PM
    Author     : Luis
--%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Alumno - Actualizar datos"/>
</jsp:include>
<div align='center' style="padding-top:50px;">
    <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp center-block" style="width:500px">
        <div class="mdl-card__title" style="background-color:#66b04f;" >
            <!--h4 class="mdl-card__title-text" style='color:white;'>Información Académica y Laboral</h4-->
        </div>
        <div class="mdl-card__supporting-text">
            <span class="mdl-typography--font-light mdl-typography--subhead">Actualizar datos</span>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <i><label class="mdl-card__title">Datos generales</label></i>
        </div>        
        <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/alumno/realizaactualizaalumno">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "nombre" value="${usuario.getNombre()}">
                <label class="mdl-textfield__label" for="sample3">Nombre</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "paterno" value="${usuario.getApellido_p()}" >
                <label class="mdl-textfield__label" for="sample3">Apellido paterno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "materno" value="${usuario.getApellido_m()}">
                <label class="mdl-textfield__label" for="sample3">Apellido materno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email" name = "correo" value="${usuario.getCorreo()}">
                <label class="mdl-textfield__label" for="sample3">Correo</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "interes" value="${alumno.getIntereses()}">
                <label class="mdl-textfield__label" for="sample3">interes Academico</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "nivel" value="${alumno.getUltimo_nivel_educativo()}">
                <label class="mdl-textfield__label" for="sample3">Ultimo nivel Academico</label>
            </div>
            <div class="mdl-card__actions" style="padding-bottom:30px;">
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;width:70%;">
                    Actualizar
                </button>
            </div>
        </form>
    </div>
</div>
<%@include file='footer.jsp'%>
