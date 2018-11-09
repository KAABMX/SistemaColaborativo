<%-- 
    Document   : curriculum
    Created on : 3/10/2018, 03:04:12 PM
    Author     : Luis
--%>
<jsp:include page='header.jsp'>
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
        <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/actualizaProfesor">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "nombre" >
                <label class="mdl-textfield__label" for="sample3">Nombre</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "paterno" >
                <label class="mdl-textfield__label" for="sample3">Apellido paterno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "materno" >
                <label class="mdl-textfield__label" for="sample3">Apellido materno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email" name = "correo" >
                <label class="mdl-textfield__label" for="sample3">Correo</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="tel" name = "telefono" >
                <label class="mdl-textfield__label" for="sample3">Telefono</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "sexo" >
                <label class="mdl-textfield__label" for="sample3">Sexo</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="password" name = "contrasenya" >
                <label class="mdl-textfield__label" for="sample3">Contraseña</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="lugar" name="lugar">
                    <option value="Aguascalientes">Aguascalientes</option>
                    <option value="Baja California">Baja California</option>
                    <option value="Baja California Sur">Baja California Sur</option>
                    <option value="Campeche">Campeche</option>
                    <option value="Coahuila de Zaragoza">Coahuila de Zaragoza</option>
                    <option value="Colima">Colima</option>
                    <option value="Chiapas">Chiapas</option>
                    <option value="Chihuahua">Chihuahua</option>
                    <option value="Distrito Federal">Distrito Federal</option>
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
                <input class="mdl-textfield__input" type="text" name = "estudios" >
                <label class="mdl-textfield__label" for="sample3">Estudios</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "universidad" >
                <label class="mdl-textfield__label" for="sample3">Universidad</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "habilidades" >
                <label class="mdl-textfield__label" for="sample3">Área(s) de especialidad</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_inicio" >
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de inicio de tus estudios</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input"  type="date" id="date" name="fecha_fin" >
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de fin de tus estudios</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <i><label class="mdl-card__title">Experiencia Laboral</label></i>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "empresa" >
                <label class="mdl-textfield__label" for="sample3">Empresa</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "funcion_trabajo" >
                <label class="mdl-textfield__label" for="sample3">Función realizada</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "tarea_trabajo" >
                <label class="mdl-textfield__label" for="sample3">Tarea realizada</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_inicio_trabajo" >
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de inicio de tus labores</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="date" id="date" name="fecha_fin_trabajo" >
            </div>
            <div class="mdl-card__supporting-text" >
                <span class="mdl-typography--font-light">Fecha de fin de tus labores</span>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" id="number" name="costo" >
                <label class="mdl-textfield__label" for="sample3">Costo por hora (MXN)</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" id="file" type="text" name="identificacion" style="left:0;" placeholder="Tu identificación"  readonly>
                <Label class="input-custom-file mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" style="right:0;background-color:#66b04f;">
                    Subir
                    <input type="file" id="boton" accept="image/jpeg, image/png" style="display:none;">
                </label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <i><label class="mdl-card__title">Niveles educativos de enseñanza</label></i>
            </div>
            <div>
                <ul class="mdl-list">
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Primaria
                        </span>
                        <span class="mdl-list__item-secondary-action"  style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-1">
                                <input type="checkbox" id="list-checkbox-1" class="mdl-checkbox__input" name="primaria"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Secundaria
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-2">
                                <input type="checkbox" id="list-checkbox-2" class="mdl-checkbox__input" name="secundaria"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Bachillerato
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-3">
                                <input type="checkbox" id="list-checkbox-3" class="mdl-checkbox__input" name="bachillerato"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Licenciatura
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-4">
                                <input type="checkbox" id="list-checkbox-4" class="mdl-checkbox__input" name="licenciatura"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Posgrado
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-5">
                                <input type="checkbox" id="list-checkbox-5" class="mdl-checkbox__input" name="posgrado"/>
                            </label>
                        </span>
                    </li>
                </ul>
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
