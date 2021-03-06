<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#list-habitacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-habitacion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${habitacionList}" />

            <div class="pagination">
                <g:paginate total="${habitacionCount ?: 0}" />
            </div>
        </div>--}%

<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="card rounded" >
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Lista de habitaciones</h3>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive-xl">
                                <table id="datos" class="table-condensed">
                                    <thead>
                                    <tr class="table-success">
                                        <th scope="col" class="text-center">Id</th>
                                        <th scope="col" class="text-center">Descripción</th>
                                        <th scope="col"class="text-center">Planta</th>
                                        <th scope="col"class="text-center">Categoría</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${habitacionList}">
                                        <tr>
                                            <td class="text-center"><a href="${createLink(action: 'show', id: it.id)}">${it.id}</a></td>
                                            <td class="text-center">${it.descripcion}</td>
                                            <td class="text-center">${it.planta}</td>
                                            <td class="text-center">${it.categoria.descripcion}</td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                                <g:if test="${habitacionCount > 10}">
                                    <div class="pagination">
                                        <g:paginate total="${habitacionCount ?: 0}" />
                                    </div>
                                </g:if>
                            </div>
                            <g:javascript>
                                $(document).ready( function () {
                                    $('#datos').DataTable({
                                        language: {
                                            "sProcessing":     "Procesando...",
                                            "sLengthMenu":     "Mostrar _MENU_ registros",
                                            "sZeroRecords":    "No se encontraron resultados",
                                            "sEmptyTable":     "Ningún dato disponible en esta tabla",
                                            "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                            "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                                            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                                            "sInfoPostFix":    "",
                                            "sSearch":         "Buscar:",
                                            "sUrl":            "",
                                            "sInfoThousands":  ",",
                                            "sLoadingRecords": "Cargando...",
                                            "oPaginate": {
                                                "sFirst":    "Primero",
                                                "sLast":     "Último",
                                                "sNext":     "Siguiente",
                                                "sPrevious": "Anterior"
                                            },
                                            "oAria": {
                                                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                            }
                                        }
                                    });
                                    // Add event listener for opening and closing details
                                    $('#datos tbody').on('click', 'td.details-control', function () {
                                        var tr = $(this).closest('tr');
                                        var row = table.row( tr );

                                        if ( row.child.isShown() ) {
                                            // This row is already open - close it
                                            row.child.hide();
                                            tr.css('display','none');
                                        }
                                        else {
                                            // Open this row
                                            row.child.show();
                                            tr.addClass('shown');
                                            tr.css('display','block');
                                        }
                                    } );
                                } );
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