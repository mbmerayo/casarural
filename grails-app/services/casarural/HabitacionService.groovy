package casarural

import grails.gorm.services.Service

@Service(Habitacion)
interface HabitacionService {

    Habitacion get(Serializable id)

    List<Habitacion> list(Map args)

    Long count()

    void delete(Serializable id)

    Habitacion save(Habitacion habitacion)

}