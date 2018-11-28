<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>

<style>
textarea {
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    font-size: 16px;
    resize: none;
}
</style>

<p>nombre: ${profesor.getUsuario().getNombreC()}
    <c:if test="${empty denunciar}">
        <button style="background-color: transparent; border: none; margin-left: 50px" data-toggle="modal" data-target="#exampleModalCenter"><img class="circle" title="denunciar" src="<c:url value="/imagenes/block.svg" />" style="width: 30px; height: 30px; " ></p> </button>        
    </c:if>
<p>precio por hora: ${profesor.getCosto_x_hora()}</p>
<button id="button"  class="btn btn-primary btn-lg btn-block login-button" onclick="window.location.href = '${pageContext.request.contextPath}/alumno/pedirclase?idprofesor=${profesor.getUsuario().getPk_id_usuario()}';">pedir clase</button>


<form action="${pageContext.request.contextPath}/denuncia" method="POST" >
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top: 10% ">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Quiero denunciar a este profesor porque</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!--          <input type="text" style="height:90px; width: 100%; white-space: nowrap;
  overflow: hidden; white-space: initial;">-->
        <textarea name="motivo"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">cerrar</button>
        <button type="submit" class="btn btn-primary">DENUNCIAR</button>
      </div>
    </div>
  </div>
</div>
        </form>

<%@include file='footer.jsp'%>