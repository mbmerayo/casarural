<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<a href="#show-habitacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-habitacion" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="habitacion" />
            <g:form resource="${this.habitacion}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.habitacion}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>--}%

    <div class="container py-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card rounded">
                    <div class="card-header text-center" style="background-color: #28a745;">
                        <h3 class="mb-0" style="color: white;">Habitación ${habitacion.id}</h3>
                    </div>
                    <div class="card-body">
                        <g:form controller="habitacion" action="delete" id="${habitacion.id}" role="form" method="post" style="display: block;">
                            <div class="form-group">
                                <label for="planta">Planta</label>
                                <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                <div class="input-group">
                                    <input type="number" class="form-control" name="planta" id="planta" value="${habitacion.planta}" required/>
                                </div>
                             </div>
                            <div class="form-group">
                                <label for="categoria">Categoría</label>
                                <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                <div class="input-group">
                                    <g:select name="categoria.id" from="${casarural.Categoria.list()}"
                                        optionValue="descripcion" optionKey="id" value="${habitacion.categoria.descripcion}"
                                        id="categoria" required="required" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 20 px;color: red;"/></span>
                                <div class="input-group">
                                    <g:textArea name="descripcion" id="descripcion" required="required"
                                                class="form-control" value="${habitacion.descripcion}" rows="3"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-sm-6 col-9">
                                    <inpu
                                    <g:link class="edit" action="edit" resource="${this.habitacion}">
                                        <input type="button" value="Editar" class="btn btn-outline-success btn-sm"/>
                                    </g:link>
                                    <g:submitButton name="delete" id="delete" value="Borrar" class="btn btn-outline-warning btn-sm"/>
                                    <g:actionSubmit value="Cancelar" action="index" class="btn btn-outline-danger btn-sm"/>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
