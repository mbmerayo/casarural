<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
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
                            <h4 class="mb-0" style="color: white;">Alta Categoría</h4>
                        </div>
                        <div class="card-body">
                            <g:form controller="categoria" action="save" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="precio">Precio</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:textField name="precio" id="precio" value="${categoria.precio}"
                                            placeholder="Introduzca precio" required="required"/>
                                        <g:hasErrors bean="${categoria}" field="precio">
                                            <g:eachError bean="${categoria}" field="precio">
                                                <p style="color: red;"><g:message error="${it}"/></p>
                                            </g:eachError>
                                        </g:hasErrors>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripción</label>
                                    <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                    <div class="input-group">
                                        <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"
                                                    value="${categoria.descripcion}"/>
                                        <g:hasErrors bean="${categoria}" field="descripcion">
                                            <g:eachError bean="${categoria}" field="descripcion">
                                                <p style="color: red;"><g:message error="${it}"/></p>
                                            </g:eachError>
                                        </g:hasErrors>
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
