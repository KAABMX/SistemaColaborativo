<%-- 
    Document   : registerProfesor
    Created on : 16/09/2018, 01:03:11 PM
    Author     : hectorsama, luis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Registro de profesor"/>
</jsp:include>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css"/>"> 
    <title>Registro</title>
</head

<div class="login">
    <form action="${pageContext.request.contextPath}/registraProfesor" name="myForm" method="post" onsubmit="return(validate());">
        <p><input type="text" name="nombre" value="" placeholder="Nombre" class="form" required></p>
        <p><input type="text" name="paterno" value="" placeholder="Apellido Paterno" class="form" required></p>
        <p><input type="text" name="materno" value="" placeholder="Apellido Materno" class="form" required></p>
        <p><input type="email" name=correo value="" placeholder="Correo" class="form" required></p>
        <p><input type="password" class="form" minlength = 8 name="contrasenya" id="contrasenya"  placeholder="Contraseña (Mínimo 8 caracteres)" required></p>
        <p><input type="password" class="form" name="confirm" id="confirm"  placeholder=" Repetir Contraseña" required/></p>
        <div align = "center">
            <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> ¿Coinciden?
        </div>
        <button class="btn btn-primary tn-lg btn-block" id="button" type="" style="width: 100%">       Registrate        </button>
        <!--<p class="submit"><input type="submit" name="commit" value="Login"></p>-->

    </form>
</div>
<%@include file='footer.jsp'%>
