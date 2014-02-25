package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdministradorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Administrador.list(params), model:[administradorInstanceCount: Administrador.count()]
    }

    def show(Administrador administradorInstance) {
        respond administradorInstance
    }

    def create() {
        respond new Administrador(params)
    }

    @Transactional
    def save(Administrador administradorInstance) {
        if (administradorInstance == null) {
            notFound()
            return
        }

        if (administradorInstance.hasErrors()) {
            respond administradorInstance.errors, view:'create'
            return
        }

        administradorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'administradorInstance.label', default: 'Administrador'), administradorInstance.id])
                redirect administradorInstance
            }
            '*' { respond administradorInstance, [status: CREATED] }
        }
    }

    def edit(Administrador administradorInstance) {
        respond administradorInstance
    }

    @Transactional
    def update(Administrador administradorInstance) {
        if (administradorInstance == null) {
            notFound()
            return
        }

        if (administradorInstance.hasErrors()) {
            respond administradorInstance.errors, view:'edit'
            return
        }

        administradorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Administrador.label', default: 'Administrador'), administradorInstance.id])
                redirect administradorInstance
            }
            '*'{ respond administradorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Administrador administradorInstance) {

        if (administradorInstance == null) {
            notFound()
            return
        }

        administradorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Administrador.label', default: 'Administrador'), administradorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'administradorInstance.label', default: 'Administrador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
