package com.projeto.clp


import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException

import com.odobo.grails.plugin.springsecurity.rest.RestAuthenticationProvider
import com.odobo.grails.plugin.springsecurity.rest.RestAuthenticationToken
import com.odobo.grails.plugin.springsecurity.rest.token.storage.TokenStorageService

class ProjetoCLPRestAuthenticationProvider extends RestAuthenticationProvider {
	
	@Override
	Authentication authenticate(Authentication authentication) throws AuthenticationException {

       	println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		println authentication


        return super.authenticate(authentication)
    }
	
	@Override
	boolean supports(Class<?> authentication) {
		return RestAuthenticationToken.isAssignableFrom(authentication)
	}

}