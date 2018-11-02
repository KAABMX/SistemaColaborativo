<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="Profesor - Actualizar datos"/>
</jsp:include>
<div align='center' style="padding-top:50px;">
    <div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp center-block" style="width:500px">
        <div class="mdl-card__title" style="background-color:#66b04f;" >
            <!--h4 class="mdl-card__title-text" style='color:white;'>Pedir clase</h4-->
        </div>
        <div class="mdl-card__supporting-text">
            <span class="mdl-typography--font-light mdl-typography--subhead">Pedir clase</span>
        </div>        
        <form id="sample3" style="width:500px" enctype="multipart/form-data" action="${pageContext.request.contextPath}/alumno/guardarclase">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="dia" name="dia" onchange="myFunction()">
                    <c:forEach items="${dias}" var="dia">
                    <option value="${dia.getIddia()}">${dia.dia}</option>
                    </c:forEach>
                </select>
                <script>
                    function myFunction() {
                        var x = document.getElementById("dia").value;
                        window.location.href ='${pageContext.request.contextPath}/alumno/pedirclase?idprofesor=1&diasse='+x;
                    }
                </script>                
                <label class="mdl-textfield__label" for="dia">Dia</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="hora" name="hora" >
                    <c:forEach items="${horarios}" var="hora">
                        <option value="${hora.getIdHorario()}">${hora.getHora().toString()}</option>
                    </c:forEach>
                </select>                
                <label class="mdl-textfield__label" for="hora">Hora</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <select class="mdl-textfield__input" id="materia" name="tema" >
                    <c:forEach items="${temas}" var="tema">
                        <option value="${tema.getIdtema()}">${tema.getTema()}</option>
                    </c:forEach>
                </select>
                <label class="mdl-textfield__label" for="materia">Materia</label>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" name = "comentario" >
                <label class="mdl-textfield__label" for="comentario">comentario</label>
            </div>
            <div class="mdl-card__actions" style="padding-bottom:30px;">
                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;width:70%;">
                    Solicitar clase
                </button>
            </div>
        </form>
    </div>
</div>
<%@include file='footer.jsp'%>
