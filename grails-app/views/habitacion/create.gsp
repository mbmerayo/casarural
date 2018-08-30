<%@ page import="casarural.Categoria" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
<body>
<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card rounded-2">
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Alta Habitación</h3>
                        </div>
                        <div class="card-body">
                            <g:form controller="habitacion" action="save" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="planta">Planta</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:textField name="planta" id="planta" placeholder="Introduzca planta"
                                                     value="${habitacion.planta}" required="required" />
                                        <g:hasErrors bean="${habitacion}" field="planta">
                                            <g:eachError bean="${habitacion}" field="planta">
                                                <p style="color: red;"><g:message error="${it}"/></p>
                                            </g:eachError>
                                        </g:hasErrors>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="categoria">Categoria</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:select name="categoria.id" from="${casarural.Categoria.list()}"
                                                  optionValue="descripcion" optionKey="id"
                                                  id="categoria" required="required" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"
                                                    placeholder="Introduzca una descripción" value="${habitacion.descripcion}"/>
                                        <g:hasErrors bean="${habitacion}" field="descripcion">
                                            <g:eachError bean="${habitacion}" field="descripcion">
                                                <p style="color: red;"><g:message error="${it}"/></p>
                                            </g:eachError>
                                        </g:hasErrors>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-sm-8 col-9">
                                        <g:submitButton name="create" id="create" value="Crear" class="btn btn-primary btn-sm"/>
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
</body>
</html>
