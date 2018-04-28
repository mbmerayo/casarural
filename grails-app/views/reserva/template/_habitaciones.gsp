<div class="table-responsive-xl">
<table id="datos" class="table-view table-striped thead-light" style="width: 100%">
    <thead>
    <tr>
        <th></th>
        <th>Categoría</th>
        <th>Precio</th>
        <th>Habitaciones</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="habitacion" in="${habitaciones}">
        <tr>
            <td><g:checkBox name="selected_${habitacion.categoria.id}"/></td>
            <td>${habitacion.categoria.descripcion}</td>
            <td><g:formatNumber number="${habitacion.categoria.precio}" type="currency" currencyCode="EUR" /></td>
            <td>${habitacion.categoria.habitaciones.size()}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</div>