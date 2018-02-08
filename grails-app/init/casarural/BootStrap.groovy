package casarural

import casarural.auth.Role
import casarural.auth.User
import casarural.auth.UserRole

class BootStrap {

    def init = { servletContext ->

        def userRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save()

        if(!User.count()){
            def admin = new User(
                    username: 'admin',
                    password: 'admin',
                    dni: '73241241H',
                    nombre: 'Marcos',
                    primerApellido: 'Bello',
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false).save()

            UserRole.create admin, userRole

            UserRole.withSession {
                it.flush()
                it.clear()
            }
        }
    }
    def destroy = {
    }
}
