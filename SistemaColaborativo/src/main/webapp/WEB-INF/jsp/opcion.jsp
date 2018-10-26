<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Elige Usuario"/>
</jsp:include>
<style>
    header{
        text-align: center;
    }
</style>
<header>
    <div align="center">
        <div class="android-more-section">
            <div class="android-section-title mdl-typography--display-1-color-contrast" >Elige el tipo de usuario</div>
            <div class="android-card-container mdl-grid" >
                <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media" >
                        <img src="<c:url value="/imagenes/alumno.jpg"/>">
                    </div>

                    <div class="mdl-card__title">
                        <h4 class="mdl-card__title-text">Alumno</h4>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <span class="mdl-typography--font-light mdl-typography--subhead">Registrate como alumno.</span>
                    </div>
                    <div class="mdl-card__actions">
                        <a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase" href="${pageContext.request.contextPath}/registrarAlumno">
                            continua
                            <i class="material-icons">chevron_right</i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="android-card-container mdl-grid">
                <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="<c:url value="/imagenes/profesor.jpg"/>">
                    </div>
                    <div class="mdl-card__title">
                        <h4 class="mdl-card__title-text">Profesor</h4>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <span class="mdl-typography--font-light mdl-typography--subhead">Registrate como profesor.</span>
                    </div>
                    <div class="mdl-card__actions">
                        <a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase" href="${pageContext.request.contextPath}/registrarProfesor">
                            continua
                            <i class="material-icons">chevron_right</i>
                        </a>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</header>
<%@include file='footer.jsp'%>
