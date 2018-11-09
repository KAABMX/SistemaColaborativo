<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
<div class="card" style="width:100%">
    <div class="card-header">

    </div>
    <ul class="list-group list-group-flush">
        <c:forEach items="${niveles}" var="nivel">
            <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/alumno/vermaterias?idnivel=${nivel.getIdnivel()}">${nivel.getNivel()}</a>
            </li>          
        </c:forEach>

    </ul>
</div>

<%@include file='footer.jsp'%>