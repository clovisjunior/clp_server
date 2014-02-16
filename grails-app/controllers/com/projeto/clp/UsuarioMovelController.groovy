package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioMovelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsuarioMovel.list(params), model:[usuarioMovelInstanceCount: UsuarioMovel.count()]
    }

    def show(UsuarioMovel usuarioMovelInstance) {
        respond usuarioMovelInstance
    }

    def create() {
        respond new UsuarioMovel(params)
    }

    @Transactional
    def save(UsuarioMovel usuarioMovelInstance) {
        if (usuarioMovelInstance == null) {
            notFound()
            return
        }
		
        if (usuarioMovelInstance.hasErrors()) {
            respond usuarioMovelInstance.errors, view:'create'
            return
        }

        usuarioMovelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioMovelInstance.label', default: 'UsuarioMovel'), usuarioMovelInstance.id])
                redirect usuarioMovelInstance
            }
            '*' { respond usuarioMovelInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioMovel usuarioMovelInstance) {
        respond usuarioMovelInstance
    }

    @Transactional
    def update(UsuarioMovel usuarioMovelInstance) {
        if (usuarioMovelInstance == null) {
            notFound()
            return
        }
		
		if(!params.maquinas){
			usuarioMovelInstance.maquinas = null
		}

        if (usuarioMovelInstance.hasErrors()) {
            respond usuarioMovelInstance.errors, view:'edit'
            return
        }

        usuarioMovelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsuarioMovel.label', default: 'UsuarioMovel'), usuarioMovelInstance.id])
                redirect usuarioMovelInstance
            }
            '*'{ respond usuarioMovelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsuarioMovel usuarioMovelInstance) {

        if (usuarioMovelInstance == null) {
            notFound()
            return
        }

        usuarioMovelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsuarioMovel.label', default: 'UsuarioMovel'), usuarioMovelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioMovelInstance.label', default: 'UsuarioMovel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
