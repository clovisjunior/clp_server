package com.projeto.clp

import grails.transaction.Transactional


@Transactional
class OcorrenciaService {

	def androidGcmService
	def grailsApplication
	
    def synchronized criarOcorrencia(alarme, valor){
		
		println "Ocorrencia: ${alarme}, Valor: ${valor}"
		
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

		def deviceToken = 'APA91bG0Oh--vVZx8o0E310FK91_fWwJtwM0OIkUShqBBBPH1G0T2Acag9sJiVLVEkHzjU6Vek7eJIBPqe92gnqMU5mnwglwinJluKK0WS3Xz8v3ycyG_MqkLC4RUyG8xgT3AYRv-pUNSqCdsFsDWxMQ_BCNYgVrtQ'
		                   
		def apiKey = grailsApplication.config.android.gcm.api.key

		def msg = "${ocorrencia?.alarme?.maquina} - ${ocorrencia?.alarme?.registradorEscravo?.identificador} - ${valor}"

		def messages = ["message_id": msg]

		androidGcmService.sendMessage(messages, [deviceToken], 'Teste', apiKey)

	}
}
