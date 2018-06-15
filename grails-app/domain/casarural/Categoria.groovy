package casarural

//import java.text.SimpleDateFormat

/*import grails.rest.*

@Resource(uri = '/api/categoria', readOnly = false, formats = ['json','xml'])*/
class Categoria {
//    def habitacionesService
    String descripcion
    Float precio

    static hasMany = [habitaciones: Habitacion]

    static constraints = {
        precio nullable: false, blank: false
    }

    def jsonMap(){
        [
                'descripcion' : this.descripcion,
                'precio' : this.precio
        ]
    }

    /*def habsDisponibles(Long id=null, String fechaInicio=null, String fechaFin=null){

        def fecInicio = (fechaInicio) ? new SimpleDateFormat("dd/MM/yyyy").parse(fechaInicio) : null
        def fecFin = (fechaFin) ? new SimpleDateFormat("dd/MM/yyyy").parse(fechaFin) : null

        def habitacionesLibres = habitacionesService.libresCategoria(id, fecInicio, fecFin)

        return habitacionesLibres
    }*/
}
