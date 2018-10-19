<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
      <div class="android-be-together-section mdl-typography--text-center">
          <h3>horarios</h3>
          <div style="text-align:center;">
              <table class="table" style="width:50%" >
                  <tr>
                      <td>dia</td>
                      <td>fecha inicio</td>
                      <td>fecha fin</td>
                      <td style="width: 10%"></td>
                      <td rowspan="${horarios.size()}" style="width: 40%">
                          <div>
                          
                        <form action="${pageContext.request.contextPath}/profesor/guardarhorario" >
                                      <div class="row">
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <div class="form-group">
                                                  <label for="inicio">Hora Inicio</label>
                                                  <div class="input-group">
                                                      <div class="input-group-addon">
                                                          <i class="glyphicon glyphicon-pencil"></i>
                                                      </div>
                                                      <input type="time"  class="form-control" name="horaInicio" id="inicio" required>
                                                  </div>
                                              </div>
                                          </div>
                                      
                                      
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <div class="form-group">
                                                  <label for="fin">Hora Fin</label>
                                                  <div class="input-group">
                                                      <div class="input-group-addon">
                                                          <i class="glyphicon glyphicon-pencil"></i>
                                                      </div>
                                                      
                                                      <input type="time"  class="form-control" name="horaFin" id="fin" required>
                                                  </div>
                                              </div>
                                          </div>
                                      
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <label for="dia">dia</label>
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
                                        
                                      
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <button id="button"  class="btn btn-primary btn-lg btn-block login-button">AgregaHorario</button>
                                          </div>
                                          
                                     </div>
                                                          
                                             
                        </form>
                          </div>
                      </td>
                 
                  
                  </tr>
                  <c:forEach items="${horarios}" var="horario">
                  <tr>
                      <td>${horario.getDia()}</td><td>${horario.getHoraInicio().toString()}</td><td>${horario.getHoraFin().toString()}</td>
                  </tr>                      
                      
                  </c:forEach>
              </table>           
          </div>
                        <%-------------------------------------------%>
                        
                        
                        
         <h3>temas</h3>
          <div style="text-align:center;">
              <table class="table" style="width:50%" >
                  <tr>
                      <td>temas</td>
                      <td style="width: 10%"></td>
                      <td rowspan="${temas.size()}" style="width: 40%">
                          <div>
                          
                        <form action="${pageContext.request.contextPath}/profesor/guardartema" >
                                      <div class="row">                                   
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <label for="tema">Tema</label>
                                                  <div class="input-group">
                                                      <div class="input-group-addon">
                                                          <i class="glyphicon glyphicon-list-alt"></i>
                                                      </div>
                                                          <select class="mdl-textfield__input" id="tema" name="temaseleccionado">
                                                              <c:forEach items="${todostemas}" var="todotema">
                                                                  <option value="${todotema.getIdtema()}">${todotema.getTema()}</option>        
                                                              </c:forEach>
                                                          </select>
                                                  </div>
                                             
                                          </div>
                                        
                                      
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <button id="button"  class="btn btn-primary btn-lg btn-block login-button">AgregaTema</button>
                                          </div>
                                          
                                     </div>
                                                          
                                             
                        </form>
                          </div>
                      </td>
                 
                  
                  </tr>
                  <c:forEach items="${temas}" var="tema">
                  <tr>
                      <td>${tema.getTema()}</td>
                  </tr>                      
                      
                  </c:forEach>
                  
              </table>
          </div>                                      
                                      

      
      
      
      
      </div>
<%@include file='footer.jsp'%>