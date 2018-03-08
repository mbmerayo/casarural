<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<a href="#show-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-categoria" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="categoria" />
            <g:form resource="${this.categoria}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.categoria}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>--}%
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card rounded">
                            <div class="card-header text-center" style="background-color: mediumseagreen;">
                                <h3 class="mb-0" style="color: white;">Categoría ${this.categoria.id}</h3>
                            </div>
                            <div class="card-body">
                                <g:form name="formulario" controller="categoria" id="${this.categoria.id}" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <label for="precio">Precio</label>
                                        <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 10px;color: red;"/></span>
                                        <div class="input-group">
                                            <input type="number decimal" class="form-control" name="precio" id="precio"
                                                   value="${this.categoria.precio}" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <span class="col-form-label"><span class="fa fa-asterisk " style="font-size: 10px;color: red;"/></span>
                                        <div class="input-group">
                                            <g:textArea name="descripcion" id="descripcion" required="required" class="form-control"
                                                        value="${this.categoria.descripcion}" rows="3" style="resize: none;"/>
                                        </div>
                                    </div>
                                    <div class="offset-sm-6 col-9">
                                        <g:actionSubmit value="Editar" action="update" onclick="update();" class="btn btn-outline-success btn-sm"/>
                                        <button type="button" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#myModal">
                                            Borrar
                                        </button>
                                        <g:actionSubmit value="Cancelar" action="index" class="btn btn-outline-danger btn-sm"/>
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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title" id="exampleModalLabel">Borrar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <g:message code="default.button.delete.confirm.message"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="borrar(${this.categoria.id});">Aceptar</button>
                </div>
            </div>
        </div>
    </div>


    <g:javascript>
        function update(){
            $("#formulario").append("<input name='_method' value='PUT' id='_method' type='hidden'>");
        }

        function borrar(id){
            $("#formulario").append("<input name='_method' value='DELETE' id='_method' type='hidden'>");
            $("#formulario").prop('action', '/categoria/delete/'+id);
            $("#formulario").submit();
        }
    </g:javascript>
    </body>
</html>
