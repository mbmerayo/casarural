<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

%{--<a href="#create-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-categoria" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.categoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.categoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.categoria}" method="POST">
                <fieldset class="form">
                    <f:all bean="categoria"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>--}%
<div class="container py-5">
    <g:hasErrors bean="${categoria}">
        <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger">
                <ul>
        <g:eachError var="err" bean="${categoria}">
            %{--<li><g:message args="[err.field]" code="${err.code}" locale="es_ES" /></li>--}%
            <li><g:message error="${err}" /></li>
        </g:eachError>
        </ul>
            </div>
        <div>
        </div>
    </g:hasErrors>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card rounded-2">
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Alta Categoría</h3>
                        </div>
                        <div class="card-body">
                            <g:form controller="categoria" action="save" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="precio">Precio</label>
                                    <div class="input-group">
                                        <input type="number decimal" class="form-control" name="precio" id="precio"
                                               placeholder="Introduzca el precio" required value="${fieldValue(bean:categoria,field:'precio')}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <div class="input-group">
                                        <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"
                                                    value="${fieldValue(bean:categoria,field:'descripcion')}"/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-asterisk"/>
                                        </span>
                                    </div>
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
            </div>
        </div>
    </div>
</div>




%{--<div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row text-center">
                            <h3 class="panel-title">Alta Categoría</h3>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <g:form controller="categoria" action="save" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <label for="precio">Precio</label>
                                        <div class="input-group">
                                            <input type="number decimal" class="form-control" name="precio" id="precio"
                                                   placeholder="Introduzca el precio" required>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-asterisk"/>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <div class="input-group">
                                            --}%%{--<input type="email" class="form-control" id="InputEmailSecond" name="InputEmail" placeholder="Confirm Email" required>--}%%{--
                                            <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"/>
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-asterisk"/>
                                        </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <g:submitButton name="create" id="create" value="Crear" class="form-control btn btn-primary"/>
                                            </div>
                                        </div>
                                    </div>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--}%
</body>
</html>
