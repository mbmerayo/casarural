package casarural

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.security.access.prepost.PreAuthorize

import static org.springframework.http.HttpStatus.*

@Secured("ROLE_ADMIN")
class ReservaController {

    ReservaService reservaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond reservaService.list(params), model:[reservaCount: reservaService.count()]
    }

    def show(Long id) {
        respond reservaService.get(id)
    }

    @PreAuthorize('isFullyAuthenticated')
    def create() {
        respond new Reserva(params)
    }

    @PreAuthorize('isFullyAuthenticated')
    def save(Reserva reserva) {
        if (reserva == null) {
            notFound()
            return
        }

        try {
            reservaService.save(reserva)
        } catch (ValidationException e) {
            respond reserva.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*' { respond reserva, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond reservaService.get(id)
    }

    def update(Reserva reserva) {
        if (reserva == null) {
            notFound()
            return
        }

        try {
            reservaService.save(reserva)
        } catch (ValidationException e) {
            respond reserva.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*'{ respond reserva, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        reservaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
