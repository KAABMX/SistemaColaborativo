<%-- 
    Document   : denuncia
    Created on : 19/11/2018, 01:18:44 PM
    Author     : jrivera
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Denuncia alumno"/>
</jsp:include>
<div algin="center">
    <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp center-block" style="width:500px">
        <div class="mdl-card__title" style="background-color:#66b04f;" >
            <h4 class="mdl-card__title-text" style='color:white;'>Realiza tu denuncia</h4>
        </div>
        <div class="mdl-card__supporting-text">
            <span class="mdl-typography--font-light mdl-typography--subhead">
                Estas a punto de denunciar a un usuario, recuerda que tu explicación será revisada
                por la Administración del sitio, así que se lo más claro posible con tu
                denuncia, la denuncia es innamovible, una vez realizada, y de proceder, 
                la persona denunciada recibirá su denuncia correspondiente, si ha acumulado
                3 denuncias, y han sido aprobadas, el denunciado será dado de baja del sitio,
                el usuario ya no tendrá alguna relación de asesorado contigo.
            </span>
        </div>
        <form method="POST" enctype="multipart/form-data"action="${pageContext.request.contextPath}/profesor/realizaDenunciaP">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">    
                <c:choose>
                    <c:when test="${opt}">
                        <input class="mdl-textfield__input" type="text" value="${nombre_c}" readonly>
                        <label class="mdl-textfield__label" >Usuario</label>
                    </c:when>
                    <c:otherwise>
                        <input class="mdl-textfield__input" type="text" value="${nombreDenunciado}" readonly>
                        <label class="mdl-textfield__label" >Alumno</label>
                    </c:otherwise>
                </c:choose>

            </div>
            <c:choose>
                <c:when test="${opt}">
                    <input type="hidden" name ="ida" value="${id_buscado}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name ="ida" value="${idDenunciado}">
                </c:otherwise>
            </c:choose>
            <input type="hidden" name="opt" value="${opt}">
            <div class = "mdl-textfield mdl-js-textfield" style="padding-left:10px">  
                <textarea class="mdl-textfield_input" name ="exp" >
                </textarea>
                <label class="mdl-textfield__label">Explicanos tu situación: </label>
            </div>
            <div class="mdl-card__actions" style="padding-bottom:30px;">
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;width:70%;">
                    Denunciar
                </button>
            </div>
        </form>
    </div>
</div>
<%@include file='footer.jsp'%>
