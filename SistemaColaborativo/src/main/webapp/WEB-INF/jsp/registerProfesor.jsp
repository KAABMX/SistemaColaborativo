<%-- 
    Document   : registerProfesor
    Created on : 16/09/2018, 01:03:11 PM
    Author     : hectorsama, luis
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
                                    <i class="glyphicon glyphicon-usd"></i>
                                </div>
                                <input type="number"  class="form-control" name="costo" placeholder="Costo"required>
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
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>

                                <select class="form-control" id="lugar" name="lugar">
                                

                                        <option value="Todo México">Todo México</option>

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
                                <input type="text"  class="form-control" id="estudios"name="estudios" placeholder="Estudios" required>
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
                                <label> Fecha inicio: Estudios Licenciatura </label>
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
                               <label> Fecha fin: Estudios Licenciatura </label>
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
                                <label>Fecha de inicio de trabajo</label>
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
                                <label>Fecha de finalización de trabajoi</label>
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
