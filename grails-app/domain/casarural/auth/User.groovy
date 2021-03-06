package casarural.auth

import grails.rest.Resource
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
@Resource(uri = '/api/user', readOnly = false, formats = ['json','xml'])
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String email
    String dni
    String nombre
    String primerApellido
    String segundoApellido
    Integer telefono
    Date fechaNac
    String pais
    String provincia
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
        email nullable: true, email: true
        dni nullable: false, blank: false
        nombre nullable: false, blank: false
        primerApellido nullable: false, blank: false
        segundoApellido nullable: true
        telefono nullable: true
        fechaNac nullable: true
        pais nullable: true
        provincia nullable: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
