<%-- 
    Document   : perfil
    Created on : Oct 5, 2018, 2:09:41 PM
    Author     : juan
--%>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Pagina Principal"/>
</jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mi Perfil</h1>
        <header class="masthead">
            <div class="header-content">
                <div class="header-content-inner">
                    <hr>
                    <p>Tu Nombre: ${nombre} </p>
                    <p>Tu Apellido Paterno: ${paterno} </p>
                    <p>Tu Apellido Materno: ${materno} </p>
                    <p>Tu Correo: ${correo}</p>
                </div>
            </div>
        </header>
    </body>

</html>
<%@include file='footer.jsp'%>