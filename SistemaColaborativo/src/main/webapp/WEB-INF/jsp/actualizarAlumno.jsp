
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Actualizar datos."/>
</jsp:include>
<form action="${pageContext.request.contextPath}/actualizarAlumno" name="myForm" method="post" onsubmit="return(validate());">
    <div class="container-fluid">
        <div class="row">
            <div class="well center-block">
                <div class="well-header">
                    <center><h1> Actualizar datos </h1></center>
                    <hr>
                </div>                                            
                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="text" id="nombre" name="nombre" />
                        <label class="mdl-textfield__label" for="nombre">                            
                            Nombre
                        </label>
                    </div>
                </form>
                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="text" id="paterno" name="paterno" />
                        <label class="mdl-textfield__label" for="paterno">                            
                            Apellido Paterno
                        </label>
                    </div>
                </form>
                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="text" id="materno" name="materno"/>
                        <label class="mdl-textfield__label" for="materno">                            
                            Apellido Materno
                        </label>
                    </div>
                </form>


                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="email" id="correo" name="correo"/>
                        <label class="mdl-textfield__label" for="correo">                            
                            Correo
                        </label>
                        <span class="mdl-textfield__error">Por favor, usa un correo.</span>
                    </div>
                </form>

                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="password" id="contrasenya" name="contrasenya" 
                               pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>                        
                        <label class="mdl-textfield__label" for="contrasenya">                            
                            Contraseña
                        </label>
                        <span class="mdl-textfield__error">Contraseña (Mínimo 8 caracteres).</span>
                    </div>
                </form>


                <form action="#">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label center-block col-xs-12">
                        <input class="mdl-textfield__input" type="number" id="telefono" name="telefono" />                        
                        <label class="mdl-textfield__label" for="telefono">                            
                            Celular
                        </label>
                        <span class="mdl-textfield__error">Usa un telefono.</span>
                    </div>
                </form>               

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <label for="nivel">Sexo:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>

                                <select class="form-control" id="sexo" name="sexo" >
                                    <option>Femenino</option>
                                    <option>Masculino</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <label for="nivel">Nivel Academico:</label>
                            <div class="input-group">

                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div> 
                                <select class="form-control" id="nivel" name="nivel">
                                    <option>Primaria</option>
                                    <option>Secundaria</option>
                                    <option>Bachillerato</option>
                                    <option>Universidad</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="well-header">
                    <center><h3> Materias de interes </h3></center>
                    <hr>
                </div>

                <ul class="demo-list-control mdl-list">
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content">      
                            Matemáticas
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="matematicas">
                                <input type="checkbox" class="mdl-checkbox__input" name="matematicas" id="matematicas"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content">      
                            Español
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="espanol">
                                <input type="checkbox" class="mdl-checkbox__input" name="espanol" id="espanol" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content">      
                            Geografia
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="geografia">
                                <input type="checkbox" class="mdl-checkbox__input" name="geografia" id="geografia"/>
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item">
                        <span class="mdl-list__item-primary-content">      
                            Historia
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="historia">
                                <input type="checkbox" class="mdl-checkbox__input" name="historia" id="historia"/>
                            </label>
                        </span>
                    </li>
                </ul>


                <button id="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored " >
                    Actualizar
                </button>
            </div>
        </div>
    </div>
</form>
<%@include file='footer.jsp'%>
