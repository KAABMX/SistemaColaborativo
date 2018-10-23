<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
<p>nombre: ${profesor.getUsuario().getNombreC()}</p>
<p>precio por hora: ${profesor.getCosto_x_hora()}</p>
<button id="button"  class="btn btn-primary btn-lg btn-block login-button" onclick="window.location.href = '${pageContext.request.contextPath}/alumno/pedirclase?idprofesor=${profesor.getPk_id_profesor()}';">pedir clase</button>

<%@include file='footer.jsp'%>