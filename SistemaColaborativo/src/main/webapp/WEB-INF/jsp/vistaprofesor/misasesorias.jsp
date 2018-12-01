<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="Mi Perfil" value="Página principal"/>
</jsp:include>
<h1>Mis asesorias</h1>
<c:forEach items="${asesorias}" var="asesoria">
  <div class="card">

    <div class="card-header" id="headingTwo">
			<table class="table">
  			<thead>
    			<tr>
      			<th scope="col">Nombre</th>
      			<th scope="col">Materia</th>
    			</tr>
  			</thead>
  			<tbody>
    			<tr>
      			<td>${asesoria.getAlumno().getUsuario().getNombreC()}</td>
      			<td>${asesoria.getTema().getTema()}</td>
  			</tbody>
			</table>    
	    	
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#${asesoria.toString()}" aria-expanded="false" aria-controls="${asesoria.toString()}">
          Ver mas
        </button>
      

    </div>
    <div id="${asesoria.toString()}" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
    	<h4 class="card-title">Comentario</h4>
    	<p>${asesoria.getComentario()}</p>      	
		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#${asesoria.toString()}aceptar">
  			Aceptar Asesoria
		</button>

<!-- Modal -->
<div class="modal fade" id="${asesoria.toString()}aceptar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top: 10%;">
  				<div class="modal-dialog modal-dialog-centered" role="document">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalCenterTitle">Aceptar Acesoria</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<form action="${pageContext.request.contextPath}/profesor/aceptarasesoria">
      						<div class="form-group">
      							<div class="modal-body">
  									<div class="form-group">

    									<label for="exampleFormControlTextarea1">Duracion</label>
                                                                        <input type = "number" class = "form-control bfh-number" name="duracion">
    									<label for="exampleFormControlTextarea1">Comentario</label>
                                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comentariorespuestaa"></textarea>
  									</div>	        							
      							</div>
      							<div class="modal-footer">
        							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary" name="idaa" value="${asesoria.toString()}">Save changes</button>
      							</div>
      						</div>
      					</form>
    				</div>
  				</div>
			</div>       

      
      
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#${asesoria.toString()}declinar">
  			Declinar Asesoria
		</button>

<!-- Modal -->
<div class="modal fade" id="${asesoria.toString()}declinar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top: 10%;">
  				<div class="modal-dialog modal-dialog-centered" role="document">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalCenterTitle">Declinar asesoria</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<form action="${pageContext.request.contextPath}/profesor/rechazarasesoria">
      						<div class="form-group">
      							<div class="modal-body">
  									<div class="form-group">
    									<label for="exampleFormControlTextarea1">Comentario</label>
                                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comentariorespuestar"></textarea>
  									</div>	        							
      							</div>
      							<div class="modal-footer">
        							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary" name="idar" value="${asesoria.toString()}">Save changes</button>
      							</div>
      						</div>
      					</form>
    				</div>
  				</div>
			</div>       

      </div>

    </div>


 </div>     
    
    
</c:forEach>

<%@include file='footer.jsp'%>
