<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio</title>
</head>

<body>
<sec:ifNotLoggedIn>
    <h1>¡Hola mundo!</h1>
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <h1>¡Eres administrador!</h1>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_USER">
    <h1>¡Eres usuario!</h1>
</sec:ifAnyGranted>
</body>
</html>

