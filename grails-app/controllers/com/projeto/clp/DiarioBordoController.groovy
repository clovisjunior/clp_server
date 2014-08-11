package com.projeto.clp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class DiarioBordoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def maquina = Maquina.get(params.'maquina.id')
        def list = DiarioBordo.findAllByMaquina(maquina)
        
        respond list, model:[diarioBordoInstanceCount: list.size()]
    }

    def show(DiarioBordo diarioBordoInstance) {
        respond diarioBordoInstance
    }

    def create() {
        respond new DiarioBordo(params)
    }

    @Transactional
    def save(DiarioBordo diarioBordoInstance) {
        if (diarioBordoInstance == null) {
            notFound()
            return
        }

        if (diarioBordoInstance.hasErrors()) {
            respond diarioBordoInstance.errors, view:'create'
            return
        }

        diarioBordoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diarioBordoInstance.label', default: 'DiarioBordo'), diarioBordoInstance.id])
                redirect diarioBordoInstance
            }
            '*' { respond diarioBordoInstance, [status: CREATED] }
        }
    }

    def edit(DiarioBordo diarioBordoInstance) {
        respond diarioBordoInstance
    }

    @Transactional
    def update(DiarioBordo diarioBordoInstance) {
        if (diarioBordoInstance == null) {
            notFound()
            return
        }

        if (diarioBordoInstance.hasErrors()) {
            respond diarioBordoInstance.errors, view:'edit'
            return
        }

        diarioBordoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DiarioBordo.label', default: 'DiarioBordo'), diarioBordoInstance.id])
                redirect diarioBordoInstance
            }
            '*'{ respond diarioBordoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DiarioBordo diarioBordoInstance) {

        if (diarioBordoInstance == null) {
            notFound()
            return
        }

        diarioBordoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DiarioBordo.label', default: 'DiarioBordo'), diarioBordoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def viewImage() {
        def foto = Foto.get(params.id)
        byte[] imagem = foto.imagem
        response.outputStream << imagem
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diarioBordoInstance.label', default: 'DiarioBordo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
