package casarural

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured("ROLE_ADMIN")
class HabitacionController {

    HabitacionService habitacionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond habitacionService.list(params), model:[habitacionCount: habitacionService.count()]
    }

    def show(Long id) {
        respond habitacionService.get(id)
    }

    def create() {
        respond new Habitacion(params)
    }

    def save(Habitacion habitacion) {
        if (habitacion == null) {
            notFound()
            return
        }

        try {
            habitacionService.save(habitacion)
        } catch (ValidationException e) {
            respond habitacion.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), habitacion.id])
                redirect habitacion
            }
            '*' { respond habitacion, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond habitacionService.get(id)
    }

    def update(Habitacion habitacion) {
        if (habitacion == null) {
            notFound()
            return
        }

        try {
            habitacionService.save(habitacion)
        } catch (ValidationException e) {
            respond habitacion.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), habitacion.id])
                redirect habitacion
            }
            '*'{ respond habitacion, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        habitacionService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitacion.label', default: 'Habitacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
