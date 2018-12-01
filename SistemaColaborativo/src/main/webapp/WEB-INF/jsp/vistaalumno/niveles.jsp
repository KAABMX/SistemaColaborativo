<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page='headerProfesores.jsp'>
    <jsp:param name="title" value="horarios"/>
</jsp:include>
<body >
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <div class="pt-5"></div>
    <section class="service py-5" id="service">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <h3  style="color: #51d88a">Asesorias por nivel educativo</h3>
                </div>
            </div>
            <div class="row pt-4">
                <c:forEach items="${niveles}" var="nivel">
                    <div class="col-md-4">
                        <div class="card">
                            <img class="card-img-top" src="https://proyectoeducere.files.wordpress.com/2016/11/pe2.png?w=480" alt=" ">
                            <div class="card-body">
                                <p>Contamos con los mejores profesores especializados en el área de interes.</p>
                                <a href="${pageContext.request.contextPath}/vermaterias?idnivel=${nivel.getIdnivel()}">${nivel.getNivel()}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
 <%@include file='footer.jsp'%>