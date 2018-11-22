<%-- 
    Document   : curriculum
    Created on : 3/10/2018, 03:04:12 PM
    Author     : Luis
--%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Profesor - Actualizar datos"/>
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
        <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/profesor/realizaactualizaprofesor">
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
                <select class="mdl-textfield__input" id="lugar" name="lugar" value="${curriculum.getLugar_de_nacimiento()}">
                    <option value="Aguascalientes">Aguascalientes</option>
                    <option value="Baja California">Baja California</option>
                    <option value="Baja California Sur">Baja California Sur</option>
                    <option value="Campeche">Campeche</option>
                    <option value="Coahuila de Zaragoza">Coahuila de Zaragoza</option>
                    <option value="Colima">Colima</option>
                    <option value="Chiapas">Chiapas</option>
                    <option value="Chihuahua">Chihuahua</option>
                    <option value="Distrito Federal" selected>Distrito Federal</option>
                    <option value="Durango">Durango</option>
                    <option value="Guanajuato">Guanajuato</option>
                    <option value="Guerrero">Guerrero</option>
                    <option value="Hidalgo">Hidalgo</option>
                    <option value="Jalisco">Jalisco</option>
                    <option value="México">México</option>
                    <option value="Michoacán de Ocampo">Michoacán de Ocampo</option>
                    <option value="Morelos">Morelos</option>
                    <option value="Nayarit">Nayarit</option>
                    <option value="Nuevo León">Nuevo León</option>
                    <option value="Oaxaca">Oaxaca</option>
                    <option value="Puebla">Puebla</option>
                    <option value="Querétaro">Querétaro</option>
                    <option value="Quintana Roo">Quintana Roo</option>
                    <option value="San Luis Potosí">San Luis Potosí</option>
                    <option value="Sinaloa">Sinaloa</option>
                    <option value="Sonora">Sonora</option>
                    <option value="Tabasco">Tabasco</option>
                    <option value="Tamaulipas">Tamaulipas</option>
                    <option value="Tlaxcala">Tlaxcala</option>
                    <option value="Veracruz de Ignacio de la Llave">Veracruz de Ignacio de la Llave</option>
                    <option value="Yucatán">Yucatán</option>
                    <option value="Zacatecas">Zacatecas</option>
                </select>
                <label class="mdl-textfield__label" for="lugar">Estado de origen</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <i><label class="mdl-card__title">Formación Académica</label></i>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "universidad" value="${estudios.getUniversidad()}" >
                <label class="mdl-textfield__label" for="sample3">Universidad</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_inicio" value="1996-08-01">
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de inicio de tus estudios</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input"  type="date" id="date" name="fecha_fin" value="1996-08-01">
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de fin de tus estudios</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <i><label class="mdl-card__title">Experiencia Laboral</label></i>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "empresa" value="${experiencia.getEmpresa()}">
                <label class="mdl-textfield__label" for="sample3">Empresa</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "funcion_trabajo" value="${experiencia.getFuncion_trabajo()}">
                <label class="mdl-textfield__label" for="sample3">Función realizada</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "tarea_trabajo" value="${experiencia.getTarea_trabajo()}">
                <label class="mdl-textfield__label" for="sample3">Tarea realizada</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_inicio_trabajo" value="1996-08-01">
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de inicio de tus labores</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_fin_trabajo" value="1996-08-01">
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de fin de tus labores</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" id="number" name="costo" value="${profesor.getCosto_x_hora().toString()}">
                <label class="mdl-textfield__label" for="sample3">Costo por hora (MXN)</label>
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
