<%-- 
    Document   : registrar
    Created on : 6/10/2018, 10:07:35 AM
    Author     : dani3
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <form:form>
            <p>
                <form:label path="username">username</form:label>
                <form:input path="username" />
            </p>
            <p>
                <form:label path="correo">correo</form:label>
                <form:input path="correo" />
            </p>  
            <p>
                <form:label path="nombre">nombre</form:label>
                <form:input path="nombre" />
            </p>  
            <p>
                <form:label path="direccion">direccion</form:label>
                <form:input path="direccion" />
            </p>    
            <p>
                <form:label path="contrasena">contrasena</form:label>
                <form:input path="contrasena" />
            </p>               
            <p>
                <form:label path="tipoUsuario">tipoUsuario</form:label>
                <form:input path="tipoUsuario" />
            </p>               
            <hr>
            <form:button>enviar</form:button>
        </form:form>
    
</html>
