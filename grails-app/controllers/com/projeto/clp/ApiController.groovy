package com.projeto.clp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder

@Transactional(readOnly = true)
class ApiController  {
	
	def springSecurityService
	def authenticationManager
	
	def login() {
		try {

			println "*" * 100
			println ">> ${params}"
			def imei = params.imei

			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(params.username, params.password);
			// Authenticate the user
			def authentication = authenticationManager.authenticate(authRequest);

			def usuarioMovel = UsuarioMovel.findByUsername(params.username)

			if(usuarioMovel){

				boolean hasDispositivo = false

				usuarioMovel.dispositivosMoveis { dispositivo ->
					if(dispositivo.imei == imei){
						hasDispositivo = true
					}
				}

				if(hasDispositivo){

					def securityContext = SecurityContextHolder.getContext();
					securityContext.setAuthentication(authentication);

					// Create a new session and add the security context.
					def session = request.session;
					session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
					render status:OK
				}
				else{
					render status: FORBIDDEN 
				}

			}
			else{
				render status: FORBIDDEN 
			}
		}
		catch (e){
			render status: FORBIDDEN
		}
	}
    
}
