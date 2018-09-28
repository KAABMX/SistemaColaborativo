<%-- 
    Document   : PerfilAlumno
    Created on : Sep 26, 2018, 12:20:42 PM
    Author     : juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Denuncia"/>
</jsp:include>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Denuncia</title>
    </head>
    <body>
    <div class="container">
	<div class="android-be-together-section mdl-typography--text-center">
        <h1>Continua con tu denuncia</h1>
        <textarea name="comentarios" rows="10" cols="40">Escribe aquí tus comentarios</textarea>
        </div>
    </div>
    </body>
    
</html>
<%@include file='footer.jsp'%>