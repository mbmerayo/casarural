package casarural

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN"])
class ApiController {

    def habitacionService
    def categoriaService
    def reservaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def habitaciones() {
        respond habitacionService.list(params), formats: ['json']
    }

    def habitacion(Long id){
        respond habitacionService.get(id), formats: ['json']
    }

    def categorias() {
        respond categoriaService.list(params), formats: ['json']
    }

    def categoria(Long id){
        respond categoriaService.get(id), formats: ['json']
    }

    def reservas() {
        respond reservaService.list(params), formats: ['json']
    }

    def reserva(Long id){
        respond reservaService.get(id), formats: ['json']
    }
}
