<html>
<head>
	%{--<meta name="layout" content="${layoutRegister}"/>--}%
	<meta name="layout" content="main"/>
    <s2ui:title messageCode='spring.security.ui.register.title'/>
    <style type="text/css" media="screen">
.panel-login {
    border-color: #ccc;
    -webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
    box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}
.panel-login > .panel-heading {
    color: #00415d;
    background-color: #fff;
    border-color: #fff;
    text-align: center;
}
.panel-login > .panel-heading a {
    text-decoration: none;
    color: #666;
    font-weight: bold;
    font-size: 15px;
    -webkit-transition: all 0.1s linear;
    -moz-transition: all 0.1s linear;
    transition: all 0.1s linear;
}
.panel-login > .panel-heading a.active {
    color: #029f5b;
    font-size: 18px;
}
.panel-login > .panel-heading hr {
    margin-top: 10px;
    margin-bottom: 0px;
    clear: both;
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
    background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
    background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
    background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}
.panel-login input[type="text"], .panel-login input[type="email"], .panel-login input[type="password"] {
    height: 45px;
    border: 1px solid #ddd;
    font-size: 16px;
    -webkit-transition: all 0.1s linear;
    -moz-transition: all 0.1s linear;
    transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
    outline: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border-color: #ccc;
}
.btn-register {
    background-color: #1CB94E;
    outline: none;
    color: #fff;
    font-size: 14px;
    height: auto;
    font-weight: normal;
    padding: 14px 0;
    text-transform: uppercase;
    border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
    color: #fff;
    background-color: #1CA347;
    border-color: #1CA347;
}
</style>
</head>
<body>
%{--<s2ui:formContainer type='register' focus='username' width='800px'>
	<s2ui:form beanName='registerCommand'>
		<g:if test='${emailSent}'>
		<br/>
		<g:message code='spring.security.ui.register.sent'/>
		</g:if>
		<g:else>
		<br/>
		<table>
			<tbody>
			<s2ui:textFieldRow name='username' size='40' labelCodeDefault='Username'/>
			<s2ui:textFieldRow name='email' size='40' labelCodeDefault='E-mail'/>
			<s2ui:passwordFieldRow name='password' size='40' labelCodeDefault='Password'/>
			<s2ui:passwordFieldRow name='password2' size='40' labelCodeDefault='Password (again)'/>
			</tbody>
		</table>
		<s2ui:submitButton elementId='submit' messageCode='spring.security.ui.register.submit'/>
		</g:else>
	</s2ui:form>
</s2ui:formContainer>--}%

<div class="container">
    %{--<g:hasErrors bean="${user}">
        <ul>
            <g:eachError var="err" bean="${user}">
                <li>${err}</li>
            </g:eachError>
        </ul>
    </g:hasErrors>--}%
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row text-center">
                        <a href="#" class="active" id="register-form-link">Registro</a>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="registerForm" action="/register/register" method="post"
                                  role="form" style="display: block;">
                                <div class="form-group">
                                    <label for="username">Usuario</label>
                                    <div class="input-group">
                                    <input type="text" name="username" id="username" tabindex="1" class="form-control"
                                           placeholder="Usuario" value="" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <div class="input-group">
                                    <input type="email" name="email" id="email" tabindex="1" class="form-control"
                                           placeholder="Email" value="" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <div class="input-group">
                                    <input type="password" name="password" id="password" tabindex="2"
                                           class="form-control" placeholder="Password" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password2">Password</label>
                                    <div class="input-group">
                                    <input type="password" name="password2" id="password2" tabindex="2"
                                           class="form-control" placeholder="Confirma Password" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="dni">DNI</label>
                                    <div class="input-group">
                                    <input type="text" name="dni" id="dni" tabindex="1" class="form-control"
                                           placeholder="DNI" value="" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <div class="input-group">
                                    <input type="text" name="nombre" id="nombre" tabindex="1" class="form-control"
                                           placeholder="Nombre" value="" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="primerApellido">Primer Apellido</label>
                                    <div class="input-group">
                                    <input type="text" name="primerApellido" id="primerApellido" tabindex="1"
                                           class="form-control" placeholder="Primer apellido" value="" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="submit_submit" id="submit_submit"
                                                   tabindex="4" class="form-control btn btn-register"
                                                   value="Registrar Ahora">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/assets/jquery.js?compile=false"></script>
<script type="text/javascript" src="/assets/jquery/jquery-2.1.4.js?compile=false"></script>
<script type="text/javascript" src="/assets/jquery-ui/jquery-ui-1.10.3.custom.js?compile=false"></script>
<script type="text/javascript" src="/assets/jquery-ui.js?compile=false"></script>
<script type="text/javascript" src="/assets/jquery/jquery.jgrowl.js?compile=false"></script>
<script type="text/javascript" src="/assets/spring-security-ui-register.js?compile=false"></script>
<script>
    $(function() {
        $("#submit").button();
        $('#submit').bind('click', function() {
            document.forms.registerForm.submit();
        });
    });

    $(function() {
        $('#formContainer').resizable();
    });

    $(function() {
        $('#username').focus();
    });
</script>
</body>
</html>
