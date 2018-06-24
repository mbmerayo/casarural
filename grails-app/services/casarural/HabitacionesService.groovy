package casarural

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class HabitacionesService {

    /**
     * Método que devuelve las habitaciones libres entre dos fechas
     * @param fechaInicio - Fecha de inicio de la reserva
     * @param fechaFin - Fecha de fin de la reserva
     * @return
     */
    @Secured(["ROLE_USER"])
    def habitacionesDisponibles(Long id, Date fechaInicio = null, Date fechaFin = null) {
        //Si no hay reservas podemos alquilar cualquier habitacion
        if (Reserva.list().empty) {
            return Categoria.findById(id).habitaciones.toList()
        } else {
            //Cargamos la lista con todas las habitaciones y eliminamos las no disponibles
            def reservadas = Reserva.findAll("from Reserva as r where :fechaInicio between r.fechaInicio and r.fechaFin or :fechaFin between r.fechaInicio " +
                    "and r.fechaFin or :fechaInicio < r.fechaInicio and :fechaFin > r.fechaFin", [fechaInicio: fechaInicio, fechaFin: fechaFin])

            List<Habitacion> habitacionesReservadas = new ArrayList<Habitacion>()

            reservadas.each {reserva->
                reserva.habitaciones.toList().each {
                    habitacionesReservadas.add(it)
                }
            }

            def sql = "from Habitacion h where "
            def parameters = new HashMap()

            if(!habitacionesReservadas.isEmpty()){
                sql += "h not in (:habitacionesReservadas) and "
                parameters.put("habitacionesReservadas",habitacionesReservadas)
            }

            sql += " categoria.id = :id"
            parameters.put("id",id)

            def libres = Habitacion.findAll(sql,parameters)

            return libres
        }
    }

    /**
     * Método que devuelve las habitaciones libres en una categoría
     * para unas determinadas fechas
     *
     * @param id - Identificador de la categoría
     * @param fechaInicio - Fecha de inicio de la reserva
     * @param fechaFin - Fecha de fin de la reserva
     * @return
     */
    def libresCategoria(Long id, Date fechaInicio, Date fechaFin) {
        def categoria = Categoria.findById(id)
        def habitacionesLibres = habitacionesDisponibles(id, fechaInicio, fechaFin)
        def habitaciones = new ArrayList<Habitacion>()

        categoria.habitaciones.each { habitacion ->
            if (habitacion in habitacionesLibres) {
                habitaciones.add(habitacion)
            }
        }

        return habitaciones
    }
}

