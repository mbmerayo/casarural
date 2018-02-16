package casarural.auth

import javax.xml.bind.ValidationException

import static org.springframework.http.HttpStatus.CREATED

import casarural.auth.UserRole
import casarural.auth.Role

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def registerUser(){
        def userRole = casarural.auth.Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save()
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
            casarural.auth.UserRole.create user, userRole

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                    redirect user
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
}
