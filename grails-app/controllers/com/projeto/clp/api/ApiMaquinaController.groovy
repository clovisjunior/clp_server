package com.projeto.clp.api

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.EscravoMaquina;
import com.projeto.clp.RegistradorEscravo;
import com.projeto.clp.Maquina
import com.projeto.clp.Foto
import com.projeto.clp.DiarioBordo

import static org.springframework.http.HttpStatus.*

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

	def salvarDiarioBordo() {

		def usuarioMovel = springSecurityService.currentUser	
		def maquina = Maquina.get(params.id)
		
		DiarioBordo.withTransaction { status ->
			def foto = new Foto(imagem: params.file?.decodeBase64())

			def diarioBordo = new DiarioBordo(maquina: maquina, usuarioMovel: usuarioMovel, descricao: params.description, dataHora: new Date())
			diarioBordo.addToFotos(foto)

			diarioBordo.save(flush: true)			
		}
		
		respond OK
	}

	def atualizarValorRegistrador() {

		def registrador = RegistradorEscravo.get(params.idRegistrador)

		if(registrador != null){

			def novoValor = params.valor
		
			if(modbusService.atualizarValorRegistrador(registrador, novoValor)){
				respond OK	
			}
			else{
				respond NOT_FOUND	
			}
			
		}
		else{
			respond NOT_FOUND
		}
	}
}
