<%-- 
    Document   : inicioAlumno
    Created on : 19/11/2018, 05:10:52 PM
    Author     : hectorsama
--%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Alumno"/>
</jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
    </style>
    <body >
                   

        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width:1400px;">

            <!-- The Grid -->
            <div class="w3-row-padding">

                <!-- Left Column -->
                <div class="w3-third">

                    <div class="w3-white w3-text-grey w3-card-4">
                        <div class="w3-display-container">
                            
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-group fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Perfil</h2>                            
                            <div style="background-image: url(${foto}); width:50%; height:150px;margin-left:24%; margin-right: 24%;padding-top:5%;   margin-bottom: 5%; background-repeat: no-repeat " class="imagebox" > </div> 
                            <div class="w3-display-bottomleft w3-container w3-text-black">
                            </div>
                        </div>
                        <div class="w3-container">
                            <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>Alumno</p>
                            <p><i class="fa fa-rocket fa-fw w3-margin-right w3-large w3-text-teal"></i>${nombre} ${apellidoP} ${apellidoM}</p>
                            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${correo}</p>
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
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Tus cursos:</h2>
                        <div class="w3-container">
                            <h5 class="w3-opacity"><b>Curso</b></h5>
                            <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${nivel}<span class="w3-tag w3-teal w3-round"></span></h6>
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
<%@include file='footer.jsp'%>
