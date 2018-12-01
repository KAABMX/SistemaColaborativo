<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="denuncias"/>
</jsp:include>
    <h1>Denuncias</h1>


  <div class="card">
    <div class="card-header" id="headingTwo">
			<table class="table">
  			<thead>
    			<tr>
      			<th scope="col">Matricula</th>
      			<th scope="col">profesor</th>
      			<th scope="col">Motivo</th>
      			<th scope="col"></th>
    			</tr>
  			</thead>
  			<tbody>
    			
                            <c:forEach items="${denuncias}" var="d">                         
                            <form id="sample3" method="post" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/elimina">
                                <tr>
                                <input type="hidden" name="idprofesor" value="${d.getProfesor().getUsuario().getPk_id_usuario()}">
                                    <td>${d.getProfesor().getUsuario().getPk_id_usuario()}</td>                                
                                    <td>${d.getProfesor().getUsuario().getNombre()}</td>                                
                                    <td>${d.getMotivo()}</td>                                
                                    <td><button type="submit" class="btn btn-outline-danger">Eliminar</button></td>                                
                                </tr>
                            </form>
                            </c:forEach>
                            

  			</tbody>
			</table>    
	    	

      </div>
    </div>
  