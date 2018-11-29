<%-- 
    Document   : inicioProfesor
    Created on : 5/10/2018, 11:12:05 PM
    Author     : juan
--%>
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

        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width:1400px;">

            <!-- The Grid -->
            <div class="w3-row-padding">

                <!-- Left Column -->
                <div class="w3-third">

                    <div class="w3-white w3-text-grey w3-card-4">
                        <div class="w3-display-container">
                            <img src=${foto} style="width:100%" alt="Avatar">
                            <div class="w3-display-bottomleft w3-container w3-text-black">
                            </div>
                        </div>
                        <div class="w3-container">
                            <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>Profesor</p>
                            <p><i class="fa fa-id-card fa-fw w3-margin-right w3-large w3-text-teal"></i>${nombre} ${apellidoP} ${apellidoM}</p>
                            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${correo}</p>
                            <hr>

                            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Habilidades</b></p>
                            <p>Matematicas</p>
                            <div class="w3-light-grey w3-round-xlarge w3-small">
                                <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:70%">70%</div>
                            </div>
                            <p>Fisica</p>
                            <div class="w3-light-grey w3-round-xlarge w3-small">
                                <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:80%">
                                    <div class="w3-center w3-text-white">70%</div>
                                </div>
                            </div>
                            <p>Quimica</p>
                            <div class="w3-light-grey w3-round-xlarge w3-small">
                                <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
                            </div>
                            <p>Biologia</p>
                            <div class="w3-light-grey w3-round-xlarge w3-small">
                                <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:50%">50%</div>
                            </div>
                            <br>

                            <p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>Idiomas</b></p>
                            <p>Ingles</p>
                            <div class="w3-light-grey w3-round-xlarge">
                                <div class="w3-round-xlarge w3-teal" style="height:24px;width:100%"></div>
                            </div>
                            <p>Español</p>
                            <div class="w3-light-grey w3-round-xlarge">
                                <div class="w3-round-xlarge w3-teal" style="height:24px;width:55%"></div>
                            </div>
                            <p>Aleman</p>
                            <div class="w3-light-grey w3-round-xlarge">
                                <div class="w3-round-xlarge w3-teal" style="height:24px;width:25%"></div>
                            </div>
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
                            <p><a>Primaria</a></p>
                           <p> <a>Secundaria</a></p>
                            <p><a>Preparatoria</a></p>

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
                            <p><a href="${pageContext.request.contextPath}/profesor/mostrarhorario">Gestiona tu perfil de trabajo</a></p>
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