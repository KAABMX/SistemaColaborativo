<%-- 
    Document   : DenunciarAlumno
    Created on : 19/11/2018, 12:28:39 PM
    Author     : jrivera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Denuncia alumno"/>
</jsp:include>
<div>
    <p><i>${error}</i></p>
</div>
<div class="box1">
    <h3 class="section-heading">Tus alumnos: </h3>
    <p><i>Da click en el alumno para denunciarlo</i></p><br>
    <c:forEach items="${alumnoLista}" var="item">
        <pre>
             <li><a href="${pageContext.request.contextPath}/profesor/denunciarPP?id=${item.getPk_id_usuario()}"> ${item.getNombreC()} </a></li>
        </pre>
    </c:forEach>
</div>
<div>
    <form method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/profesor/nombreD">
        <h3 class="section-heading">Ingresa el nombre completo empezando por nombre, seguido de sus apellidos del usuario</h3>
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="text" name = "nombre" placeholder="nombre apellido apellido">
            <label class="mdl-textfield__label" for="">Nombre completo</label>
        </div>
        <br>
        <button class = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;width:70%;">
            Buscar
        </button>
    </form>
</div>
<%@include file='footer.jsp'%>
