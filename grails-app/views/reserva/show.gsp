<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-reserva" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="reserva" />
    <g:form resource="${this.reserva}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.reserva}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>--}%
<%@ page import="casarural.Reserva.Estado" %>
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
                <div class="col-md-6 mx-auto">
                    <div class="card rounded">
                        <div class="card-header text-center" style="background-color: mediumseagreen;">
                            <h4 class="mb-0" style="color: white;">Reserva ${this.reserva.id}</h4>
                        </div>

                        <div class="card-body">
                            <g:form name="formulario" controller="reserva" id="${this.reserva.id}" method="post"
                                    role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="fechaInicio">Fecha de inicio</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk "
                                                                       style="font-size: 10px;color: red;"/></span>

                                    <div class="input-group date">
                                        <g:textField name="fechaInicio" id="fechaInicio"
                                                     value="${formatDate(format: "dd/MM/yyyy", date: reserva?.fechaInicio)}"/>
                                        %{--              class="datepicker-here" data-language="es"/>
                                         <div class="input-group-append">
                                             <button type="button"
                                                     class="btn btn-outline-secondary docs-datepicker-trigger"
                                                     disabled="">
                                                 <i class="fa fa-calendar" aria-hidden="true"></i>
                                             </button>
                                         </div>--}%
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="fechaFin">Fecha de fin</label>

                                    <div class="input-group date">
                                        <g:textField name="fechaFin" id="fechaFin"
                                                     value="${formatDate(format: "dd/MM/yyyy", date: reserva?.fechaFin)}"/>
                                        %{--class="datepicker-here" data-language="es"/>--}%
                                        %{--<div class="input-group-append">
                                            <button type="button"
                                                    class="btn btn-outline-secondary docs-datepicker-trigger"
                                                    disabled="">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>
                                            </button>
                                        </div>--}%
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="estado">Estado</label>

                                    <div class="input-group">
                                        <div class="input-group">
                                            <g:select name="estado" from="${Estado.values()}" optionKey="text"
                                                      value="${reserva?.estado?.text}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="usuario" class="bmd-label-floating">Usuario</label>
                                    <label>${reserva.user.username}</label>
                                    <label>${reserva.user.primerApellido}</label>
                                </div>

                                <div class="form-group">
                                    <button type="button" class="btn btn-outline-warning btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        Habitaciones
                                    </button>
                                </div>

                                <div class="offset-sm-6 col-9">
                                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                                        <g:actionSubmit value="Editar" action="update" onclick="update();"
                                                        class="btn btn-outline-success btn-sm"/>
                                    </sec:ifAnyGranted>
                                    <g:actionSubmit value="Cancelar" action="index"
                                                    class="btn btn-outline-danger btn-sm"/>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title" id="exampleModalLabel">Habitaciones</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="table-responsive-xl">
                    <table id="datos" class="table-condensed">
                        <thead>
                        <tr class="table-success">
                            <th scope="col" class="text-center">Id</th>
                            <th scope="col" class="text-center">Desripción</th>
                            <th scope="col" class="text-center">Planta</th>
                            <th scope="col" class="text-center">Categoría</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${reserva.habitaciones}" var="habitacion">
                            <tr>
                                <td class="text-center">${habitacion.id}</td>
                                <td class="text-center">${habitacion.descripcion}</td>
                                <td class="text-center">${habitacion.planta}</td>
                                <td class="text-center">${habitacion.categoria.descripcion}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<g:javascript>
    function update() {
        $("#formulario").append("<input name='_method' value='PUT' id='_method' type='hidden'>");
    }

    function borrar(id) {
        $("#formulario").append("<input name='_method' value='DELETE' id='_method' type='hidden'>");
        $("#formulario").prop('action', '/reserva/delete/' + id);
        $("#formulario").submit();
    }
</g:javascript>
</body>
</html>
