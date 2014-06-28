package com.projeto.clp

import static org.springframework.http.HttpStatus.*

import java.util.Set;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaquinaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def modbusService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Maquina.list(params), model:[maquinaInstanceCount: Maquina.count()]
    }

    def show(Maquina maquinaInstance) {
        respond maquinaInstance
    }

    def create() {
        respond new Maquina(params)
    }

    @Transactional
    def save(Maquina maquinaInstance) {
        if (maquinaInstance == null) {
            notFound()
            return
        }

        if (maquinaInstance.hasErrors()) {
            respond maquinaInstance.errors, view:'create'
            return
        }

        maquinaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maquinaInstance.label', default: 'Maquina'), maquinaInstance.id])
                redirect action: "show", resource: maquinaInstance
            }
            '*' { respond maquinaInstance, [status: CREATED] }
        }
    }

    def edit(Maquina maquinaInstance) {
        respond maquinaInstance
    }

    @Transactional
    def update(Maquina maquinaInstance) {
        if (maquinaInstance == null) {
            notFound()
            return
        }

        if (maquinaInstance.hasErrors()) {
            respond maquinaInstance.errors, view:'edit'
            return
        }

        maquinaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Maquina.label', default: 'Maquina'), maquinaInstance.id])
                redirect action: "show", resource: maquinaInstance
            }
            '*'{ respond maquinaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Maquina maquinaInstance) {

        if (maquinaInstance == null) {
            notFound()
            return
        }

        maquinaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Maquina.label', default: 'Maquina'), maquinaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquinaInstance.label', default: 'Maquina'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def testeConexao(){
		Maquina maquina = Maquina.get(params.id)
		
		render modbusService.testarConexao(maquina)
	}
	
	def listarEscravos(){
		Maquina maquina = Maquina.get(params.id)
		
		def escravosId = modbusService.pesquisarEscravos(maquina)
		
		def escravos = []
		
		escravosId.each {
			escravos << new EscravoMaquina(maquina: maquina, escravoId: it)
		}
		
		render(template: "list_escravos", model: [escravoMaquinaList: escravos])
	}
	
	def addEscravoMaquina(){
		
		Maquina maquina = Maquina.get(params.id)
		println params.dados?.split('\\|')
		def escravoId = params.dados?.split('\\|')[0]
		def identificador = params.dados?.split('\\|')[1]
		def descricao = params.dados?.split('\\|')[2]
		
		EscravoMaquina escravoMaquina = EscravoMaquina.findByMaquinaAndEscravoId(maquina, escravoId)
		
		if(escravoMaquina == null){ 
			escravoMaquina = new EscravoMaquina(escravoId: escravoId, identificador: identificador, descricao: descricao, maquina: maquina)
		}
		else{
			escravoMaquina.identificador = identificador
			escravoMaquina.descricao = descricao
		}
		
		escravoMaquina.save(flush: true)
		
		render ""
	}
}
