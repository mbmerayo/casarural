<%@ page import="casarural.Categoria" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
<body>
%{--<a href="#create-habitacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>--}%
%{--<div id="create-habitacion" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.habitacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.habitacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.habitacion}" method="POST">
                <fieldset class="form">
                    <f:all bean="habitacion"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>--}%
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
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                    <div class="input-group">
                                        <input type="number" class="form-control" name="planta" id="planta"
                                               placeholder="Introduzca la planta" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="categoria">Categoria</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:select name="categoria.id" from="${casarural.Categoria.list()}"
                                                  optionValue="descripcion" optionKey="id"
                                                  id="categoria" required="required" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-sm-8 col-9">
                                        <g:submitButton name="create" id="create" value="Crear" class="btn btn-success btn-lg"/>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>


            %{--<div class="panel panel-primary">
                <div class="panel-heading">
                    --}%%{--<div class="row text-center">
                        <a href="#" class="active" id="register-form-link">Alta habitación</a>
                    </div>
                    <hr>--}%%{--
                    <div class="row text-center">
                    <h3 class="panel-title">Alta Habitación</h3>
                </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <g:form controller="habitacion" action="save" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="planta">Planta</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" name="planta" id="planta" placeholder="Introduzca la planta" required>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="categoria">Categoria</label>
                                    <div class="input-group">
                                        --}%%{--<input type="email" class="form-control" id="InputEmailFirst" name="InputEmail" placeholder="Enter Email" required>--}%%{--
                                        --}%%{--value="${habitacion?.categoria?.id}" --}%%{--
                                        <g:select name="categoria.id" from="${casarural.Categoria.list()}"
                                                  optionValue="descripcion" optionKey="id"
                                                  id="categoria" required="required" class="form-control"/>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <div class="input-group">
                                        --}%%{--<input type="email" class="form-control" id="InputEmailSecond" name="InputEmail" placeholder="Confirm Email" required>--}%%{--
                                        <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"/>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <g:submitButton name="create" id="create" value="Crear" class="form-control btn btn-primary"/>
                                            --}%%{--<input type="submit" name="create" id="create" value="Crear" class="form-control btn btn-primary">--}%%{--
                                        </div>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>--}%
        </div>
    </div>
</div>
</body>
</html>
