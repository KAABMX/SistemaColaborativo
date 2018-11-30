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
              <h5 class="modal-title" id="exampleModalCenterTitle">Pedir clase</h5>
            </div>
            
              
            <form action="${pageContext.request.contextPath}/alumno/guardarclase" method="GET">
                <div class="modal-body">
                  <label for="exampleFormControlTextarea1">Selecciona una materia</label>
                  <select class="form-control form-control-lg" name="temaseleccionado">
                    <c:forEach items="${temas}" var="tema">
                        <option value="${tema.getIdtema()}">${tema.getTema()}</option> 
                    </c:forEach>
                   </select>
                    <div class="form-group">
                      <label for="message-text" class="col-form-label">Agrega un comentario:</label>
                      <textarea class="form-control" id="message-text"></textarea>
                    </div>                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary" name="idprofesorr" value="${idp}">Save changes</button>
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
                            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-group fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Perfil del Profesor</h2>
                            <img src="${foto}" style="width: 50%; margin-bottom:2%; "/>
                            
                            <p><i class="fa fa-id-card fa-fw w3-margin-right w3-large w3-text-teal"></i>${nombre} ${apellido} ${apellidoM}</p>
                            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${correo}</p>
                            <p><i class="fa fa-credit-card-alt fa-fw w3-margin-right w3-large w3-text-teal"></i>${precio} (MXN)</p>
                            
                            <hr>

                            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Niveles</b></p>
                            <c:forEach items="${niveles}" var="niv">
                                <p>${niv.getNivel()}</p>
                            </c:forEach>
                            <hr>

                            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Materias</b></p>
                            <c:forEach items="${temas}" var="tema">
                                <p>${tema.getTema()}</p>
                            </c:forEach>
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
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa  fa-id-badge fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Informacion</h2>
                        <div class="w3-container">
                            <h5 class="w3-opacity"><b>Universidad</b></h5>
                            <p>${universidad}</p>
                            <h5 class="w3-opacity"><b>Estudios</b></h5>
                            <p>${estudios}</p>
                            
                        <c:choose>
                            <c:when test="${log}">
                              <button id="button"  class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/loggea';">inicia sesion</button>
                            </c:when>

                            <c:otherwise>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nivel">Pedir clase</button>

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
