package casarural.auth

import grails.config.Config
import grails.gsp.PageRenderer
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.CommandObject
import grails.plugin.springsecurity.ui.RegistrationCode
import grails.plugin.springsecurity.ui.strategy.MailStrategy
import grails.plugin.springsecurity.ui.strategy.PropertiesStrategy
import grails.plugin.springsecurity.ui.strategy.RegistrationCodeStrategy
import groovy.text.SimpleTemplateEngine
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.security.authentication.dao.SaltSource

import javax.xml.bind.ValidationException

import static org.springframework.http.HttpStatus.CREATED

import casarural.auth.UserRole
import casarural.auth.Role

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def register(){
        def userRole =  Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save()
        def user = new User(params)
        /*try{
            userService.save(user)
        } catch (ValidationException e){
            respond user.errors, view: 'register'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }*/
        if (user.validate()){
            userService.save(user)
            UserRole.create user, userRole, true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                    //redirect user
                    redirect (controller: 'login', action: 'auth')
                }
                '*' { respond user, [status: CREATED] }
            }
        }else{
            user.errors.allErrors.each {
                println it
            }
            respond user.errors, view: 'register'
            return user
        }
    }

    def verifyRegistration() {

        String token = params.t

        RegistrationCode registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        def user = uiRegistrationCodeStrategy.finishRegistration(registrationCode)

        /**
         * Si no existe creamos el rol de usuario y salvamos el nuevo usuario con ese rol
         */
        def userRole
        if(Role.countByAuthority('ROLE_USER')==0){
            userRole = new Role(authority: 'ROLE_USER').save()
        }else{
            userRole = Role.findByAuthority('ROLE_USER')
        }
        user.accountLocked = false
        //Add flush:true
        user.save(flush: true)

        UserRole.create user, userRole, true

        if (!user) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        if (user.hasErrors()) {
            // expected to be handled already by ErrorsStrategy.handleValidationErrors
            return
        }

        flash.message = message(code: 'spring.security.ui.register.complete')
        redirect uri: registerPostRegisterUrl ?: successHandlerDefaultTargetUrl
    }

    static defaultAction = 'register'

    /** Dependency injection for the 'saltSource' bean. */
    SaltSource saltSource

    /** Dependency injection for the 'uiMailStrategy' bean. */
    MailStrategy uiMailStrategy

    /** Dependency injection for the 'uiRegistrationCodeStrategy' bean. */
    RegistrationCodeStrategy uiRegistrationCodeStrategy

    /** Dependency injection for the 'uiPropertiesStrategy' bean. */
    PropertiesStrategy uiPropertiesStrategy

    String serverURL

    PageRenderer groovyPageRenderer
    MessageSource messageSource

    static final String EMAIL_LAYOUT = "/layouts/email"
    static final String FORGOT_PASSWORD_TEMPLATE = "/register/_forgotPasswordMail"
    static final String VERIFY_REGISTRATION_TEMPLATE = "/register/_verifyRegistrationMail"

    @Override
    void setConfiguration(Config co) {
        serverURL = co.getProperty('grails.serverURL', String)
    }

    /*def register(RegisterCommand registerCommand) {

        if (!request.post) {
            return [registerCommand: new RegisterCommand()]
        }

        if (registerCommand.hasErrors()) {
            return [registerCommand: registerCommand]
        }

        def user = uiRegistrationCodeStrategy.createUser(registerCommand)
        String salt = saltSource instanceof NullSaltSource ? null : registerCommand.username
        RegistrationCode registrationCode = uiRegistrationCodeStrategy.register(user, registerCommand.password, salt)

        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            return [registerCommand: registerCommand]
        }

        sendVerifyRegistrationMail registrationCode, user, registerCommand.email

        [emailSent: true, registerCommand: registerCommand]
    }*/

    protected void sendVerifyRegistrationMail(RegistrationCode registrationCode, user, String email) {
        String url = generateLink('verifyRegistration', [t: registrationCode.token])
        String body = renderRegistrationMailBody(url, user)

        uiMailStrategy.sendVerifyRegistrationMail(
                to: email,
                from: registerEmailFrom,
                subject: registerEmailSubject,
                html: body
        )
    }

    /**
     * Render the email body using text from DefaultUiSecurityConfig if it exists.  If not, render using gsps
     * @param url
     * @param user
     * @return html mail goodness
     */
    protected String renderRegistrationMailBody(String url, user) {
        if (registerEmailBody) {
            def body = registerEmailBody
            if (body.contains('$')) {
                body = evaluate(body, [user: user, url: url])
            }
            return body.toString()
        }

        renderEmail(VERIFY_REGISTRATION_TEMPLATE, EMAIL_LAYOUT, [
                url     : url,
                username: user.username
        ])
    }

    /*def verifyRegistration() {

        String token = params.t

        RegistrationCode registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        def user = uiRegistrationCodeStrategy.finishRegistration(registrationCode)

        if (!user) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        if (user.hasErrors()) {
            // expected to be handled already by ErrorsStrategy.handleValidationErrors
            return
        }

        flash.message = message(code: 'spring.security.ui.register.complete')
        redirect uri: registerPostRegisterUrl ?: successHandlerDefaultTargetUrl
    }*/

    def forgotPassword(ForgotPasswordCommand forgotPasswordCommand) {

        if (!request.post) {
            return [forgotPasswordCommand: new ForgotPasswordCommand()]
        }

        if (forgotPasswordCommand.hasErrors()) {
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        def user = findUserByUsername(forgotPasswordCommand.username)
        if (!user) {
            forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.user.notFound'
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        String email = uiPropertiesStrategy.getProperty(user, 'email')
        if (!email) {
            forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.noEmail'
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        uiRegistrationCodeStrategy.sendForgotPasswordMail(
                forgotPasswordCommand.username, email) { String registrationCodeToken ->

            String url = generateLink('resetPassword', [t: registrationCodeToken])
            String body = forgotPasswordEmailBody

            if (!body) {
                body = renderEmail(
                        FORGOT_PASSWORD_TEMPLATE, EMAIL_LAYOUT,
                        [
                                url     : url,
                                username: user.username
                        ]
                )
            } else if (body.contains('$')) {
                body = evaluate(body, [user: user, url: url])
            }

            body
        }

        [emailSent: true, forgotPasswordCommand: forgotPasswordCommand]
    }

    private String renderEmail(String viewPath, String layoutPath, Map model) {
        String content = groovyPageRenderer.render(view: viewPath, model: model)
        return groovyPageRenderer.render(view: layoutPath, model: model << [content: content])
    }

    def resetPassword(ResetPasswordCommand resetPasswordCommand) {

        String token = params.t

        def registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.resetPassword.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        if (!request.post) {
            return [token: token, resetPasswordCommand: new ResetPasswordCommand()]
        }

        resetPasswordCommand.username = registrationCode.username
        resetPasswordCommand.validate()
        if (resetPasswordCommand.hasErrors()) {
            return [token: token, resetPasswordCommand: resetPasswordCommand]
        }

        def user = uiRegistrationCodeStrategy.resetPassword(resetPasswordCommand, registrationCode)
        if (user.hasErrors()) {
            // expected to be handled already by ErrorsStrategy.handleValidationErrors
        }

        flash.message = message(code: 'spring.security.ui.resetPassword.success')

        redirect uri: registerPostResetUrl ?: successHandlerDefaultTargetUrl
    }

    /**
     * Creates a grails application link from a set of attributes.
     * @param action
     * @param linkParams
     * @param shouldUseServerUrl (optional) - If true, will utilize the configured grails.serverURL from application.yml if it exists otherwise the base url will be constructed the same as it always has been
     * @return String representing the relative or absolute URL
     */
    protected String generateLink(String action, Map linkParams, boolean shouldUseServerUrl = false) {
        String base = "$request.scheme://$request.serverName:$request.serverPort$request.contextPath"

        if (shouldUseServerUrl && serverURL) {
            base = serverURL
        }

        createLink(
                base: base,
                controller: 'register',
                action: action,
                params: linkParams)
    }

    protected String evaluate(s, binding) {
        new SimpleTemplateEngine().createTemplate(s).make(binding)
    }

    protected String forgotPasswordEmailBody
    protected String registerEmailBody
    protected String registerEmailFrom
    protected String registerEmailSubject
    protected String registerPostRegisterUrl
    protected String registerPostResetUrl
    protected String successHandlerDefaultTargetUrl

    protected static int passwordMaxLength
    protected static int passwordMinLength
    protected static String passwordValidationRegex

    void afterPropertiesSet() {
        super.afterPropertiesSet()

        RegisterCommand.User = User
        RegisterCommand.usernamePropertyName = usernamePropertyName

        forgotPasswordEmailBody = conf.ui.forgotPassword.emailBody ?: ''
        registerEmailBody = conf.ui.register.emailBody ?: ''
        registerEmailFrom = conf.ui.register.emailFrom ?: ''
        registerEmailSubject = conf.ui.register.emailSubject ?: messageSource ? messageSource.getMessage('spring.security.ui.register.email.subject', [].toArray(), 'New Account', LocaleContextHolder.locale) : '' ?: ''
        registerPostRegisterUrl = conf.ui.register.postRegisterUrl ?: ''
        registerPostResetUrl = conf.ui.forgotPassword.postResetUrl ?: ''
        successHandlerDefaultTargetUrl = conf.successHandler.defaultTargetUrl ?: '/'

        passwordMaxLength = conf.ui.password.maxLength instanceof Number ? conf.ui.password.maxLength : 64
        passwordMinLength = conf.ui.password.minLength instanceof Number ? conf.ui.password.minLength : 8
        passwordValidationRegex = conf.ui.password.validationRegex ?: '^.*(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$'
    }

    static final passwordValidator = { String password, command ->
        if (command.username && command.username.equals(password)) {
            return 'command.password.error.username'
        }

        if (!checkPasswordMinLength(password, command) || !checkPasswordMaxLength(password, command)) {
            return ['command.password.error.length', passwordMinLength, passwordMaxLength]
        }
        if (!checkPasswordRegex(password, command)) {
            return 'command.password.error.strength'
        }
    }

    static boolean checkPasswordMinLength(String password, command) {
        password && password.length() >= passwordMinLength
    }

    static boolean checkPasswordMaxLength(String password, command) {
        password && password.length() <= passwordMaxLength
    }

    static boolean checkPasswordRegex(String password, command) {
        password && password.matches(passwordValidationRegex)
    }

    static final password2Validator = { value, command ->
        if (command.password != command.password2) {
            return 'command.password2.error.mismatch'
        }
    }
}

class ForgotPasswordCommand implements CommandObject {
    String username
}

class RegisterCommand implements CommandObject {

    protected static Class<?> User
    protected static String usernamePropertyName

    String username
    String email
    String password
    String password2

    static constraints = {
        username validator: { value, command ->
            if (!value) {
                return
            }

            if (User.findWhere((usernamePropertyName): value)) {
                return 'registerCommand.username.unique'
            }
        }
        email email: true
        password validator: RegisterController.passwordValidator
        password2 nullable: true, validator: RegisterController.password2Validator
    }
}

class ResetPasswordCommand implements CommandObject {

    String username
    String password
    String password2

    static constraints = {
        password validator: RegisterController.passwordValidator
        password2 nullable: true, validator: RegisterController.password2Validator
    }
}