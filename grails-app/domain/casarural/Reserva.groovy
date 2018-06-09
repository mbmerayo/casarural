package casarural

import casarural.auth.User
/*import grails.rest.*

@Resource(uri = '/api/reserva', readOnly = false, formats = ['json','xml'])*/
class Reserva {
    Date fecha
    Date fechaInicio
    Date fechaFin
    Estado estado

    static belongsTo = [user: User]
    static hasMany = [habitaciones: Habitacion]

    static constraints = {
        fecha nullable: false, blank: false
        estado nullable: false, blank: false
    }

    enum Estado{
        Disponible('Disponible',1),
        Reservada('Reservada',2),
        Cancelada('Cancelada',3)
        String text
        Integer estado

        Estado(String text, Integer estado){
            this.text = text
            this.estado = estado
        }

        /**
         * Método que devuelve un map con los estados
         * para poder crear el combo de estados
         * @return
         */
        static Map getEstados(){
            Map estados = new HashMap()
            values().each{
                estados.put(it.estado,it.text)
            }
            return estados
        }

        static Estado valueOfName(String text){
            values().find{it.text == text}
        }
        static Estado valueOfKey(Integer key){
            values().find{it.estado == key}
        }
    }
}
