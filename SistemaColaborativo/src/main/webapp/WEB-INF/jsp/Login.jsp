<%-- 
    Document   : Login
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
<form>
  <div class="group">
    <input type="text"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <div class="group">
    <input type="email"><span class="highlight"></span><span class="bar"></span>
    <label>Contraseña</label>
  </div>
  <button type="button" class="button buttonBlue">Ingresa
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
</form>
<BR/>
</html>
