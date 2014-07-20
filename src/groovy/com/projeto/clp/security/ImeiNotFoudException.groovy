package com.projeto.clp.security

import org.springframework.security.core.AuthenticationException

class ImeiNotFoudException extends AuthenticationException {
	
	ImeiNotFoudException(String msg){
		super(msg)
	}
	
	

}
