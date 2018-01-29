package casarural

class Habitacion {
    String descripcion
    Integer planta

    static belongsTo = [categoria: Categoria]

    static constraints = {
        planta nullable: false, blank: false
    }
}
