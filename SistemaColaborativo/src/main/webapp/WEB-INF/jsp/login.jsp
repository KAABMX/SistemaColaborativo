 <%--Document   : Login
Created on : 30/09/2018, 03:57:50 PM
Author     : hectorsama, luis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Inicia Sesión"/>
</jsp:include>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css"/>"> 
        <title>Registro</title>
    <hgroup>
        <h1>Bienvenido</h1>
    </hgroup>
    <div class="login">
        <form action="${pageContext.request.contextPath}/login" method="POST" class="login-form">
            <p><input type="text" name="username" value="" placeholder="Correo"></p>
            <p><input type="password" name="password" value="" placeholder="Contraseña"></p>
            <p class="remember_me">
            </p>
            <button class="btn btn-primary tn-lg btn-block" id="Login" type="" style="width: 100%">Iniciar Sesión</button>
        </form>
    </div>
<hgroup>
  <h1>Bienvenido</h1>
</hgroup>
                <div class="login">
                 <form action="${pageContext.request.contextPath}/login" method="POST" class="login-form">
              <p><input type="text" name="username" value="" placeholder="Correo"></p>
              <p><input type="password" name="password" value="" placeholder="Contraseña"></p>
              <p class="remember_me">
                <label>
                  <input type="checkbox" name="remember_me" id="remember_me">
                 ¡No me olvides!
                </label>

              </p>
              <button class="btn btn-primary tn-lg btn-block" id="Login" type="" style="width: 100%">       Login        </button>
              <!--<p class="submit"><input type="submit" name="commit" value="Login"></p>-->

            </form>
              </div>
</html>