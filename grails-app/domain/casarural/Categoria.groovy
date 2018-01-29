package casarural

class Categoria {
    String descripcion
    Float precio

    static hasMany = [habitaciones: Habitacion]

    static constraints = {
        precio nullable: false, blank: false
    }
}
