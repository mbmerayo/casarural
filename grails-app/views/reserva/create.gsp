<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker3.min.css"/>
        <script type="text/javascript" charset="UTF-8" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" charset="UTF-8" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.es.min.js"></script>
        %{--<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/i18n/datepicker.es-ES.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/i18n/datepicker.ca-ES.min.js.map"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.css"/>--}%

    </head>
    <body>
        %{--<a href="#create-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-reserva" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.reserva}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.reserva}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.reserva}" method="POST">
                <fieldset class="form">
                    <f:all bean="reserva"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>--}%
    <div class="container-fluid py-5">
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
            <div class="col-xl-12">
                %{--<div class="row">--}%
                    %{--<div class="col-md-6 mx-auto">--}%
                    <div class="col d-flex justify-content-center">
                        <div class="card rounded-2 mx-auto" style="width: max-content;">
                            <div class="card-header text-center" style="background-color: #28a745;">
                                <h4 class="mb-0" style="color: white;">Alta Reserva</h4>
                            </div>
                            <div class="card-body">
                                <g:form controller="reserva" action="save" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <label for="fechaInicio">Fecha de inicio</label>
                                        <div class="input-group date">
                                            %{--<g:datePicker name="fechaInicio" id="fechaInicio" value="${reserva?.fechaInicio}"/>--}%
                                            %{--<input id="fechaInicio" name="fechaInicio"--}%
                                                   %{--value="${formatDate(format:'MM/dd/yyyy',date:reserva?.fechaInicio)}"/>--}%
                                            <g:textField name="fechaInicio" id="fechaInicio" value="${reserva?.fechaInicio}" class="form-control input-lg"/>
                                            <div class="input-group-append">
                                                <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled="">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fechaFin">Fecha de fin</label>
                                        <div class="input-group date">
                                            %{--<g:datePicker name="fechaFin" id="fechaFin" value="${reserva?.fechaFin}"/>--}%
                                            <g:textField name="fechaFin" id="fechaFin" value="${reserva?.fechaInicio}" class="form-control input-lg"/>
                                            %{--<input id="fechaFin" name="fechaFin"--}%
                                                   %{--value="${formatDate(format:'MM/dd/yyyy',date:reserva?.fechaFin)}"/>--}%
                                            <div class="input-group-append">
                                                <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled="">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-9 col-9">
                                            <g:submitToRemote name="search" id="search" value="Buscar" url="[action: 'showAvaliableRooms']"
                                                              update="categorias" class="btn btn-info btn-sm"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div id="categorias"></div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-9 col-9">
                                            <g:submitButton name="create" id="create" value="Crear" class="btn btn-success btn-sm"/>
                                        </div>
                                    </div>
                                </g:form>
                            </div>
                        </div>
                    </div>
                %{--</div>--}%
            </div>
        </div>
    </div>
    <g:javascript>
        $('#fechaInicio').datepicker({
            format: 'dd/mm/yyyy',
            language: 'es',
            startDate: '0d'
        });
        $('#fechaFin').datepicker({
            format: 'dd/mm/yyyy',
            language: 'es',
            startDate: '0d'
        });
    </g:javascript>
    </body>
</html>
