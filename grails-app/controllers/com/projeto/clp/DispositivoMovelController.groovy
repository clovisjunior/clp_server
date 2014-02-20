package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DispositivoMovelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DispositivoMovel.list(params), model:[dispositivoMovelInstanceCount: DispositivoMovel.count()]
    }

    def show(DispositivoMovel dispositivoMovelInstance) {
        respond dispositivoMovelInstance
    }

    def create() {
        respond new DispositivoMovel(params)
    }

    @Transactional
    def save(DispositivoMovel dispositivoMovelInstance) {
        if (dispositivoMovelInstance == null) {
            notFound()
            return
        }

        if (dispositivoMovelInstance.hasErrors()) {
            respond dispositivoMovelInstance.errors, view:'create'
            return
        }

        dispositivoMovelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dispositivoMovelInstance.label', default: 'DispositivoMovel'), dispositivoMovelInstance.id])
                redirect dispositivoMovelInstance
            }
            '*' { respond dispositivoMovelInstance, [status: CREATED] }
        }
    }

    def edit(DispositivoMovel dispositivoMovelInstance) {
        respond dispositivoMovelInstance
    }

    @Transactional
    def update(DispositivoMovel dispositivoMovelInstance) {
        if (dispositivoMovelInstance == null) {
            notFound()
            return
        }

        if (dispositivoMovelInstance.hasErrors()) {
            respond dispositivoMovelInstance.errors, view:'edit'
            return
        }

        dispositivoMovelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DispositivoMovel.label', default: 'DispositivoMovel'), dispositivoMovelInstance.id])
                redirect dispositivoMovelInstance
            }
            '*'{ respond dispositivoMovelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DispositivoMovel dispositivoMovelInstance) {

        if (dispositivoMovelInstance == null) {
            notFound()
            return
        }

        dispositivoMovelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DispositivoMovel.label', default: 'DispositivoMovel'), dispositivoMovelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dispositivoMovelInstance.label', default: 'DispositivoMovel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
