<%-- 
    Document   : inicioProfesor
    Created on : 5/10/2018, 11:12:05 PM
    Author     : hectorsama
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
              <title>${param.title}</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
                <!-- Page styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.min.css">
        <link rel="stylesheet"  type = "text/css" href="<c:url value="/css/styles.css"/>">
       <link rel="stylesheet" type="text/css" href="<c:url value="/css/register.css"/>"> 
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>      
        <style>
            #view-source {
                position: fixed;
                display: block;
                right: 0;
                bottom: 0;
                margin-right: 40px;
                margin-bottom: 40px;
                z-index: 900;
            }
        </style>
    </head>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
         <div class="android-drawer mdl-layout__drawer">
                <span class="mdl-layout-title">
                </span>
                        <nav class="mdl-navigation">
                    <div class="android-drawer-separator"></div>
                    <span class="mdl-navigation__link" href="">Perfil</span>
                    <a class="mdl-navigation__link" href="">Ver Perfil</a>
                    <a class="mdl-navigation__link" href="">Editar Perfil</a>
                    <div class="android-drawer-separator"></div>
                    <span class="mdl-navigation__link" href="">Asesorías</span>
                    <a class="mdl-navigation__link" href="">Recomendaciones</a>
                    <a class="mdl-navigation__link" href="">Ver Mis Asesorías</a>
                    <div class="android-drawer-separator"></div>
                    <span class="mdl-navigation__link" href="">Ayuda</span>
                    <a class="mdl-navigation__link" href="">Realizar Denuncia</a>
                    <span class="mdl-navigation__link" href="">Sesión</span>
                    <a class="mdl-navigation__link" href="">Salir</a>
                </nav>
         </div>
        </div>
    </body>
</html>