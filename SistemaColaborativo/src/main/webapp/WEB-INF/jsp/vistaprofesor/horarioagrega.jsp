<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
    <div align='center' style="padding-top:50px;">        
      <form action="${pageContext.request.contextPath}/profesor/guardarhorario" >
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </div>
                                <input type="time"  class="form-control" name="horaInicio" required>
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
                                <input type="time"  class="form-control" name="horaFin" required>
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
                                    <select class="mdl-textfield__input" id="dia" name="dia">
                                        <option value="Lunes">Lunes</option>
                                        <option value="Martes">Martes</option>
                                        <option value="Miercoles">Miercoles</option>
                                        <option value="Jueves">Jueves</option>
                                        <option value="Viernes">Viernes</option>
                                        <option value="Sabado">Sabado</option>
                                        <option value="Domingo">Domingo</option>
                                    </select>
                            </div>
                        </div>
                    </div>
                </div>    
                <div class="row widget">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <button id="button"  class="btn btn-primary btn-lg btn-block login-button">AgregaHorario</button>
                    </div>
                </div>                    
                </div>          
          </form>
          </div>
          
          </div>
<%@include file='footer.jsp'%>