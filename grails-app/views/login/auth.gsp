<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.login.title'/>
</head>
<body>
<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
			<div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card rounded-0">
                        <div class="card-header text-center" style="background-color: #28a745;">
                            <h3 class="mb-0" style="color: white;">Login</h3>
                        </div>
                        <div class="card-body">
                            <form id="login-form" action="/login/authenticate" method="post" role="form"
                                  aucomplete="off" style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="username" id="username" tabindex="1" class="form-control"
                                           placeholder="Usuario" value="" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" tabindex="2"
                                           class="form-control" placeholder="Password" required>
                                </div>
                                <div class="form-group text-center">
                                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                    <label for="remember">Remember Me</label>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-sm-5 col-9">
                                            <g:submitButton name="login-submit" id="login-submit" tabindex="4"
                                                            class="btn btn-success btn-sm" value="Login"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="${createLink(controller: 'register', action: 'forgotPassword', params: [lang:'es'])}" tabindex="5"
                                                   class="forgot-password">¿Has olvidado el password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="${createLink(controller: 'register', action: 'register', params: [lang:'es'])}" tabindex="5"
                                                   class="forgot-password">Registro</a>
                                            </div>
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
</div>

</body>
</html>
