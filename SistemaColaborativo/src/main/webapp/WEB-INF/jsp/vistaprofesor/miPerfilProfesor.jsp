<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="Mi Perfil" value="Página principal"/>
</jsp:include>
      <div class="android-be-together-section mdl-typography--text-center">
          <p>nombre: ${usuario.getNombre()}</p>
           <a href="${pageContext.request.contextPath}/profesor/mostrarhorario">gestiona tu perfil de trabajo</a>
           <br>
          <c:choose>
              <c:when test="${profesor.getEstaActivo()}">
                  <a href="${pageContext.request.contextPath}/profesor/actualizaprofesor">actualiza tu perfil</a> 
              </c:when>
                 
              <c:otherwise>
                  <a href="${pageContext.request.contextPath}/profesor/curriculum">completa tu perfil</a> 
                  
              </c:otherwise>
          </c:choose>
      </div>
<%@include file='footer.jsp'%>
