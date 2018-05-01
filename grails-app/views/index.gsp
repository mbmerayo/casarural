<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio</title>
</head>

<body>
<sec:ifNotLoggedIn>
    <h1>Framework de gestión hotelera</h1>
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <g:render template="/template/administrador"/>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_USER">
    <g:render template="/template/usuario"/>
</sec:ifAnyGranted>
</body>
</html>

