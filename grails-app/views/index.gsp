<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio</title>
</head>

<body>
<sec:ifNotLoggedIn>
    <h1>Framework para la gestión de hoteles</h1>
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <h1>Bienvenido <sec:username/></h1>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_USER">
    <h1>Bienvendio <sec:username/></h1>
</sec:ifAnyGranted>
</body>
</html>

