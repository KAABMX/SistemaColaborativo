<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
      <div class="android-be-together-section mdl-typography--text-center">
          <div class="logo-font android-slogan">Bienvenido al sitio</div>
          <div>
              <table>
                  <tr><td>dia</td><td>fecha inicio</td><td>fecha fin</td></tr>
                  <c:forEach items="${horarios}" var="horario">
                  <tr>
                      <td>${horario.getDia()}</td><td>${horario.getHoraInicio().toString()}</td><td>${horario.getHoraFin().toString()}</td>
                  </tr>                      
                      
                  </c:forEach>
                  
              </table>
              
              <a href="${pageContext.request.contextPath}/profesor/agregarhorario">agrega tu horario</a>

          </div>
          
          </div>
<%@include file='footer.jsp'%>