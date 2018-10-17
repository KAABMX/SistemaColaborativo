<%-- 
    Document   : indexusuario
    Created on : 1/10/2018, 09:46:21 AM
    Author     : juan
--%>

<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Página principal"/>
</jsp:include>
      <div class="android-be-together-section mdl-typography--text-center">
          <div class="logo-font android-slogan">Bienvenido al sitio ${nombre}</div>
          <div class="logo-font android-sub-slogan">Aquí encontraras lo mejor sobre asesorías ...</div>
          </div>
<%@include file='footer.jsp'%>