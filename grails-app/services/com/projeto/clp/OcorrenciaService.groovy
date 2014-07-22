package com.projeto.clp

import grails.transaction.Transactional


@Transactional
class OcorrenciaService {

	def androidGcmService
	def grailsApplication
	
    def synchronized criarOcorrencia(alarme, valor){
		
		EstadoOcorrenciaAlarme estado = EstadoOcorrenciaAlarme.findByDescricao("Aberto")
		
		if(!estado){
			estado = new EstadoOcorrenciaAlarme(descricao: "Aberto")
			estado.save flush: true
		}
		
		def ocorrencia = OcorrenciaAlarme.findByAlarmeAndEstado(alarme, estado)
		
		if(!ocorrencia){
			ocorrencia = new OcorrenciaAlarme(alarme: alarme, motivoAlarme: "Valor [${valor}] - [${alarme.minimo}, ${alarme.maximo}]", estado: estado)
			ocorrencia.save flush: true			
			sendNotification(ocorrencia, valor)
		}
	}

	def sendNotification(OcorrenciaAlarme ocorrencia, valor){
	                   
		def apiKey = grailsApplication.config.android.gcm.api.key

		def msg = "${ocorrencia?.alarme?.maquina} - ${ocorrencia?.alarme?.registradorEscravo?.identificador} - ${valor}"

		def messages = ["message_id": msg]

		def criteria = UsuarioMovel.createCriteria()

		def usuarios = criteria.list {
			maquinas{
				eq("id", ocorrencia?.alarme?.maquina?.id)
			}
		}

		def deviceToken = []

		usuarios.each { usuario ->

			usuario.dispositivosMoveis?.each{ dispositivo ->

				deviceToken << dispositivo.gcmId					
			}
		}

		androidGcmService.sendMessage(messages, deviceToken, 'Alarme', apiKey)	
	
	}
}
