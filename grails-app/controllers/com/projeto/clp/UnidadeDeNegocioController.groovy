package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UnidadeDeNegocioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def usuarioService
    def springSecurityService

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        def unidadesNegocios = usuarioService.getUnidadesDeNegocio(params)
        def unidadesNegociosCount = usuarioService.getUnidadesDeNegocioCount()

        respond unidadesNegocios, model:[unidadeDeNegocioInstanceCount: unidadesNegociosCount]
    }

    def show(UnidadeDeNegocio unidadeDeNegocioInstance) {
        respond unidadeDeNegocioInstance
    }

    def create() {
        respond new UnidadeDeNegocio(params)
    }

    @Transactional
    def save(UnidadeDeNegocio unidadeDeNegocioInstance) {
        if (unidadeDeNegocioInstance == null) {
            notFound()
            return
        }

        def usuario = springSecurityService.currentUser

        usuario.unidadesNegocios = []

        unidadeDeNegocioInstance.entidade = usuario

        usuario.unidadesNegocios << unidadeDeNegocioInstance
        usuario.save flush: true


        if (unidadeDeNegocioInstance.hasErrors()) {
            respond unidadeDeNegocioInstance.errors, view:'create'
            return
        }

        unidadeDeNegocioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'unidadeDeNegocioInstance.label', default: 'UnidadeDeNegocio'), unidadeDeNegocioInstance.id])
                redirect unidadeDeNegocioInstance
            }
            '*' { respond unidadeDeNegocioInstance, [status: CREATED] }
        }
    }

    def edit(UnidadeDeNegocio unidadeDeNegocioInstance) {
        respond unidadeDeNegocioInstance
    }

    @Transactional
    def update(UnidadeDeNegocio unidadeDeNegocioInstance) {
        if (unidadeDeNegocioInstance == null) {
            notFound()
            return
        }

        if (unidadeDeNegocioInstance.hasErrors()) {
            respond unidadeDeNegocioInstance.errors, view:'edit'
            return
        }

        unidadeDeNegocioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UnidadeDeNegocio.label', default: 'UnidadeDeNegocio'), unidadeDeNegocioInstance.id])
                redirect unidadeDeNegocioInstance
            }
            '*'{ respond unidadeDeNegocioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UnidadeDeNegocio unidadeDeNegocioInstance) {

        if (unidadeDeNegocioInstance == null) {
            notFound()
            return
        }

        unidadeDeNegocioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UnidadeDeNegocio.label', default: 'UnidadeDeNegocio'), unidadeDeNegocioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidadeDeNegocioInstance.label', default: 'UnidadeDeNegocio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
