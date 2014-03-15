package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistradorEscravoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegistradorEscravo.list(params), model:[registradorEscravoInstanceCount: RegistradorEscravo.count()]
    }

    def show(RegistradorEscravo registradorEscravoInstance) {
        respond registradorEscravoInstance
    }

    def create() {
        respond new RegistradorEscravo(params)
    }

    @Transactional
    def save(RegistradorEscravo registradorEscravoInstance) {
        if (registradorEscravoInstance == null) {
            notFound()
            return
        }

        if (registradorEscravoInstance.hasErrors()) {
            respond registradorEscravoInstance.errors, view:'create'
            return
        }

        registradorEscravoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registradorEscravoInstance.label', default: 'RegistradorEscravo'), registradorEscravoInstance.id])
                redirect registradorEscravoInstance
            }
            '*' { respond registradorEscravoInstance, [status: CREATED] }
        }
    }

    def edit(RegistradorEscravo registradorEscravoInstance) {
        respond registradorEscravoInstance
    }

    @Transactional
    def update(RegistradorEscravo registradorEscravoInstance) {
        if (registradorEscravoInstance == null) {
            notFound()
            return
        }

        if (registradorEscravoInstance.hasErrors()) {
            respond registradorEscravoInstance.errors, view:'edit'
            return
        }

        registradorEscravoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegistradorEscravo.label', default: 'RegistradorEscravo'), registradorEscravoInstance.id])
                redirect registradorEscravoInstance
            }
            '*'{ respond registradorEscravoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegistradorEscravo registradorEscravoInstance) {

        if (registradorEscravoInstance == null) {
            notFound()
            return
        }

        registradorEscravoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegistradorEscravo.label', default: 'RegistradorEscravo'), registradorEscravoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registradorEscravoInstance.label', default: 'RegistradorEscravo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
