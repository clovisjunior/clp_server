package com.projeto.clp.api

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.Maquina

@Transactional(readOnly = true)
class ApiMaquinaController extends RestfulController{
	
	static responseFormats = ['json', 'xml']
	
	def springSecurityService
	
	ApiMaquinaController(){
		super(Maquina)
	}

    def index() {
		
		def usuarioMovel = springSecurityService.currentUser
		
		respond usuarioMovel?.maquinas
	}
}
