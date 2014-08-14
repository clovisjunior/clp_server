package com.projeto.clp.api

import grails.rest.RestfulController
import grails.transaction.Transactional

import com.projeto.clp.DispositivoMovel

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ApiDispositivoController extends RestfulController{
	
	static responseFormats = ['json', 'xml']
	
	def springSecurityService
	def modbusService
	
	ApiDispositivoController(){
		super(DispositivoMovel)
	}

	def registrarGCM(){
		String gcmId = params.GCM_ID
		String imei = params.imei
		
		def dispositivo = DispositivoMovel.findByImei(imei)

		if(!dispositivo){
			respond NOT_FOUND		
		}

		dispositivo.gcmId = gcmId
		dispositivo.save(flush: true)		

		respond OK
	}
    
}
