<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
        <script type="application/javascript" charset="utf8" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card rounded-2">
                            <div class="card-header text-center" style="background-color: #28a745;">
                                <h3 class="mb-0" style="color: white;">Alta Reserva</h3>
                            </div>
                            <div class="card-body">
                                <g:form controller="reserva" action="save" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <label for="fechaInicio">Fecha de inicio</label>
                                        <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20px;color: red;"/></span>
                                        <div class="input-group">
                                            <g:textField name="fechaInicio" id="fechaInicio"
                                                         value="${reserva?.fechaInicio}"/>
                                            <g:hasErrors bean="${reserva}" field="fechaInicio">
                                                <g:eachError bean="${reserva}" field="fechaInicio">
                                                    <p style="color: red;"><g:message error="${it}"/></p>
                                                </g:eachError>
                                            </g:hasErrors>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fechaFin">Fecha de fin</label>
                                        <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20px;color: red;"/></span>
                                        <div class="input-group">
                                            <g:textField name="fechaFin" id="fechaFin"
                                                         value="${reserva?.fechaFin}"/>
                                            <g:hasErrors bean="${reserva}" field="fechaFin">
                                                <g:eachError bean="${reserva}" field="fechaFin">
                                                    <p style="color: red;"><g:message error="${it}"/></p>
                                                </g:eachError>
                                            </g:hasErrors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-8 col-9">
                                            <g:submitButton name="create" id="create" value="Crear" class="btn btn-success btn-sm"/>
                                        </div>
                                    </div>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <g:javascript>
        $( function() {
            $( "#fechaInicio" ).datepicker();
            $( "#fechaFin" ).datepicker();
        } );
    </g:javascript>
    </body>
</html>
