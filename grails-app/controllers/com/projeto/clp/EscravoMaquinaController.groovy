package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EscravoMaquinaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EscravoMaquina.list(params), model:[escravoMaquinaInstanceCount: EscravoMaquina.count()]
    }

    def show(EscravoMaquina escravoMaquinaInstance) {
        respond escravoMaquinaInstance
    }

    def create() {
        respond new EscravoMaquina(params)
    }

    @Transactional
    def save(EscravoMaquina escravoMaquinaInstance) {
        if (escravoMaquinaInstance == null) {
            notFound()
            return
        }

        if (escravoMaquinaInstance.hasErrors()) {
            respond escravoMaquinaInstance.errors, view:'create'
            return
        }

        escravoMaquinaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'escravoMaquinaInstance.label', default: 'EscravoMaquina'), escravoMaquinaInstance.id])
                redirect controller: "maquina", action: "show", id: escravoMaquinaInstance?.maquina?.id
            }
            '*' { respond escravoMaquinaInstance, [status: CREATED] }
        }
    }

    def edit(EscravoMaquina escravoMaquinaInstance) {
        respond escravoMaquinaInstance
    }

    @Transactional
    def update(EscravoMaquina escravoMaquinaInstance) {
        if (escravoMaquinaInstance == null) {
            notFound()
            return
        }

        if (escravoMaquinaInstance.hasErrors()) {
            respond escravoMaquinaInstance.errors, view:'edit'
            return
        }

        escravoMaquinaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EscravoMaquina.label', default: 'EscravoMaquina'), escravoMaquinaInstance.id])
                redirect controller: "maquina", action: "show", id: escravoMaquinaInstance?.maquina?.id
            }
            '*'{ respond escravoMaquinaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EscravoMaquina escravoMaquinaInstance) {

        if (escravoMaquinaInstance == null) {
            notFound()
            return
        }

        escravoMaquinaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EscravoMaquina.label', default: 'EscravoMaquina'), escravoMaquinaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'escravoMaquinaInstance.label', default: 'EscravoMaquina'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
