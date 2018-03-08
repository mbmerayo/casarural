package casarural

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class HabitacionServiceSpec extends Specification {

    HabitacionService habitacionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Habitacion(...).save(flush: true, failOnError: true)
        //new Habitacion(...).save(flush: true, failOnError: true)
        //Habitacion habitacion = new Habitacion(...).save(flush: true, failOnError: true)
        //new Habitacion(...).save(flush: true, failOnError: true)
        //new Habitacion(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //habitacion.id
    }

    void "test get"() {
        setupData()

        expect:
        habitacionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Habitacion> habitacionList = habitacionService.list(max: 2, offset: 2)

        then:
        habitacionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        habitacionService.count() == 5
    }

    void "test delete"() {
        Long habitacionId = setupData()

        expect:
        habitacionService.count() == 5

        when:
        habitacionService.delete(habitacionId)
        sessionFactory.currentSession.flush()

        then:
        habitacionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Habitacion habitacion = new Habitacion()
        habitacionService.save(habitacion)

        then:
        habitacion.id != null
    }
}
