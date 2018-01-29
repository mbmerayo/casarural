package casarural.auth

import grails.plugin.springsecurity.ui.RegistrationCode

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
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

        UserRole.create user, userRole

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
}
