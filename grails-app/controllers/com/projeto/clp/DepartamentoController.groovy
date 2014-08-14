package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.rest.RestfulController;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DepartamentoController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def entidade = springSecurityService.currentUser

        def unidadesNegocios = UnidadeDeNegocio.findAllByEntidade(entidade, [params])
        def departamentos = []

        unidadesNegocios?.each {
            it.departamentos?.each { departamento ->
                departamentos << departamento
            }
        }
        
        respond departamentos, model:[departamentoInstanceList: departamentos, departamentoInstanceCount: departamentos.size()]
    }

    def show(Departamento departamentoInstance) {
        respond departamentoInstance
    }

    def create() {
        def entidade = springSecurityService.currentUser

        def unidadesNegocios = UnidadeDeNegocio.findAllByEntidade(entidade)

        respond new Departamento(params), model: [unidadesNegocios: unidadesNegocios]
    }

    @Transactional
    def save(Departamento departamentoInstance) {
        if (departamentoInstance == null) {
            notFound()
            return
        }

        if (departamentoInstance.hasErrors()) {
            respond departamentoInstance.errors, view:'create'
            return
        }

        departamentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamentoInstance.label', default: 'Departamento'), departamentoInstance.id])
                redirect departamentoInstance
            }
            '*' { respond departamentoInstance, [status: CREATED] }
        }
    }

    def edit(Departamento departamentoInstance) {
        def entidade = springSecurityService.currentUser

        def unidadesNegocios = UnidadeDeNegocio.findAllByEntidade(entidade)

        respond departamentoInstance, model: [unidadesNegocios: unidadesNegocios]
    
    }

    @Transactional
    def update(Departamento departamentoInstance) {
        if (departamentoInstance == null) {
            notFound()
            return
        }

        if (departamentoInstance.hasErrors()) {
            respond departamentoInstance.errors, view:'edit'
            return
        }

        departamentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Departamento.label', default: 'Departamento'), departamentoInstance.id])
                redirect departamentoInstance
            }
            '*'{ respond departamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Departamento departamentoInstance) {

        if (departamentoInstance == null) {
            notFound()
            return
        }

        departamentoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Departamento.label', default: 'Departamento'), departamentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamentoInstance.label', default: 'Departamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
