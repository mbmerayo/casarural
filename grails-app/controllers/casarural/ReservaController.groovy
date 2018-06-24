package casarural

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Secured("ROLE_USER")
class ReservaController {

    ReservaService reservaService
    HabitacionesService habitacionesService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured("ROLE_ADMIN")
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond reservaService.list(params), model:[reservaCount: reservaService.count()]
    }

    @Secured("ROLE_ADMIN")
    def show(Long id) {
        respond reservaService.get(id)
    }

    def create() {
        respond new Reserva(params)
    }

    /**
     * Método que muestra las habitaciones disponibles por categoría entre dos fechas
     * @param reserva
     */
    def showAvaliableRooms(Reserva reserva) {
//        def habitaciones = habitacionesService.habitacionesDisponibles(reserva.fechaInicio, reserva.fechaFin)
        if((params.fechaInicio == "")||(params.fechaFin == "")){
            def error = "Debe de introducir fecha de inicio y fecha de fin"
            render (template:"template/mensaje", model: [error: error])
        }else{
           /* def fechaInicio =  Date.parse("yyyy-MM-dd", params.fechaInicio)
            def fechaFin = Date.parse("yyyy-MM-dd", params.fechaFin)*/
            render(template: "template/categorias", model: [categorias: Categoria.all, fechaInicio: params.fechaInicio, fechaFin: params.fechaFin])
        }
    }

    /**
     * Método que muestra las habitaciones disponibles por cada categoría
     */
    def showHabitacionesPerCategoria(){
        def categoria = Categoria.findById(params.id)
        def fecInicio = (params.fechaInicio) ? new SimpleDateFormat("dd/MM/yyyy").parse(params.fechaInicio) : null
        def fecFin = (params.fechaFin) ? new SimpleDateFormat("dd/MM/yyyy").parse(params.fechaFin) : null

        def habitaciones = habitacionesService.libresCategoria(categoria.id, fecInicio, fecFin)
        render(template: 'template/haºbitaciones', model: [habitaciones: habitaciones])
    }

    @Secured("ROLE_USER")
    def save(Reserva reserva) {

        reserva.fechaInicio =  new SimpleDateFormat("dd/MM/yyyy").parse(params.fechaInicio)
        reserva.fechaFin =  new SimpleDateFormat("dd/MM/yyyy").parse(params.fechaFin)

        //Validaciones
        if (reserva.fechaInicio >= reserva.fechaFin){
            respond flash.error = "La fecha de inicio debe de ser mayor que la fecha de fin", view: 'create'
            return
        }
        if (reserva.fechaInicio < new Date()){
            respond flash.error = "La fecha de inicio debe de ser mayor que la fecha actual", view: 'create'
            return
        }

        reserva.fecha = new Date()
        reserva.estado = Reserva.Estado.Reservada

        List<Habitacion> habitaciones = new ArrayList<Habitacion>()

        params.each {name, value ->
            if (value.equals("on")){
                def id = name.drop(name.size() - 1)
                habitaciones.add(Habitacion.findById(id))
            }
        }

        reserva.habitaciones = habitaciones
        reserva.user = springSecurityService.currentUser

        reserva.clearErrors()

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
