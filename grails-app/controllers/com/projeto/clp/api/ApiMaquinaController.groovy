package com.projeto.clp.api

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.EscravoMaquina;
import com.projeto.clp.Maquina

@Transactional(readOnly = true)
class ApiMaquinaController extends RestfulController{
	
	static responseFormats = ['json', 'xml']
	
	def springSecurityService
	def modbusService
	
	ApiMaquinaController(){
		super(Maquina)
	}

    def index() {
		
		def usuarioMovel = springSecurityService.currentUser	
		
		def maquinas = usuarioMovel?.maquinas?.sort{ a, b ->
			a.identificador.compareToIgnoreCase b.identificador
		}
			
		respond maquinas
	}
	
	def escravos() {
		def maquina = Maquina.get(params.id)
		
		respond maquina?.escravos
	}
	
	def registradores() {		
		def escravo = EscravoMaquina.get(params.idEscravo)
		
		def registradores = escravo?.registradores?.sort{ a, b ->
			a.identificador.compareToIgnoreCase b.identificador
		}
		
		registradores?.each{
			it.valor = modbusService.lerDadoRegistrador(it)
		}
		
		respond registradores
	}
}
