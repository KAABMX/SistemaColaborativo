<%-- 
    Document   : informacion
    Created on : 19/11/2018, 07:36:53 PM
    Author     : hectorsama
--%>
<jsp:include page='header.jsp'>
    <jsp:param name="title" value="Información"/>
</jsp:include>
<body >
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<div class="pt-5"></div>

<section class="service py-5" id="service">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-12">
                <h3  style="color: #51d88a">Nuestros Servicios</h3>
                <p>Nuestro sitio te ayudará a tener éxito en tu vida académica , tenemos a los mejores profesores al alcance de un click...</p>
            </div>
        </div>
        <div class="row pt-4">
            <div class="col-md-4">
            <div class="card">
            <img class="card-img-top" src="http://noticias.universia.net.mx/net/images/educacion/l/la/las/las-matematicas-cambiaron-el-mundo.jpg" alt=" ">
            <div class="card-body">
                 <h6>Asesorias en Matemáticas</h6> 
                 <p>Contamos con los mejores profesores especializados en el área de interes.</p>
                 <button type="button" class="btn btn-link">Info.</button> 
            </div>
        </div>
    </div>
            <div class="col-md-4">
            <div class="card">
            <img class="card-img-top" src="https://estaticos.muyhistoria.es/media/cache/1140x_thumb/uploads/images/gallery/5ad871a95bafe8bd653c986a/libros-influyentes.jpg" alt=" ">
            <div class="card-body">
                 <h6>Historia</h6> 
                 <p>Contamos con los mejores profesores especializados en el área de interes.</p>
                 <button type="button" class="btn btn-link">Info.</button> 
            </div>
        </div>
    </div>
            <div class="col-md-4">
            <div class="card">
            <img class="card-img-top" src="http://www.bellasartes.uson.mx/oferta_artes_plasticas/img/4.jpg" alt=" ">
            <div class="card-body">
                 <h6>Artes</h6> 
                 <p>Contamos con los mejores profesores especializados en el área de interes.</p>
                 <button type="button" class="btn btn-link">Info.</button> 
            </div>
        </div>
    </div>
</div>
    </div>
</section>
<%@include file='footer.jsp'%>
