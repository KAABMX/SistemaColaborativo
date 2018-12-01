<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Pagina Principal"/>
</jsp:include>
<div class="pt-5" ></div>
<section class="banner bg-primary text-white py-5" id="banner" style="background-color:#51d88a">
    <div class="container py-5" >
        <div class="row">
            <div class="col-md-8" >
                <div class="pt-5"></div>
                <h3>BIENVENIDO A KAAB</h3>
                <h3>AQUI ENCONTRARAS LAS ASESORIAS QUE NECESITAS</h3>
                <p>EL MEJOR LUGAR PARA TU EDUCACIÓN</p>
                <button type="submit"class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath}/opcion'">REGISTRATE AHORA</button>
            </div>
            <div class="col-md-4">
                <img src="http://crownheights.info/assets/2018/01/classroom-resize-525x350.jpg">
            </div>
    
        </div>
    </div>
</section>

<section class="aboutus py-5 " id="aboutus">
    <div class="container">
        <div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-12" >
                <h3 style="color: #51d88a ">KAAB</h3>
                <h4>NOS IMPORTA TU EDUCACION</h4>
                <p>El mejor lugar para ponerte en contacto con tus profesores y ellos te puedan asesorar con tus materias</p>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6">
                <h5>Misión</h5>
                <p>Desarrollar el sistema de educación virtual, paralelo al presencial, que permita incrementar la calidad, pertinencia y relevancia de las actividades académicas y administrativas inherentes a la Universidad, a fin de contribuir a su mejora continua.</p>
            </div>
            <div class="col-md-6">
                <h5>Visión </h5>
                <p>Consolidar los programas y los proyectos institucionales bajo estándares internacionales para la educación virtual a fin de ofrecer carreras, servicios y otros programas desarrollados a través de las estrategias innovadoras en este entorno de aprendizaje.</p>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <img src="http://sphm-finder-site-production.s3-ap-southeast-1.amazonaws.com/2018/04/EHIS-Secondary-Science-Chemistry_071-750x500.jpg">
    </div>
    
</div>
    </div>
</section>

<%@include file='footer.jsp'%>