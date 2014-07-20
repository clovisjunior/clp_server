package com.projeto.clp.security

import org.springframework.security.core.AuthenticationException

class UsuarioMovelDispositivoMovelNotAllowedException extends AuthenticationException {
	
	UsuarioMovelDispositivoMovelNotAllowedException(String msg){
		super(msg)
	}

}
