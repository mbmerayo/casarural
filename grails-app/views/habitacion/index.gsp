<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'habitacion.label', default: 'Habitacion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#list-habitacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-habitacion" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${habitacionList}" />

            <div class="pagination">
                <g:paginate total="${habitacionCount ?: 0}" />
            </div>
        </div>--}%

<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="card rounded" >
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Lista de habitaciones</h3>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive-xl">
                                <table class="table-condensed">
                                    <thead>
                                    <tr class="table-primary">
                                        <th scope="col" class="text-center">Id</th>
                                        <th scope="col" class="text-center">Descripción</th>
                                        <th scope="col"class="text-center">Planta</th>
                                        <th scope="col"class="text-center">Categoría</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${habitacionList}">
                                        <tr>
                                            <td><a href="${createLink(action: 'show', id: it.id)}">${it.id}</a></td>
                                            <td>${it.descripcion}</td>
                                            <td>${it.planta}</td>
                                            <td>${it.categoria.descripcion}</td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                                <g:if test="${habitacionCount > 10}">
                                    <div class="pagination">
                                        <g:paginate total="${habitacionCount ?: 0}" />
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