<div class="table-responsive-xl">
<table id="datos" class="table-view table-striped" style="width: 100%">
    <thead>
    <tr>
        <th></th>
        <th>Categoría</th>
        <th>Precio</th>
        <th>Habitaciones</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="categoria" in="${categorias}">
        <tr>
            <td><g:checkBox name="selected"/></td>
            <td>${categoria.descripcion}</td>
            <td>${categoria.precio}</td>
            <td>${categoria.habitaciones.size()}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</div>