<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-categoria" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${categoriaList}" />

            <div class="pagination">
                <g:paginate total="${categoriaCount ?: 0}" />
            </div>
        </div>--}%
    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card rounded" >
                            <div class="card-header text-center" style="background-color: #28a745;">
                                <h3 class="mb-0" style="color: white;">Lista de categorias</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive-xl">
                                    <table class="table-condensed">
                                        <thead>
                                        <tr class="table-primary">
                                            <th scope="col" class="text-center">Id</th>
                                            <th scope="col" class="text-center">Descripción</th>
                                            <th scope="col"class="text-center">Precio</th>
                                            <th scope="col"class="text-center">Habitaciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${categoriaList}">
                                            <tr>
                                                <td><a href="${createLink(action: 'show', id: it.id)}">${it.id}</a></td>
                                                <td>${it.descripcion}</td>
                                                <td>${it.precio}</td>
                                                <td>${it.habitaciones.size()}</td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                    <g:if test="${categoriaCount > 10}">
                                        <div class="pagination">
                                            <g:paginate total="${categoriaCount ?: 0}" />
                                        </div>
                                    </g:if>
                                </div>
                                %{--<exa:datatable id="datos" items="${habitacionList}" exclude="id,belongsTo" class="table-responsive-xl table-condensed">
                                    <exa:customHeader name="categoria" value="Categoria" />
                                    <exa:customColumn name="categoria">
                                        ${it.categoria.descripcion}
                                    </exa:customColumn>
                                </exa:datatable>--}%
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>