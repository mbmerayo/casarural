<table>
    <g:each var="hab" in="${habitaciones}">
        <tr>
            <td><g:checkBox name="habitacion_${hab.id}"/></td>
            <td>${hab.descripcion}</td>
            <td>${hab.planta} planta</td>
        </tr>
    </g:each>
</table>