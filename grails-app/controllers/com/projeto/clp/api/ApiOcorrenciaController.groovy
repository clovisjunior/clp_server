package com.projeto.clp.api

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.*

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ApiOcorrenciaController extends RestfulController{

	static responseFormats = ['json', 'xml']
	
	def springSecurityService

    def pendentes() { 

    	def usuarioMovel = springSecurityService.currentUser
		
		def maquinas = usuarioMovel?.maquinas
		
		def criteriaOcorrencia = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteriaOcorrencia.list {
			isNull("usuarioMovel")
			estado {
				eq("descricao", "Aberto")
			}
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
		}
		
		JSON.use("deep") {
			respond ocorrencias
		}

    }

    def caixaEntrada() {
    	def usuarioMovel = springSecurityService.currentUser
		
		def maquinas = usuarioMovel?.maquinas
		
		def criteriaOcorrencia = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteriaOcorrencia.list {
			eq("usuarioMovel", usuarioMovel)
			estado {
				eq("descricao", "Aberto")
			}
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
		}

		JSON.use("deep") {
			respond ocorrencias
		}
    }

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

    def finalizar() {

		def usuarioMovel = springSecurityService.currentUser	
		def ocorrencia = OcorrenciaAlarme.get(params.id)
		
		def foto = new Foto(imagem: params.file?.decodeBase64())

		EstadoOcorrenciaAlarme estado = EstadoOcorrenciaAlarme.findByDescricao("Fechado")
		
		if(!estado){
			estado = new EstadoOcorrenciaAlarme(descricao: "Fechado")
			estado.save flush: true
		}

		ocorrencia.estado = estado
		ocorrencia.motivoAlarmeTecnico = params.motivoAlarmeTecnico
		ocorrencia.solucaoAplicada = params.solucaoAplicada
		ocorrencia.addToFotos(foto)

		ocorrencia.save(flush: true)			
			
		if(ocorrencia.hasErrors()){
    		respond INTERNAL_SERVER_ERROR
    	}
    	else{
    		respond OK
    	}
	}
}
