package com.projeto.clp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlarmeController {

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

        def alarmes = []

        maquinas?.each { maquina ->
            maquinas.alarmes?.each { alarme ->
                alarmes << alarme
            }
        }

        respond alarmes, model:[alarmeInstanceList: alarmes, alarmeInstanceCount: alarmes.size()]
    }

    def show(Alarme alarmeInstance) {
        respond alarmeInstance
    }

    def create() {

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


        respond new Alarme(params), model: [maquinas: maquinas]
    }

    @Transactional
    def save(Alarme alarmeInstance) {
        if (alarmeInstance == null) {
            notFound()
            return
        }

        if (alarmeInstance.hasErrors()) {
            respond alarmeInstance.errors, view:'create'
            return
        }

        alarmeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'alarmeInstance.label', default: 'Alarme'), alarmeInstance.id])
                redirect alarmeInstance
            }
            '*' { respond alarmeInstance, [status: CREATED] }
        }
    }

    def edit(Alarme alarmeInstance) {
        respond alarmeInstance
    }

    @Transactional
    def update(Alarme alarmeInstance) {
        if (alarmeInstance == null) {
            notFound()
            return
        }

        if (alarmeInstance.hasErrors()) {
            respond alarmeInstance.errors, view:'edit'
            return
        }

        alarmeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Alarme.label', default: 'Alarme'), alarmeInstance.id])
                redirect alarmeInstance
            }
            '*'{ respond alarmeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Alarme alarmeInstance) {

        if (alarmeInstance == null) {
            notFound()
            return
        }

        alarmeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Alarme.label', default: 'Alarme'), alarmeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alarmeInstance.label', default: 'Alarme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def preecherEscravos(){
		Maquina maquina = Maquina.get(params.maquinaId)
		
		render template: "select_escravos", model: [escravos: maquina?.escravos]
	}
	
	def preecherRegistradores(){
		EscravoMaquina escravo = EscravoMaquina.get(params.escravoId)
		
		render template: "select_registradores", model: [registradores: escravo?.registradores]
	}
	
}
