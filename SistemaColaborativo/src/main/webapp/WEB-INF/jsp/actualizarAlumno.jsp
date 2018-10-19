<%-- 
    Document   : curriculum
    Created on : 3/10/2018, 03:04:12 PM
    Author     : Moctezuma19
--%>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Tu curriculum"/>
</jsp:include>
<div align='center' style="padding-top:50px;">
    <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp center-block" style="width:500px">
        <div class="mdl-card__title" style="background-color:#66b04f;" >
            <!--h4 class="mdl-card__title-text" style='color:white;'>Información Académica y Laboral</h4-->
        </div>
        <div class="mdl-card__supporting-text">
            <h2>Actualizar datos</h2>
        </div>
        <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/actualizarAlumno">            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "nombre">
                <label class="mdl-textfield__label" for="sample3">Nombre</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "paterno">
                <label class="mdl-textfield__label" for="sample3">Apellido paterno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "materno">
                <label class="mdl-textfield__label" for="sample3">Apellido materno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email" name = "correo">
                <label class="mdl-textfield__label" for="sample3">Correo</label>
            </div>            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="password" name = "contrasenya">
                <label class="mdl-textfield__label" for="sample3">Contraseña</label>
            </div>            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="tel" name = "telefono">
                <label class="mdl-textfield__label" for="sample3">Celular</label>
            </div>           
            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="lugar" name="sexo">
                    <option value="Femenino">Femenino</option>
                    <option value="Masculino">Masculino</option>                    
                </select>
                <label class="mdl-textfield__label" for="lugar">Sexo:</label>
            </div>                        
            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="lugar" name="nivel">
                                    <option value="Primaria">Primaria</option>
                                    <option value="Secundaria">Secundaria</option>
                                    <option value="Bachillerato">Bachillerato</option>
                                    <option value="Universidad">Universidad</option>                
                </select>
                <label class="mdl-textfield__label" for="lugar">Nivel academico:</label>
            </div>                        
            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <h3><label class="mdl-card__title">Materias de interes</label></h3>
            </div>
            <div>
                <ul class="mdl-list">
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Matemáticas
                        </span>
                        <span class="mdl-list__item-secondary-action"  style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-1">
                                <input type="checkbox" id="list-checkbox-1" class="mdl-checkbox__input" name="matematicas"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Español
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-2">
                                <input type="checkbox" id="list-checkbox-2" class="mdl-checkbox__input" name="espanol"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Geografia
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-3">
                                <input type="checkbox" id="list-checkbox-3" class="mdl-checkbox__input" name="geografia"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content" style="padding-left:90px;">
                            Historia
                        </span>
                        <span class="mdl-list__item-secondary-action" style="padding-right:80px;">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-4">
                                <input type="checkbox" id="list-checkbox-4" class="mdl-checkbox__input" name="historia"/>
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
