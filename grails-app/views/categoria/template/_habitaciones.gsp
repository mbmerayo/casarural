<table>
    <g:each var="habitacion" in="${habitaciones}">
    <tr>
        <td></td>
        <td>${habitacion.id}</td>
        <td colspan="2">${habitacion.descripcion}</td>
        <td>${habitacion.categoria.id}</td>
    </tr>
    </g:each>
</table>