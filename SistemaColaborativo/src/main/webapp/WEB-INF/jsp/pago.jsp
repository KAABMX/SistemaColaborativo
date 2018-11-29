<%-- 
    Document   : pago
    Created on : 24/10/2018, 06:16:38 PM
    Author     : jrivera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='headerS.jsp'>
    <jsp:param name="title" value="Pagina Principal"/>
</jsp:include>
<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/" >
    <div align="center">
        <table>
            <tr>
                <td style="padding-right:10px;">
                    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
                        <thead>
                            <tr>
                                <th class="mdl-data-table__cell--non-numeric">Forma de Pago</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric">Paypal</td>
                            </tr>
                            <tr>
                                <td class="mdl-data-table__cell--non-numeric">MasterCard</td>
                            </tr>
                        </tbody>   
                    </table>
                <td>
                    <table class = "mdl-data-table mdl-js-data-table" style="left:0;">
                        <thead>
                            <tr>
                                <th class="mdl-data-table__cell--non-numeric">Asesoría</th>
                                <th class="mdl-data-table__cell--non-numeric">Asesor</th>
                                <th class="mdl-data-table__cell--non-numeric">Cantidad (MXN)</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!--
                                <td class="mdl-data-table__cell--non-numeric"> ${asesor}</td>
                                <td class="mdl-data-table__cell--non-numeric"> ${asesoria}</td>
                                <td class="mdl-data-table__cell--non-numeric">$ ${cantidad}</td-->
                                <td class="mdl-data-table__cell--non-numeric"> Física Nuclear</td>
                                <td class="mdl-data-table__cell--non-numeric"> Rodrigo Rivera</td>
                                <td class="mdl-data-table__cell--non-numeric">$ 200.0</td>
                                <td>
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="background-color:#66b04f;">
                                        Pagar
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</form>
<%@include file='footer.jsp'%>
