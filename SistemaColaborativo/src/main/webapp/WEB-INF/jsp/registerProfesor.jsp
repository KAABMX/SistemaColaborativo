<%-- 
    Document   : registerProfesor
    Created on : 16/09/2018, 01:03:11 PM
    Author     : hectorsama, luis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="Registro de profesor"/>
</jsp:include>
<div align='center' style="padding-top:50px;">
    <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp center-block" style="width:500px">
        <div class="mdl-card__title" style="background-color:#66b04f;" >
            <!--h4 class="mdl-card__title-text" style='color:white;'>Información Académica y Laboral</h4-->
        </div>
        <div class="mdl-card__supporting-text">
            <h2>Profesor</h2>
        </div>
        <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/registraProfesor">            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "nombre" id="nombre">
                <label class="mdl-textfield__label" for="nombre">Nombre</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "paterno" id="paterno">
                <label class="mdl-textfield__label" for="paterno">Apellido paterno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" id="materno">
                <input class="mdl-textfield__input" type="text" name = "materno">
                <label class="mdl-textfield__label" for="materno">Apellido materno</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="email" name = "correo">
                <label class="mdl-textfield__label" for="sample3">Correo</label>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="sexo" name="sexo" required>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                </select>       
                <label class="mdl-textfield__label" for="sexo">sexo</label>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="number" name = "telefono">
                <label class="mdl-textfield__label" for="sample3">telefono</label>
            </div>            
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="password" name = "contrasenya" id="password">
                <label class="mdl-textfield__label" for="password">Contraseña</label>
            </div>
            <div class="mdl-card__actions" style="padding-bottom:30px;">
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;width:70%;">
                    Registrar
                </button>
            </div>
        </form>
    </div>
</div>
<%@include file='footer.jsp'%>
