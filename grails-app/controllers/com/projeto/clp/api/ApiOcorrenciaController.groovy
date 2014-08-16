package com.projeto.clp.api

import com.projeto.clp.type.EstadoOcorrenciaType

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.*

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ApiOcorrenciaController extends RestfulController{

	static responseFormats = ['json', 'xml']
	
	def springSecurityService

	@Transactional
    def pendentes() { 

    	def usuarioMovel = springSecurityService.currentUser
		
		def maquinas = usuarioMovel?.maquinas
		
		def criteriaOcorrencia = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteriaOcorrencia.list {
			isNull("usuarioMovel")
			eq("estado", EstadoOcorrenciaType.ABERTO)
			alarme {
				'in' ("maquina", maquinas)
			}
		}

		ocorrencias.each {
			it.usuarioMovel = null
			it.fotos = null
			it.alarme.escravoMaquina = null
			it.alarme.registradorEscravo = null
			it.alarme.ocorrencias = null
			it.alarme.maquina.departamento = null
			it.alarme.maquina.escravos = null
			it.alarme.maquina.alarmes = null
		}
		
		JSON.use("deep") {
			respond ocorrencias
		}

    }

	@Transactional
    def caixaEntrada() {
    	def usuarioMovel = springSecurityService.currentUser
		
		def maquinas = usuarioMovel?.maquinas
		
		def criteriaOcorrencia = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteriaOcorrencia.list {
			eq("usuarioMovel", usuarioMovel)
			eq("estado", EstadoOcorrenciaType.ABERTO)
			alarme {
				'in' ("maquina", maquinas)
			}
		}

		ocorrencias.each {
			it.usuarioMovel = null
			it.fotos = null
			it.alarme.escravoMaquina = null
			it.alarme.registradorEscravo = null
			it.alarme.ocorrencias = null
			it.alarme.maquina.departamento = null
			it.alarme.maquina.escravos = null
			it.alarme.maquina.alarmes = null
		}

		JSON.use("deep") {
			respond ocorrencias
		}
    }

    @Transactional
    def aceitar() {

    	def ocorrencia = OcorrenciaAlarme.get(params.id)

    	ocorrencia.usuarioMovel = springSecurityService.currentUser

    	ocorrencia.save(flush: true)

    	if(ocorrencia.hasErrors()){
    		respond INTERNAL_SERVER_ERROR
    	}
    	else{
    		respond OK
    	}
    	
    }

    @Transactional
    def finalizar() {

		def usuarioMovel = springSecurityService.currentUser	
		def ocorrencia = OcorrenciaAlarme.get(params.id)
		
		def foto = new Foto(imagem: params.file?.decodeBase64())

		ocorrencia.estado = EstadoOcorrenciaType.FECHADO
		ocorrencia.motivoAlarmeTecnico = params.motivoAlarmeTecnico
		ocorrencia.solucaoAplicada = params.solucaoAplicada
		ocorrencia.dataFechamento = new Date()
		ocorrencia.addToFotos(foto)

		ocorrencia.save(flush: true)			
			
		if(ocorrencia.hasErrors()){
    		respond INTERNAL_SERVER_ERROR
    	}
    	else{
    		respond OK
    	}
	}

	@Transactional
	def dashboard() {

		def usuarioMovel = springSecurityService.currentUser
		
		def maquinas = usuarioMovel?.maquinas
		
		def criteriaOcorrencia = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteriaOcorrencia.list {
		    eq("usuarioMovel", usuarioMovel)
		    between("dataAbertura", new Date().minus(7), new Date())		    
		    alarme {
		        'in' ("maquina", maquinas)
		    }		
		    projections {
		    	property("dataAbertura")
		    	property("estado")		    	
		    }    
		    order("dataAbertura", "asc")
		}				

		def group = ocorrencias.groupBy({it[0].format("dd/MM")}, {it[1]})
		
		StringBuilder sb = new StringBuilder()

		sb.append("{")
		group.each { key, value ->
			sb.append('{"dia": "')
			sb.append(key)
			sb.append('", ')
			
			value.each{ key1, value1 ->
				sb.append('"')
				sb.append(key1)
				sb.append('": ')
				sb.append(value1.size())
				sb.append(', ')
			}

			sb.append("}, ")
		}
		sb.append("}")
		
		render text: sb.toString(), contentType: "application/json", encoding: "UTF-8"
		
	}
}
