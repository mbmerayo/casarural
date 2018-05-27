package casarural

import grails.gorm.transactions.Transactional

@Transactional
class HabitacionesService {



    /**
     * Método que devuelve las habitaciones libres entre dos fechas
     * @param fechaInicio - Fecha de inicio de la reserva
     * @param fechaFin - Fecha de fin de la reserva
     * @return
     */
    def habitacionesDisponibles(Long id, Date fechaInicio=null, Date fechaFin=null) {
        //Si no hay reservas podemos alquilar cualquier habitacion
        if (Reserva.list().empty) {
            return Categoria.findById(id).habitaciones
        } else {
            //Cargamos la lista con todas las habitaciones y eliminamos las no disponibles
            def reservadas = Reserva.find("from Reserva where '${fechaInicio}' between fechaInicio and fechaFin or '${fechaFin}' between fechaInicio and fechaFin").habitaciones

            def libres = Habitacion.findAll("from Habitacion h where h not in (:reservadas) order by categoria", [reservadas: reservadas])

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
    def libresCategoria(Long id, Date fechaInicio, Date fechaFin){
        def categoria = Categoria.findById(id)
        def habitacionesLibres = habitacionesDisponibles(fechaInicio,fechaFin)
        def habitaciones = new ArrayList<Habitacion>()

        categoria.habitaciones.each {habitacion->
            if (habitacion in habitacionesLibres){
                habitaciones.add(habitacion)
            }
        }

        return habitaciones
    }
}

