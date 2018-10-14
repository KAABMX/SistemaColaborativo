<%--Document   : Login
Created on : 30/09/2018, 03:57:50 PM
Author     : hectorsama
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Ver Profesores"/>
</jsp:include>
<html>

    <div class="box1">

        <h3>Estos son los profesores:  

        <c:forEach items="${profesor_lista}" var="item">
            ${item}<br>
        </c:forEach>


    </div>


</html>
