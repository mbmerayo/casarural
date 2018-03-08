<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.forgotPassword.title'/>
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

    .btn-login {
        background-color: #59B2E0;
        outline: none;
        color: #fff;
        font-size: 14px;
        height: auto;
        font-weight: normal;
        padding: 14px 0;
        text-transform: uppercase;
        border-color: #59B2E6;
    }

    .btn-login:hover,
    .btn-login:focus {
        color: #fff;
        background-color: #53A3CD;
        border-color: #53A3CD;
    }

    .forgot-password {
        text-decoration: underline;
        color: #888;
    }

    .forgot-password:hover,
    .forgot-password:focus {
        text-decoration: underline;
        color: #666;
    }
    </style>
</head>
<body>
%{--<s2ui:formContainer type='forgotPassword' focus='username' width='50%'>
	<s2ui:form beanName='forgotPasswordCommand'>
		<g:if test='${emailSent}'>
		<br/>
		<g:message code='spring.security.ui.forgotPassword.sent'/>
		</g:if>
		<g:else>
		<br/>
		<h3><g:message code='spring.security.ui.forgotPassword.description'/></h3>
		<table>
			<s2ui:textFieldRow name='username' size='25' labelCodeDefault='Username'/>
		</table>
		<s2ui:submitButton elementId='submit' messageCode='spring.security.ui.forgotPassword.submit'/>
		</g:else>
	</s2ui:form>
</s2ui:formContainer>--}%

<div class="container">
	<div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row text-center">
                        <a href="#" class="active" id="password-reset-link">Password olvidado</a>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="/register/forgotPassword" method="post" name="forgotPasswordForm" id="forgotPasswordForm" autocomplete="off" style="display: block;">
                                <div class="form-group">
                                    <h6>Introduzca su nombre de usuario y le enviaremos un enlace para resetear su password a la dirección de correo de su cuenta</h6>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="username" id="username" tabindex="1" class="form-control"
                                           placeholder="Usuario" value="" required>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="password-reset-submit" id="login-submit" tabindex="4"
                                                   class="form-control btn btn-login" value="Reset password">
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
</body>
</html>
