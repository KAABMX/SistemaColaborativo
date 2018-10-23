<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
               
         <h3>Materias</h3>
          <div style="text-align:center;">

                          <div>
                          
                        <form action="${pageContext.request.contextPath}/alumno/pedirclase" >
                                      <div class="row">                                   
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <label for="tema">Materia</label>
                                              
                                              <div class="input-group">
                                                      <div class="input-group-addon">
                                                          <i class="glyphicon glyphicon-list-alt"></i>
                                                      </div>
                                                          <select class="mdl-textfield__input" id="tema" name="temaseleccionado" onchange="myFunction()">
                                                              <option style="display:none">
                                                              <c:forEach items="${temas}" var="tema">
                                                                  <option value="${tema.getIdtema()}">${tema.getTema()}</option>        
                                                              </c:forEach>
                                                          </select>
                                                          <script>
                                                                function myFunction() {
                                                                    var x = document.getElementById("tema").value;
                                                                    window.location.href ='${pageContext.request.contextPath}/alumno/prueba?valor='+x;
    
                                                                }
</script>
                                                              <select>
                                                                  <option value="hola">${t}</option>
                                                              </select>

                                                  </div>
                                                    <div class="form-group">
                                                        <label for="comment">Comentario:</label>
                                                        <textarea class="form-control" rows="5" id="comment" name="comentario">Comentario</textarea>
                                                        </div>                                            
                                          </div>
                                        
                                      
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                              <button id="button"  class="btn btn-primary btn-lg btn-block login-button">Pedir clase</button>
                                          </div>
                                          
                                     </div>
                                                          
                                             
                        </form>
                        </div>  

          </div>

<%@include file='footer.jsp'%>