<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
<p>nombre: ${profesor.getUsuario().getNombreC()}</p>
<p>precio por hora: ${profesor.getCosto_x_hora()}</p>
<button type="button" class="btn btn-primary btn-lg" onclick="${pageContext.request.contextPath}/alumno/pedirclase">Pedir clase</button>

<%@include file='footer.jsp'%>