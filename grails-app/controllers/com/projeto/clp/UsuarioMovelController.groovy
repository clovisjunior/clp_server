package com.projeto.clp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioMovelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def usuarioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def usuarioMoveis = usuarioService.getUsuariosMoveis(params)
        def usuarioMoveisCount = usuarioService.getUsuariosMoveisCount()
        
        respond usuarioMoveis, model:[usuarioMovelInstanceCount: usuarioMoveisCount]
    }

    def show(UsuarioMovel usuarioMovelInstance) {
        respond usuarioMovelInstance
    }

    def create() {
        
        def departamentos = usuarioService.getDepartamentos(null)

        def dispositivosMoveis = usuarioService.getDispositivosMoveis(null)

        def maquinas = usuarioService.getMaquinas(null)

        respond new UsuarioMovel(params), model: [departamentos: departamentos, dispositivosMoveis: dispositivosMoveis, maquinas: maquinas]
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

        def userMovelPapel = Papel.findByAuthority('ROLE_USER_MOVEL')

        UsuarioPapel.create usuarioMovelInstance, userMovelPapel, true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioMovelInstance.label', default: 'UsuarioMovel'), usuarioMovelInstance.id])
                redirect usuarioMovelInstance
            }
            '*' { respond usuarioMovelInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioMovel usuarioMovelInstance) {

        def departamentos = usuarioService.getDepartamentos(null)

        def dispositivosMoveis = usuarioService.getDispositivosMoveis(null)

        def maquinas = usuarioService.getMaquinas(null)
        
        respond usuarioMovelInstance, model: [departamentos: departamentos, dispositivosMoveis: dispositivosMoveis, maquinas: maquinas]
    }

    @Transactional
    def update(UsuarioMovel usuarioMovelInstance) {
        if (usuarioMovelInstance == null) {
            notFound()
            return
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
