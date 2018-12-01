<%-- 
    Document   : inicioProfesor
    Created on : 5/10/2018, 11:12:05 PM
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Página principal"/>
</jsp:include>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
    </style>
    <body class="w3-light-grey">
  <!-- Nivel -->
      
  <div class="modal fade" tabindex="-1" id="nivel" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="margin-top: 10%">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle">Agregar Nivel</h5>
            </div>
            
              
            <form action="${pageContext.request.contextPath}/profesor/guardarnivel" method="GET">
                <div class="modal-body">
                  <label for="exampleFormControlTextarea1">Selecciona un nivel</label>
                  <select class="form-control form-control-lg" name="nivelseleccionado">
                    <c:forEach items="${todosniveles}" var="ni">
                        <option value="${ni.getIdnivel()}">${ni.getNivel()}</option>        
                    </c:forEach>
                   </select>                   
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
              </form>
            </div>
          </div>
      </div>       
                  
  <!-- Materia -->

<div class="modal fade" tabindex="-1" id="materia" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="margin-top:10% ">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalCenterTitle">Agregar Materia</h5>
          </div>


            <form action="${pageContext.request.contextPath}/profesor/guardartema">
              <div class="modal-body">
                <label for="exampleFormControlTextarea1">Selecciona una Materia</label>
                <select class="form-control form-control-lg" name="temaseleccionado">
                  <c:forEach items="${todostemas}" var="todotema">
                      <option value="${todotema.getIdtema()}">${todotema.getTema()}</option>        
                  </c:forEach>
                 </select>                   
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
              </div>
            </form>
          </div>
        </div>
    </div>                  

        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width:1400px;">

            <!-- The Grid -->
            <div class="w3-row-padding">

                <!-- Left Column -->
                <div class="w3-third">

                    <div class="w3-white w3-text-grey w3-card-4">
                        <div class="w3-display-container">
                            <div class="w3-display-bottomleft w3-container w3-text-black">
                            </div>
                        </div>
                        <div class="w3-container">
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-group fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Perfil</h2>                                                        
                            <div style="background-image: url(${foto}); width:50%; height:150px;margin-left:24%; margin-right: 24%;padding-top:5%;   margin-bottom: 5%; background-repeat: no-repeat " class="imagebox" > </div>                                                                                     
                            <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>Profesor</p>
                            <p><i class="fa fa-id-card fa-fw w3-margin-right w3-large w3-text-teal"></i>${nombre} ${apellido} ${apellidoM}</p>
                            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${correo}</p>
                            
                            <hr>

                            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Materias</b></p>
                            <c:forEach items="${temas}" var="tema">
                                <p>${tema.getTema()}</p>
                            </c:forEach>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#materia">Agrega una materia</button>
                            <hr>

                            
                            <br>
                        </div>
                    </div><br>

                    <!-- End Left Column -->
                </div>

                <!-- Right Column -->
                <div class="w3-twothird">

                    <div class="w3-container w3-card w3-white w3-margin-bottom">
                        <h2></h2>
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa  fa-id-badge fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Experiencia Laboral</h2>
                        <div class="w3-container">
                            <h5 class="w3-opacity"><b>Niveles Educativos</b></h5>
                    <c:forEach items="${niveles}" var="niv">
                        <p>${niv.getNivel()}</p>
                    </c:forEach>
                        
                           
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nivel">Agrega un Nivel</button>
                    <hr>    
                        </div>
                        
                    </div>

                    <!-- End Right Column -->
                </div>

                <!-- Right Column -->
                <div class="w3-twothird">

                    <div class="w3-container w3-card w3-white w3-margin-bottom">
                        <h2></h2>
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-cog  fa-spin fa-3x fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Perfil</h2>
                        <div class="w3-container">
                            <c:choose>              
                                <c:when test="${profesor.getEstaActivo()}">
                                    <p> <a href="${pageContext.request.contextPath}/profesor/actualizaprofesor">Actualiza tu perfil</a></p> 
                                </c:when>

                                <c:otherwise>
                                    <p><a href="${pageContext.request.contextPath}/profesor/curriculum">Completa tu perfil</a> </p>

                                </c:otherwise>
                            </c:choose>

                            <hr>
                        </div>
                    </div>

                    <!-- End Right Column -->
                </div>

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>


    </body>
</html>
<style>
    footer{
        text-align: center;
    }
</style>
<%@include file='footer.jsp'%>