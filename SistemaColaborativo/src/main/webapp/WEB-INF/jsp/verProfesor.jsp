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
        <h3 class="section-heading">Los nombres son: </h3>
        <c:forEach items="${profeLista}" var="item">
            <pre>
             <li><a href="https://example.com"> ${item} </a></li>
             <prev> 
                 <h4 style="color:#A9ABA6"> ${correo}</h4>
            </prev>
            </pre>
        </c:forEach>
    </div>
</html>
