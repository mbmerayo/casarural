<%@ page import="casarural.Categoria" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <style>
        td.details-control {
            background: url('${resource(dir: "images", file: "add.png")}') no-repeat center center;
            cursor: pointer;
        }
        tr.shown td.details-control {
            background: url('${resource(dir: "images", file: "minus.png")}') no-repeat center center;
        }
        </style>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
    </head>
    <body>
    <div class="container py-5">
        <g:if test="${flash.error}">
            <div class="alert alert-danger fade alert-dismissible fade show" role="alert" style="display: block;">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                ${flash.error}
            </div>
        </g:if>
        <g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: block">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                ${flash.message}
            </div>
        </g:if>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card rounded" >
                            <div class="card-header text-center" style="background-color: #28a745;">
                                <h4 class="mb-0" style="color: white;">Lista de categorias</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive-xl">
                                    %{--<table id="datos" class="fixed-table-body dataTable no-footer dtr-inline" style="width:100%">--}%
                                    <table id="datos" class="uk-table uk-table-hover uk-table-striped" style="width: 100%">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>Id</th>
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Habitaciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${categoriaList}">
                                            <tr>
                                                <td class="details-control"></td>
                                                <td><a href="${createLink(action: 'show', id: it.id)}">${it.id}</a></td>
                                                <td>${it.descripcion}</td>
                                                <td>${it.precio}</td>
                                                <td>${it.habitaciones.size()}</td>
                                            </tr>
                                            <g:if test="${it.habitaciones.size()>0}">
                                                <g:each in="${it.habitaciones}" var="hab">
                                                <tr>
                                                    <td></td>
                                                    <td>Habitación ${hab.id}</td>
                                                    <td>${hab.id}</td>
                                                    <td>${hab.planta}</td>
                                                    <td>${hab.descripcion}</td>
                                                </tr>
                                                </g:each>
                                            </g:if>
                                        </g:each>
                                        </tbody>
                                    </table>
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