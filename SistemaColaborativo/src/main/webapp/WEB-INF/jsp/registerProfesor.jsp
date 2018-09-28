<%-- 
    Document   : registerProfesor
    Created on : 16/09/2018, 01:03:11 PM
    Author     : hectorsama
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Registro de profesor"/>
</jsp:include>
<form action="${pageContext.request.contextPath}/registraProfesor" name="myForm" method="post" onsubmit="return(validate());">
    <div class="container-fluid">
        <div class="row">
            <div class="well center-block">
                <div class="well-header">
                    <h3 class="text-center text-success"> Registro Profesor </h3>
                    <hr>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <input type="text" placeholder="Nombre" name="nombre" class="form-control" required>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <input type="text" placeholder="Apellido Paterno" name="paterno" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <input type="text" placeholder="Apellido Materno" name="materno" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-envelope"></i>
                                </div>
                                <input type="email" class="form-control"  name="correo" id="correo"  placeholder="Email" required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="	glyphicon glyphicon-warning-sign"></i>
                                </div>
                                <input type="password" class="form-control" minlength = 8 name="contrasenya" id="contrasenya"  placeholder="Contraseña (Mínimo 8 caracteres)" required/>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="	glyphicon glyphicon-warning-sign"></i>
                                </div>
                                <input type="password" class="form-control" name="confirm" id="confirm"  placeholder=" Repetir Contraseña" required/>
                            </div>
                            <div align = "center">
                                <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> ¿Coinciden?
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-phone"></i>
                                </div>
                                <input type="number" class="form-control" name="telefono">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>

                                <select class="form-control" id="sexo" name="sexo">
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
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <input type="text"  class="form-control" name="habilidades" placeholder="Habilidades">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                </div>
                                <input type="number"  class="form-control" name="costo" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group-addon">
                                <i class="glyphicon glyphicon-list-alt"></i>
                                <label for="nivel">Curriculum</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="nacimiento" placeholder="Lugar de nacimiento">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <label> Formación Académica </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="estudios" placeholder="Estudios" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="universidad" placeholder= "Universidad" required>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <i>Fecha de inicio de estudios</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="date"  class="form-control" name="fecha_inicio" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <i>Fecha de finalización de estudios</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="date"  class="form-control" name="fecha_fin" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <label> Experiencia profesional </label>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="empresa" placeholder= "Empresa" required>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="funcion_trabajo" placeholder= "Función" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="text"  class="form-control" name="tarea_trabajo" placeholder= "Tarea realizada" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <i>Fecha de inicio de trabajo</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="date"  class="form-control" name="fecha_inicio_trabajo" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <i>Fecha de finalización de trabajo</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="date"  class="form-control" name="fecha_fin_trabajo" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="input-group-addon">
                    <i class="	glyphicon glyphicon-list-alt"></i>
                    <label for="nivel">Niveles Educativos</label>
                </div>

                <div class="checkbox">
                    <label><input type="checkbox"  name="primaria">Primaria</label>
                </div>

                <div class="checkbox">
                    <label><input type="checkbox" name="secundaria">Secundaria</label>
                </div>

                <div class="checkbox">
                    <label><input type="checkbox" name="bachillerato">Bachillerato</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="universidadD">Universidad</label>
                </div>

                <div class="row widget">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <button id="button"  class="btn btn-primary btn-lg btn-block login-button">Registrate</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@include file='footer.jsp'%>