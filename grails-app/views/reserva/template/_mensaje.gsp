<g:if test="${error}">
    <div class="alert alert-danger fade alert-dismissible fade show" role="alert" style="display: block;">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        ${error}
    </div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: block">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        ${flash.message}
    </div>
</g:if>