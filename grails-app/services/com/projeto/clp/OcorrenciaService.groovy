package com.projeto.clp

import grails.transaction.Transactional


@Transactional
class OcorrenciaService {
	
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
			//sendNotification()
		}
	}
}
