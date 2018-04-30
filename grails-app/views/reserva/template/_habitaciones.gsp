<table>
    <g:each var="habitacion" in="${habitaciones}">
    <tr>
        <td><g:checkBox name="habitacion_${habitacion.id}"/></td>
        <td>${habitacion.descripcion}</td>
        <td>${habitacion.planta} planta</td>
    </tr>
    </g:each>
</table>