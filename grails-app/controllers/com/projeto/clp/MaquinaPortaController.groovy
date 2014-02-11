package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaquinaPortaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MaquinaPorta.list(params), model:[maquinaPortaInstanceCount: MaquinaPorta.count()]
    }

    def show(MaquinaPorta maquinaPortaInstance) {
        respond maquinaPortaInstance
    }

    def create() {
        respond new MaquinaPorta(params)
    }

    @Transactional
    def save(MaquinaPorta maquinaPortaInstance) {
        if (maquinaPortaInstance == null) {
            notFound()
            return
        }

        if (maquinaPortaInstance.hasErrors()) {
            respond maquinaPortaInstance.errors, view:'create'
            return
        }

        maquinaPortaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maquinaPortaInstance.label', default: 'MaquinaPorta'), maquinaPortaInstance.id])
                redirect maquinaPortaInstance
            }
            '*' { respond maquinaPortaInstance, [status: CREATED] }
        }
    }

    def edit(MaquinaPorta maquinaPortaInstance) {
        respond maquinaPortaInstance
    }

    @Transactional
    def update(MaquinaPorta maquinaPortaInstance) {
        if (maquinaPortaInstance == null) {
            notFound()
            return
        }

        if (maquinaPortaInstance.hasErrors()) {
            respond maquinaPortaInstance.errors, view:'edit'
            return
        }

        maquinaPortaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MaquinaPorta.label', default: 'MaquinaPorta'), maquinaPortaInstance.id])
                redirect maquinaPortaInstance
            }
            '*'{ respond maquinaPortaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MaquinaPorta maquinaPortaInstance) {

        if (maquinaPortaInstance == null) {
            notFound()
            return
        }

        maquinaPortaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MaquinaPorta.label', default: 'MaquinaPorta'), maquinaPortaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquinaPortaInstance.label', default: 'MaquinaPorta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
