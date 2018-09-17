<%-- 
    Document   : registerProfesor
    Created on : 16/09/2018, 01:03:11 PM
    Author     : hectorsama
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/register.css"/>"> 
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>

        <!------ Include the above in your HEAD tag ---------->

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
                                        <input type="text" placeholder="Nombre" name="txtfname" class="form-control" required>

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
                                        <input type="text" placeholder="Apellido Paterno" name="txtlname" class="form-control" required>
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
                                        <input type="text" placeholder="Apellido Materno" name="txtlname" class="form-control" required>
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
                                            <i class="glyphicon glyphicon-phone"></i>
                                        </div>
                                        <input type="number" minlength="10" maxlength="12" class="form-control" name="txtmobile" placeholder="Celular">
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
                                  
                                        <select class="form-control" id="sexo" name="sexo" placeholder="Sexo">
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
                        <div class="input-group-addon">
                                            <i class="	glyphicon glyphicon-list-alt"></i>
                                              <label for="nivel">Niveles Educativos</label>
                                        </div>
                       
                         <div class="checkbox">
                            <label><input type="checkbox"  name="musica">Primaria</label>
                        </div>

                        <div class="checkbox">
                            <label><input type="checkbox" name="libros">Secundaria</label>
                        </div>

                        <div class="checkbox">
                            <label><input type="checkbox" name="peliculas">Bachillerato</label>
                        </div>
                                              <div class="checkbox">
                            <label><input type="checkbox" name="video">Universidad</label>
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
    </body>
</html>
