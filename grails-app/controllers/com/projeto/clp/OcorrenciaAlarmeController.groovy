package com.projeto.clp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import com.projeto.clp.type.EstadoOcorrenciaType

@Transactional(readOnly = true)
class OcorrenciaAlarmeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def entidade = springSecurityService.currentUser

        def unidadesNegocios = UnidadeDeNegocio.findAllByEntidade(entidade)
        def departamentos = []

        unidadesNegocios?.each {
            it.departamentos?.each { departamento ->
                departamentos << departamento
            }
        }

        def dispositivosMoveis = []

        departamentos?.each {
            it.dispositivosMoveis?.each { dispotivoMovel ->
                dispositivosMoveis << dispotivoMovel
            }
        }

        def maquinas = []

        departamentos?.each { departamento ->
            departamento.maquinas?.each { maquina ->
                maquinas << maquina
            }
        }

        def ocorrencias = []

        maquinas?.each { maquina ->
            maquinas.alarmes?.each { alarme ->
                alarme.ocorrencias?.each { ocorrencia ->
                    ocorrencias << ocorrencias
                }                
            }
        }

        respond ocorrencias, model:[ocorrenciaAlarmeInstanceList: ocorrencias, ocorrenciaAlarmeInstanceCount: ocorrencias.size()]
    }

    def show(OcorrenciaAlarme ocorrenciaAlarmeInstance) {
        respond ocorrenciaAlarmeInstance
    }

    
    @Transactional
    def save(OcorrenciaAlarme ocorrenciaAlarmeInstance) {
        if (ocorrenciaAlarmeInstance == null) {
            notFound()
            return
        }

        if (ocorrenciaAlarmeInstance.hasErrors()) {
            respond ocorrenciaAlarmeInstance.errors, view:'create'
            return
        }

        ocorrenciaAlarmeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ocorrenciaAlarmeInstance.label', default: 'OcorrenciaAlarme'), ocorrenciaAlarmeInstance.id])
                redirect ocorrenciaAlarmeInstance
            }
            '*' { respond ocorrenciaAlarmeInstance, [status: CREATED] }
        }
    }

    def edit(OcorrenciaAlarme ocorrenciaAlarmeInstance) {
        respond ocorrenciaAlarmeInstance
    }

    @Transactional
    def update(OcorrenciaAlarme ocorrenciaAlarmeInstance) {

        if (ocorrenciaAlarmeInstance == null) {
            notFound()
            return
        }

        ocorrenciaAlarmeInstance.estado = EstadoOcorrenciaType.get(params.'estado.id' as Integer)

        if (ocorrenciaAlarmeInstance.hasErrors()) {
            respond ocorrenciaAlarmeInstance.errors, view:'edit'
            return
        }

        ocorrenciaAlarmeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OcorrenciaAlarme.label', default: 'OcorrenciaAlarme'), ocorrenciaAlarmeInstance.id])
                redirect ocorrenciaAlarmeInstance
            }
            '*'{ respond ocorrenciaAlarmeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OcorrenciaAlarme ocorrenciaAlarmeInstance) {

        if (ocorrenciaAlarmeInstance == null) {
            notFound()
            return
        }

        ocorrenciaAlarmeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OcorrenciaAlarme.label', default: 'OcorrenciaAlarme'), ocorrenciaAlarmeInstance.id])
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ocorrenciaAlarmeInstance.label', default: 'OcorrenciaAlarme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def ocorrenciaAbertas() {


    }

    def ocorrenciasFechadas() {
        
    }

}
