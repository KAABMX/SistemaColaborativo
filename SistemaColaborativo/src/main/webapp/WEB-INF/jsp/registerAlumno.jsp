<%-- 
Document   : register
Created on : 13/09/2018, 06:07:15 PM
Author     : hectorsama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Registro de alumno"/>
</jsp:include>
        <form action="${pageContext.request.contextPath}/registra" name="myForm" method="post" onsubmit="return(validate());">
            <div class="container-fluid">
                <div class="row">
                    <div class="well center-block">
                        <div class="well-header">
                            <h3 class="text-center text-success"> Registro Alumno </h3>
                            <hr>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-user"></i>
                                        </div>
                                        <input type="text" placeholder="Nombre" name="nombre" id="nombre" class="form-control" required>

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
                                        <input type="text" placeholder="Apellido Paterno" name="paterno" id="paterno" class="form-control" required>
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
                                        <input type="text" placeholder="Apellido Materno" name="materno"  id="materno" class="form-control" required>
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
                                        <input type="password" minlength = 8 class="form-control"  name="contrasenya" id="contrasenya"  placeholder="Contraseña (Mínimo 8 caracteres)" required/>
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
                                        <input type="password" class="form-control"  name="confirm" id="confirm"  placeholder=" Repetir Contraseña" required/>
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
                                        <input type="number" minlength=10 maxlength=12 class="form-control" name="telefono" id="telefono" placeholder="Celular">
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
                        
                            <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                              <label for="nivel">Materias de interes:</label>
                                        </div>
                       
                         <div class="checkbox">
                            <label><input type="checkbox"  name="matematicas" id="matematicas">Matemáticas</label>
                        </div>

                        <div class="checkbox">
                            <label><input type="checkbox" name="espanol" id="espanol">Español</label>
                        </div>

                        <div class="checkbox">
                            <label><input type="checkbox" name="geografia" id="geografia">Geografía</label>
                        </div>
                                              <div class="checkbox">
                                                  <label><input type="checkbox" name="historia" id="historia">Historia</label>
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
