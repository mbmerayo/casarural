package casarural

import grails.rest.*

@Resource(uri = '/api/habitacion', readOnly = false,formats = ['json','xml'])
class Habitacion {
    String descripcion
    Integer planta

    static belongsTo = [categoria: Categoria]

    static constraints = {
        planta nullable: false, blank: false
    }
}
