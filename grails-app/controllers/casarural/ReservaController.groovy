package casarural

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import org.springframework.transaction.TransactionStatus

class ReservaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        Reserva.async.task {
            [reservaList: list(params), count: count() ]
        }.then { result ->
            respond result.reservaList, model:[reservaCount: result.count]
        }
    }

    def show(Long id) {
        Reserva.async.get(id).then { reserva ->
            respond reserva
        }
    }

    @Secured("ROLE_USER")
    def create() {
        respond new Reserva(params)
    }

    def save(Reserva reserva) {
        Reserva.async.withTransaction { TransactionStatus status ->
            if (reserva == null) {
                status.setRollbackOnly()
                notFound()
                return
            }

            if(reserva.hasErrors()) {
                status.setRollbackOnly()
                respond reserva.errors, view:'create' // STATUS CODE 422
                return
            }

            reserva.save flush:true
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                    redirect reserva
                }
                '*' { respond reserva, [status: CREATED] }
            }
        }
    }

    @Secured("ROLE_USER,ROLE_ADMIN")
    def edit(Long id) {
        Reserva.async.get(id).then { reserva ->
            respond reserva
        }
    }

    def update(Long id) {
        Reserva.async.withTransaction { TransactionStatus status ->
            def reserva = Reserva.get(id)
            if (reserva == null) {
                status.setRollbackOnly()
                notFound()
                return
            }

            reserva.properties = params
            if( !reserva.save(flush:true) ) {
                status.setRollbackOnly()
                respond reserva.errors, view:'edit' // STATUS CODE 422
                return
            }

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Reserva.label', default: 'Reserva'), reserva.id])
                    redirect reserva
                }
                '*'{ respond reserva, [status: OK] }
            }
        }
    }

    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        Reserva.async.withTransaction { TransactionStatus status ->
            def reserva = Reserva.get(id)
            if (reserva == null) {
                status.setRollbackOnly()
                notFound()
                return
            }

            reserva.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reserva.label', default: 'Reserva'), reserva.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
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