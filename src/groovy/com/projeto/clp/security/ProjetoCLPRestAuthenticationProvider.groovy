package com.projeto.clp.security




import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.authentication.dao.DaoAuthenticationProvider
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

import com.projeto.clp.DispositivoMovel;
import com.projeto.clp.UsuarioMovel;

class ProjetoCLPRestAuthenticationProvider extends DaoAuthenticationProvider {

	String imei

	@Override
	Authentication authenticate(Authentication authentication) throws AuthenticationException {

		Boolean isUsuarioMovel = false

		if(UsuarioMovel.findByUsername(authentication.principal)){
			isUsuarioMovel = true
			imei = authentication.credentials[1]
			authentication.credentials = authentication.credentials[0]
		}
		
		setPasswordEncoder(new BCryptPasswordEncoder(10))
		
		Authentication auth = super.authenticate(authentication);

		if(isUsuarioMovel){

			UsuarioMovel.withNewSession { session ->
				UsuarioMovel usuarioMovel = UsuarioMovel.findByUsername(authentication.principal)
				def dispositivos = usuarioMovel.dispositivosMoveis

				DispositivoMovel dispositivo = DispositivoMovel.findByImei(imei)

				if(dispositivo == null){
					throw new ImeiNotFoudException("IMEI not registred")
				}

				Boolean hasAccess = false

				dispositivos.each{			
					if(it.id == dispositivo.id){					
						hasAccess = true
					}
				}

				if(!hasAccess){
					throw new UsuarioMovelDispositivoMovelNotAllowedException("User doesn't have privileges to access this device")
				}
			}
		}

		return auth
	}


	@Override
	boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.isAssignableFrom(authentication)
	}


}