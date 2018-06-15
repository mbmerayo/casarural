<%@ page import="java.text.DateFormat" %>
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
        <g:each var="categoria" in="${categorias}" status="i">
            %{--<g:if test="${habitacion.categoria != habitacion.}"></g:if>--}%
            <tr>
                <td>
                    <g:submitToRemote name="open${categoria.id}" id="open${categoria.id}"
                                      value="+" url="[action: 'showHabitacionesPerCategoria', id: categoria.id]"
                                      update="categoria${categoria.id}" class="btn btn-sm"/>
                    %{--<a href="#0" id="boton${categoria.id}" class="btn btn-sm">+</a>--}%
                </td>
                <td>${categoria.descripcion}</td>
                <td><g:formatNumber number="${categoria.precio}" type="currency" currencyCode="EUR"/></td>
                <td>${categoria.habitaciones.size()}</td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="categoria${categoria.id}"/>
                </td>
            </tr>
            <g:javascript>
                $(document).ready(function(){
                    $("#open${categoria.id}").click(function(){
                        $("#categoria${categoria.id}").slideToggle("slow");
                        if ($("#open${categoria.id}").val() == "+"){
                            $("#open${categoria.id}").attr('value','-');
                        }else{
                            $("#open${categoria.id}").attr('value','+');
                        }
                    });
                });
            </g:javascript>
        </g:each>
        </tbody>
    </table>
</div>