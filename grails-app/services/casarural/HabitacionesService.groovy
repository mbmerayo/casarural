package casarural

import grails.gorm.transactions.Transactional

@Transactional
class HabitacionesService {

    def habitacionesDisponibles(Date fechaInicio, Date fechaFin) {

        def hayReservas = Reserva.list().empty
        //Si no hay reservas podemos alquilar cualquier habitacion
        if (Reserva.list().empty) {
            return Categoria.list()
        } else {
            //Cargamos la lista con todas las habitaciones y eliminamos las no disponibles
            def habitaciones = Habitacion.list()

            def reservas = Reserva.executeQuery("from Reserva where fechaInicio < :fechaInicio and fechaFin > :fechaFin", [fechaInicio: fechaInicio, fechaFin: fechaFin])
        }
    }
}

