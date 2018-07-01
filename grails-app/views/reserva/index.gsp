<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-reserva" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${reservaList}" />

    <div class="pagination">
        <g:paginate total="${reservaCount ?: 0}" />
    </div>
</div>--}%
<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="card rounded">
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Lista de reservas</h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive-xl">
                                <table id="datos" class="table-condensed">
                                    <thead>
                                    <tr class="table-success">
                                        <th scope="col" class="text-center">Id</th>
                                        <th scope="col" class="text-center">Fecha</th>
                                        <th scope="col" class="text-center">Fecha Inicio</th>
                                        <th scope="col" class="text-center">Fecha Fin</th>
                                        <th scope="col" class="text-center">Estado</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:if test="${reservas}">
                                        <g:set var="listaReservas" value="${reservas}"/>
                                    </g:if>
                                    <g:else>
                                        <g:set var="listaReservas" value="${reservaList}"/>
                                    </g:else>
                                    <g:each in="${listaReservas}" var="reserva">
                                        <g:if test="${!usuarioVacio}">
                                        <tr>
                                            <td><a href="${createLink(action: 'show', id: reserva.id)}">${reserva.id}</a>
                                            </td>
                                            <td><g:formatDate format="dd/MM/yyyy" date="${reserva.fecha}"/></td>
                                            <td><g:formatDate format="dd/MM/yyyy" date="${reserva.fechaInicio}"/></td>
                                            <td><g:formatDate format="dd/MM/yyyy" date="${reserva.fechaFin}"/></td>
                                            <td>${reserva.estado}</td>
                                        </tr>
                                        </g:if>
                                    </g:each>
                                    </tbody>
                                </table>
                                <g:if test="${reservaCount > 10}">
                                    <div class="pagination">
                                        <g:paginate total="${reservaCount ?: 0}"/>
                                    </div>
                                </g:if>
                            </div>
                            <g:javascript>
                                $(document).ready(function () {
                                    $('#datos').DataTable({
                                        language: {
                                            "sProcessing": "Procesando...",
                                            "sLengthMenu": "Mostrar _MENU_ registros",
                                            "sZeroRecords": "No se encontraron resultados",
                                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                            "sInfoPostFix": "",
                                            "sSearch": "Buscar:",
                                            "sUrl": "",
                                            "sInfoThousands": ",",
                                            "sLoadingRecords": "Cargando...",
                                            "oPaginate": {
                                                "sFirst": "Primero",
                                                "sLast": "Último",
                                                "sNext": "Siguiente",
                                                "sPrevious": "Anterior"
                                            },
                                            "oAria": {
                                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                            }
                                        }
                                    });
                                });
                            </g:javascript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>