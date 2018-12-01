<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="mis"/>
</jsp:include>
    <h1>Mis asesorias</h1>


  <div class="card">
    <div class="card-header" id="headingTwo">
			<table class="table">
  			<thead>
    			<tr>
      			<th scope="col">profesor</th>
      			<th scope="col">materia</th>
      			<th scope="col">estado</th>
      			<th scope="col">duracion</th>
      			<th scope="col">costo</th>
    			</tr>
  			</thead>
  			<tbody>
    			
                            <c:forEach items="${asesorias}" var="asesoria">
                            <tr>
                                <td>${asesoria.getProfesor().getUsuario().getNombreC()}</td>
                                <td>${asesoria.getTema().getTema()}</td>
                                <td>${asesoria.getEstado()}</td>
                                <td>${asesoria.getDuracion()} hrs</td>
                                <td>${asesoria.getCosto()} (MXN)</td>
                            </tr>
                            </c:forEach>
                            

  			</tbody>
			</table>    
	    	

      </div>
    </div>
  
