<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
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
        <link rel="stylesheet" href="/css/styles.css">
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

            <div class="android-header mdl-layout__header mdl-layout__header--waterfall">
                <div class="mdl-layout__header-row">
                    <span class="android-title mdl-layout-title">
                        <img class="android-logo-image" src="../imagenes/android-logo.png"> <!--Cambiar por el logo de la aplicacion-->
                    </span>
                    <!-- Add spacer, to align navigation to the right in desktop -->
                    <div class="android-header-spacer mdl-layout-spacer"></div>
                    <div class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
                        <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
                            <i class="material-icons">search</i>
                        </label>
                        <div class="mdl-textfield__expandable-holder">
                            <input class="mdl-textfield__input" type="text" id="search-field">
                        </div>
                    </div>
                    <!-- Navigation -->
                    <div class="android-navigation-container">
                        <nav class="android-navigation mdl-navigation">
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Asesorías</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Asesores</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Información</a>
                            <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Registrarse</a><!--Quitarse al estar logueado en el sistema-->
                        </nav>
                    </div>
                    <span class="android-mobile-title mdl-layout-title">
                        <img class="android-logo-image" src="../imagenes/android-logo.png">
                    </span>
                    <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
                        <i class="material-icons">more_vert</i>
                    </button>
                    <!--
                    <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
                      <li class="mdl-menu__item">5.0 Lollipop</li>
                      <li class="mdl-menu__item">4.4 KitKat</li>
                      <li disabled class="mdl-menu__item">4.3 Jelly Bean</li>
                      <li class="mdl-menu__item">Android History</li>
                    </ul>-->
                </div>
            </div>

            <div class="android-drawer mdl-layout__drawer">
                <span class="mdl-layout-title">
                    <img class="android-logo-image" src="../imagenes/android-logo-white.png"> <!--Cambiar por el logo de la aplicacion-->
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

            <div class="android-content mdl-layout__content">
                <a name="top"></a>
                <jsp:include page="${param.content}.jsp"/>
                <footer class="android-footer mdl-mega-footer">
                    <div class="mdl-mega-footer--middle-section">
                        <p class="mdl-typography--font-light">KAAB MX: 2018 Facultad de Ciencias, UNAM</p>
                        <p class="mdl-typography--font-light">Software aún en desarrollo.</p>
                    </div>

                    <div class="mdl-mega-footer--bottom-section">
                        <a class="android-link mdl-typography--font-light" href="">Políticas de Privacidad</a>
                    </div>

                </footer>
            </div>
        </div>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </body>
</html>
