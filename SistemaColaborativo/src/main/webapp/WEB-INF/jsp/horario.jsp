<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
      <div class="android-be-together-section mdl-typography--text-center">
          <div class="logo-font android-slogan">Bienvenido al sitio</div>
          <div>
              <table>
                <tr><td>dia</td><td>hora inicio</td><td>hora fin</td></tr>
                <c:forEach items="${horarios}" var="horario">
                    <tr>
                        <td>${horario.getDia()}</td><td>${horario.getHoraInicio()}</td><td>${horario.getHoraFin()}</td>
                    </tr>
                </c:forEach>
              </table>
          </div>
          
          </div>
<%@include file='footer.jsp'%>