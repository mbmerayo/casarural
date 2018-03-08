package casarural

import grails.gorm.services.Service
import grails.plugin.springsecurity.annotation.Secured

@Service(Categoria)
@Secured("ROLE_ADMIN")
interface CategoriaService {

    Categoria get(Serializable id)

    List<Categoria> list(Map args)

    Long count()

    void delete(Serializable id)

    Categoria save(Categoria categoria)

}