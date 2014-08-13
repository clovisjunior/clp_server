package com.projeto.clp

import grails.transaction.Transactional

import com.projeto.clp.type.EstadoOcorrenciaType

@Transactional
class OcorrenciaService {

	def androidGcmService
	def grailsApplication
	def springSecurityService
	
    def synchronized criarOcorrencia(alarme, valor){				
		
		def ocorrencia = OcorrenciaAlarme.findByAlarmeAndEstado(alarme, EstadoOcorrenciaType.ABERTO)
		
		if(!ocorrencia){
			ocorrencia = new OcorrenciaAlarme(alarme: alarme, motivoAlarme: "Valor [${valor}] - [${alarme.minimo}, ${alarme.maximo}]", estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date())
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

	def quantidadeOcorrencias(EstadoOcorrenciaType estado){

		def usuario = springSecurityService.currentUser

		def criteria = OcorrenciaAlarme.createCriteria()

		def qtde = criteria.get {
			eq("estado", estado)
			alarme{
				maquina{
					departamento{
						unidadeNegocio{
							eq("entidade", usuario)
						}
					}
				}
			}
			projections {
				count("id")
			}
		}

		return qtde

	}
	
}
