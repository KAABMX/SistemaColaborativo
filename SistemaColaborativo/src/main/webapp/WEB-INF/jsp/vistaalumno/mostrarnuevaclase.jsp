<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Profesor - Actualizar datos"/>
</jsp:include>
<p>Profesor: ${asesoria.getAlumno()}</p>
<p>Alumno: ${asesoria.getProfesor()}</p>
<p>Materia: ${asesoria.getTema().getTema()}</p>
<p>Tema: ${asesoria.getComentario()}</p>
<p>Dia: ${asesoria.getHorario().getIddia().getDia()}</p>
<p>Hora: ${asesoria.getHorario().getHora()}</p>

<%@include file='footer.jsp'%>

